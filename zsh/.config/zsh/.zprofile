
# Default programs:
export EDITOR="vim"
export TERMINAL="kitty"
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
if [[ -z $DISPLAY ]] && [[ $(tty)=/dev/tty1 ]]; then
	startx $HOME/.config/X11/xinitrc
fi
