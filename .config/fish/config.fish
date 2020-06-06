set -U fish_user_paths /home/henry/.cargo/bin $fish_user_paths
set -U fish_user_paths /home/henry/.local/bin $fish_user_paths
set -U LD_LIBRARY_PATH "/home/henry/.local/lib:/home/henry/.local/lib64"
set -U CC "/usr/bin/clang"
set -U CXX "/usr/bin/clang++"
set -U EDITOR nvim
set -U SHELL fish

thefuck --alias | source

abbr ls "exa --git"
abbr ll "exa --git -l"
abbr a4 "aria2c -x4"
status --is-interactive; and source (pyenv init -|psub) 

