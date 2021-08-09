# .bash_profile
export BASH_PROFILE_LOADED=1

# Load profile
if [ "${PROFILE_LOADED}" != "1" ] && [ -f "$HOME/.profile" ]; then
  . "$HOME/.profile"
fi

# Get the aliases and functions
if [ "${BASHRC_LOADED}" != "1" ] && [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
fi

