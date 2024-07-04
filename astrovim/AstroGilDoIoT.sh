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
	asdf plugin add cmake &&
		asdf plugin add fd &&
		asdf plugin add neovim &&
		asdf plugin add nodejs &&
		asdf plugin add python &&
		asdf plugin add ruby &&
		asdf plugin add rust &&
		asdf plugin add tree-sitter &&
		asdf plugin add lazygit &&
		asdf plugin add ripgrep &&
		asdf install fd 9.0.0 &&
		asdf install cmake latest &&
		asdf install neovim stable &&
		asdf install nodejs 21.5.0 &&
		asdf install python 3.11.0 &&
		asdf install ruby 3.0.0 &&
		asdf install rust latest &&
		asdf install tree-sitter 0.20.0 &&
		asdf install ripgrep latest &&
		asdf install lazygit latest &&
		asdf global cmake latest &&
		asdf global neovim stable &&
		asdf global nodejs 21.5.0 &&
		asdf global python 3.11.0 &&
		asdf global ruby 3.0.0 &&
		asdf global rust latest &&
		asdf global tree-sitter 0.20.0 &&
		asdf global ripgrep latest &&
		asdf global lazygit latest &&
		pip install neovim &&
		pip install compiledb-plus &&
		gem install neovim &&
		gem environment &&
		npm install -g neovim
}

lazy_starter_pack() {
	# cloning and setting vim starter configuration
    git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
	# deleting .git directory
    mkdir -p ~/.config/nvim/lua/config
	rm -rf ~/.config/nvim/.git
}

function set_key_map() {
	echo 'vim.keymap.set("i", "jk", "<ESC>")' >>~/.config/nvim/lua/config/keymaps.lua
}

function set_identation() {
	echo '
-- Use actual tab characters instead of spaces
vim.opt.expandtab = false

-- Set the number of spaces for each tab
vim.opt.tabstop = 4

-- Set the number of spaces for automatic indentation
vim.opt.shiftwidth = 4

-- Indent for clang
vim.opt.cindent = true

-- let autoformat off, when you active extra
-- feature for clang, it will not format automatically.
vim.g.autoformat = false

-- Enable automatic indentation
vim.opt.autoindent = true' >>~/.config/nvim/lua/config/options.lua
}

install_nerd_font() {
	# Step 1: Download the font
	wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip

	# Step 2: Unzip the font
	(cd ~/.local/share/fonts && unzip Meslo.zip)

	# Step 3: Remove unnecessary files
	(cd ~/.local/share/fonts && rm *README* && rm Meslo.zip)

	# Step 4: Rebuild the font cache
	fc-cache -fv
}

# calling functions
backup
install_asdf
lazy_starter_pack
install_nerd_font
set_key_map
set_identation
get_user
42header

print "Now lazyvim will open and install plugins and setup everything, wait a little bit and them run ':checkhealt'\n to verify if all's fine"
sleep 5

nvim
