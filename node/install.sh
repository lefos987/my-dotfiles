#!/bin/sh

echo "$(tput setaf 2)Installing nvm...$(tput sgr 0)"
if [ ! -d "$HOME/.nvm" ]; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
fi

echo "$(tput setaf 2)Installing latest node...$(tput sgr 0)"
source ~/.zshrc
nvm install --lts
