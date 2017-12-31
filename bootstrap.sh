#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOMEBREW_INSTALL_PATH="$DIR/homebrew/install.sh"
PRIVATE_INSTALL_PATH="$DIR/private/install.sh"
NODE_INSTALL_PATH="$DIR/node/install.sh"
INSTALL_FILES=$(find -H "$DIR" -maxdepth 2 -name 'install.sh' -not -path "$HOMEBREW_INSTALL_PATH" -not -path "$PRIVATE_INSTALL_PATH" -not -path "$NODE_INSTALL_PATH")
DOT_FILES=$(find -H "$DIR/dotfiles" -maxdepth 2 -name '.*')


. $HOMEBREW_INSTALL_PATH

for INSTALL_FILE in $INSTALL_FILES
do
	. $INSTALL_FILE
done

echo "$(tput setaf 2)Syncing dot files...$(tput sgr 0)"
rsync -avh --no-perms $DOT_FILES ~
source ~/.zshrc;

. $NODE_INSTALL_PATH
source ~/.zshrc;