if status is-interactive
	# Commands to run in interactive sessions can go here
end

# fish
set fish_greeting

# theme
if test -f ~/.config/fish/tokyonight_night.fish
    source ~/.config/fish/tokyonight_night.fish
end

# brew
fish_add_path /opt/homebrew/bin/

# eza 'ls' replacement
alias lse="eza -a -l --absolute --header --icons --git -s=type"
alias ls="lse --no-user --no-permissions --no-filesize --no-time --absolute=off"

# nvim
alias nv="nvim"
alias vi="nv"
alias vim="nv"
alias neovim="nv"

# nvm
nvm use latest &> /dev/null

# gpg
export GPG_TTY=$(tty)

# pnpm
set -gx PNPM_HOME "/Users/jangrossejuttermann/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
