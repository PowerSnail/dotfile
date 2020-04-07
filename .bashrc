# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Load my env.sh
. $HOME/dotfile/env.sh
export PATH=$(echo $PATH | rm_duplicate_env_val)

# Uncomment the following line if you don't like systemctl's auto-paging feature:
export SYSTEMD_PAGER=

