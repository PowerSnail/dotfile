# .profile
export PROFILE_LOADED=1

# Environment Variables

## Input Method
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export QT4_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export ECORE_IMF_MODULE=xim

# Work around electron trash performance bug under Plasma
export ELECTRON_TRASH=gio

# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"

# Disable systemctl's paging
export SYSTEMD_PAGER=
