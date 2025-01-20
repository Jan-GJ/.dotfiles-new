if status is-interactive
	# Commands to run in interactive sessions can go here
end

# theme
if test -f ~/.config/fish/tokyonight_night.fish
    source ~/.config/fish/tokyonight_night.fish
end

# eza 'ls' replacement
alias lse="eza -a -l --absolute --header --icons --git -s=type"
alias ls="lse --no-user --no-permissions --no-filesize --no-time --absolute=off"

# nvim
alias nv="nvim"
alias vi="nv"
alias vim="nv"
alias neovim="nv"

# nvm
nvm use latest
