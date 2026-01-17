export PATH := $(realpath usr/bin):$(PATH)
export SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c

CC=cosmocc

OUT_STAGE			:= out/stage
OUT_BIN				:= out/bin

# zc vars
ZC_SRC_ROOT			:= third-party/Zen-C

ZC_ENTRY_O			:= $(OUT_STAGE)/zc-ape/zc_entry.o

ZC_BIN				:= $(OUT_STAGE)/zc.com
ZC					:= $(OUT_BIN)/zc.com

# zc-boot vars
ZC_BOOT_SRC_ROOT	:= zc-boot

ZC_BOOT_SRC			:= $(ZC_BOOT_SRC_ROOT)/boot.zc

ZC_BOOT_BIN			:= $(OUT_STAGE)/zc-boot.com
ZC_BOOT				:= $(OUT_BIN)/zc-boot.com

# phony targets
all: $(ZC) $(ZC_BOOT)

clean:
	rm -rf out

.PHONY: all clean

# zc targets
$(ZC_ENTRY_O): zc-ape/zc_entry.c
	@mkdir -p $(@D)
	$(CC) -c $< -o $@

$(ZC_BIN): $(ZC_ENTRY_O) $(ZC_SRC_ROOT)/Makefile
	@mkdir -p $(@D)
	$(MAKE) -C $(ZC_SRC_ROOT) \
		PLUGINS= \
		CC=$(CC) \
		LIBS="$(abspath $(ZC_ENTRY_O)) -Wl,--wrap=main" \
		TARGET="$(abspath $@)";

$(ZC): $(ZC_BIN)
	@mkdir -p $(@D)
	@cp -f $(ZC_BIN) $(wildcard $(ZC_BIN).*) "$(@D)"; \
	(cd $(ZC_SRC_ROOT) && zip -r "$(abspath $@)" std.zc std LICENSE);

# zc-boot targets
$(ZC_BOOT_BIN): $(ZC_BOOT_SRC)
	$(ZC) build --cc $(CC) -o $@ $<

$(ZC_BOOT): $(ZC_BOOT_BIN) $(realpath $(ZC_BOOT_SRC_ROOT)/.args)
	@cp -f $(ZC_BOOT_BIN) $(wildcard $(ZC_BOOT_BIN).*) "$(@D)";
	(cd $(ZC_BOOT_SRC_ROOT) && zip "$(abspath $@)" .args hello.zc instructions.txt Makefile);
	(zip "$(abspath $@)" LICENSE);

boot-repo.com: $(ZC_BOOT_BIN) $(realpath boot-repo/.args)
	@cp -f $(ZC_BOOT_BIN) $@;
	(cd boot-repo && zip "$(abspath $@)" .args);

