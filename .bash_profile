# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export KWIN_DRM_USE_EGL_STREAMS=1
export PLASMA_USE_QT_SCALING=1

# Input method for 
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export QT4_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export ECORE_IMF_MODULE=xim

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export ANDROID_HOME="$HOME/.local/share/Android/Sdk"
export WINEDEBUG="-all"


# Work around for WSL & TMUX incompatibility
# Check availability of env var WSLENV (Igor Chubin, 2012) 
if env | grep -q ^WSLENV=
then
  export TMUX_TMPDIR=/tmp
fi

# References

# Igor Chubin. (2012, July 27). *linux—Check if environment variable is already set*. Stack Overflow. https://stackoverflow.com/questions/11686208/check-if-environment-variable-is-already-set
