
# Default programs:
export EDITOR="vim"
export TERMINAL="alacritty"
export BROWSER="firefox"

export PATH="$HOME/.local/bin:${PATH}"
export PATH

# ~/ Clean-up:
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export LESSHISTFILE="-"
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo 
#export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
#export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
#export CUDA_CACHE_PATH"$XDG_CACHE_HOME"/nv
#export NVM_DIR="$XDG_DATA_HOME"/nvm

if [[ -z $DISPLAY ]] && [[ $(tty)=/dev/tty1 ]]; then
	startx $HOME/.config/X11/xinitrc
fi
