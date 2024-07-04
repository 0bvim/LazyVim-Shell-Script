#!/bin/bash

backup() {
# backuping your nvim old configs
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

}

install_asdf() {
# clone repository asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

# add path to home and source
echo ". $HOME/.asdf/asdf.sh" >>~/.zshrc
source ~/.zshrc

# adding plugins before installing
asdf plugin add fd &&
	asdf plugin add neovim &&
	asdf plugin add nodejs &&
	asdf plugin add python &&
	asdf plugin add rust &&
	asdf plugin add tree-sitter &&
	asdf plugin add lazygit &&
	asdf plugin add ripgrep &&
	asdf install fd latest &&
	asdf install neovim latest &&
	asdf install nodejs latest &&
	asdf install python latest &&
	asdf install rust latest &&
	asdf install tree-sitter latest &&
	asdf install ripgrep latest &&
	asdf install lazygit latest &&
	asdf global fd latest &&
	asdf global neovim latest &&
	asdf global nodejs latest &&
	asdf global python latest &&
	asdf global rust latest &&
	asdf global tree-sitter latest &&
	asdf global ripgrep latest &&
	asdf global lazygit latest
}

lazy_starter_pack() {
	LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
}

function set_key_map() {
	echo 'lvim.keymap.insert_mode["jk"] = "<ESC>"' >>~/.config/lvim/config.lua
}

# calling functions
backup
install_asdf
lazy_starter_pack
set_key_map
lvim
