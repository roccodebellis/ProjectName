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

check_mise:
	@echo "🔧 Checking Mise..."
	@if test ! $$(which mise); then \
		brew install mise; \
		echo 'export PATH="$HOME/.local/share/mise/shims:$PATH"' >> ~/.zprofile; \
	fi
	@echo "🔧 Setting up Mise..."
	@mise install

system_dependencies: check_brew check_mise
	@echo "🔧 Setup system dependency completed."

generate_project:
	@echo "🚀 Generating project with Tuist..."
	@tuist generate

implode_mise:
	@echo "🗑️ Removing Mise dependencies..."
	@mise uninstall tuist --all
	@mise uninstall node
	@mise implode
	brew uninstall mise
	@echo "🗑️ Mise dependencies removed."
