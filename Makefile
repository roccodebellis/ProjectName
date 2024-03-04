MAX_RETRIES := 3

check_brew:
	@echo "🔧 Checking Homebrew..."
	@if test ! $$(which brew); then \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" > /dev/null 2>&1; \
	fi
	@for i in $$(seq 1 $(MAX_RETRIES)); do \
		if [ $$i -gt 1 ]; then \
			echo "🔄 Attempt $$i of $(MAX_RETRIES) to install Brewfile dependencies..."; \
		fi; \
		brew update > /dev/null 2>&1 && brew bundle && break; \
		if [ $$i -eq $(MAX_RETRIES) ]; then \
			read -p "❌ Maximum retries reached. Unable to install Brewfile dependencies. Do you want to retry? [y/N]: " retry; \
			if [ "$$retry" = "y" ] || [ "$$retry" = "Y" ]; then \
				continue; \
			else \
				exit 1; \
			fi; \
		fi; \
		sleep 1; \
	done

check_node_version:
	#@echo "🔧 Checking Node version..."
	#@CURRENT_NODE_VERSION=$$(node -v | cut -d 'v' -f 2); \
	#if [ "$$CURRENT_NODE_VERSION" != "$(SYSTEM_NODE_VERSION)" ]; then \
	#	echo "🚨 A newer version of NodeJS is available."; \
	#fi

check_mise:
	#@echo "🔧 Checking Mise..."
	#@if test ! $$(which mise); then \
	#	brew install mise; \
	#fi
	#@echo "🔧 Setting up Mise..."
	#@mise use --local node@$(SYSTEM_NODE_VERSION)
	#check_node_version

check_twist:
	@echo "🔧 Checking Twist..."
	@if test ! $$(which twist); then \
		brew install tuist; \
	fi

system_dependencies: check_brew check_twist
	@echo "🔧 Setup system dependency completed."