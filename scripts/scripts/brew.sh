!#/bin/bash

echo "🔄 Updating Brew"

exec brew update || exit 1

echo "⏭️ Upgrading Packages"

exec brew upgrade

echo "✅ Homebrew Fully Up To Date"
