set -U fish_user_paths /home/henry/.cargo/bin $fish_user_paths
set -U fish_user_paths /home/henry/.local/bin $fish_user_paths
set -U LD_LIBRARY_PATH "/home/henry/.local/lib:/home/henry/.local/lib64"

if type -q nvim
  set -U EDITOR nvim
end

set -U SHELL fish

abbr zdup "sudo zypper dup -l --no-recommends"
abbr venv! "source .venv/bin/activate.fish"

