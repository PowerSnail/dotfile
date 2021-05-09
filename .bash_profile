# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

# Input method for 
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export QT4_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export ECORE_IMF_MODULE=xim

export ELECTRON_TRASH=gio
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export ANDROID_HOME="$HOME/.local/share/Android/Sdk"
# export WINEDEBUG="-all"
