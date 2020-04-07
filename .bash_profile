# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export KWIN_DRM_USE_EGL_STREAMS=1

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export ANDROID_HOME="$HOME/.local/share/Android/Sdk"
export WINEDEBUG="-all"
