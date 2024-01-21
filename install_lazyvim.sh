#!bin/bash

# backuping your nvim old configs
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

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
	gem install neovim &&
	gem environment &&
	npm install -g neovim

# cloning and setting vim starter configuration
git clone https://github.com/LazyVim/starter ~/.config/nvim
# deleting .git directory
rm -rf ~/.config/nvim/.git

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

-- Enable automatic indentation
vim.opt.autoindent = true' >>~/.config/nvim/lua/config/options.lua
}

function 42header() {
	touch ~/.config/nvim/lua/plugins/42header.lua
	## insert lua code in 42header.lua
}

print "Now lazyvim will open and install plugins and setup everything, wait a little bit and them run ':checkhealt'\n to verify if all's fine"
sleep 5

nvim
