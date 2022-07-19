USER_CONFIG_DIR := $$HOME/.config/fontconfig
CONF_D := conf.d
REPO_CONF_D := $(CURDIR)/conf.d

.PHONY: all
all: help

.PHONY: help
help:
	@echo "Ubuntu CJK font config."
	@echo ""
	@echo "[Usage]"
	@echo "    make install    |  Install the config to current user's config directory"
	@echo "    make uninstall  |  Uninstall the config from current user's config directory"
	@echo ""
	@echo "Please log out of your user session, and then log back in to let the changes take effect."
	@echo ""
	@echo "[Current user's config directory]"
	@echo "    $(USER_CONFIG_DIR)"

.PHONY: install
install:
	@mkdir -pv "$(USER_CONFIG_DIR)"
	@cp -rv "$(REPO_CONF_D)" "$(USER_CONFIG_DIR)"

define rmdir_if_empty
    @-if [ -z "$$(ls -A "$(1)")" ]; then \
        rmdir -v "$(1)"; \
    else \
        echo "Directory \"$(1)\" is not empty so not removed"; \
    fi
endef

.PHONY: uninstall
uninstall:
	@-rm -rfv "$(USER_CONFIG_DIR)/$(CONF_D)"/*
	$(call rmdir_if_empty,$(USER_CONFIG_DIR)/$(CONF_D))
	$(call rmdir_if_empty,$(USER_CONFIG_DIR))