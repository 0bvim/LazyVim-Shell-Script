#!/bin/bash

function get_user() {
	# get login
	echo "Insert your login for 42header"
	read login
	# get email
	echo "Insert your email for 42header"
	read email
}

function 42header() {
	echo '
return {

	{ "Diogo-ss/42-header.nvim" },

	{
		"Diogo-ss/42-header.nvim",
		lazy = false,
		config = function()
			local header = require("42header")
			header.setup({
				default_map = true, -- default Mapping <F1> in normal mode
				auto_update = true,  -- update header when saving
				user = $login, -- your user
				mail = $email, -- your mail
			})
		end
	},
}' >~/.config/nvim//lua/plugins/42header.lua
}

function greeting() {
	read -r -p "This plugin is default in 'install_lazyvim.sh'
If you runned it, don't need to use this script. Continue? [Y/N]
" Response
	var_accept='[Yy]|Yes|yes|yup'
	var_reject='[Nn]|No|no|nops|never|jame'
	case "$Response" in
	[Yy] | Yes | yes | yup)
		get_user
		echo "Okay $USER, Installing... After installed, press F1 to insert 42header."
		until 42header; do :; done
		;;
	[Nn] | No | no | nops | never | jame)
		echo "Cya $USER"
		exit
		;;
	*)
		echo "Sorry, I don't know what you mean..."
		return 1
		;;
	esac
}

until greeting; do :; done && echo "done"

