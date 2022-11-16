set -U SHELL fish

abbr zdup "sudo zypper dup -l --no-recommends"
abbr flup "flatpak update && flatpak uninstall --unused"
abbr venv! "source .venv/bin/activate.fish"
abbr conda! "set PATH /home/henry/miniconda3/bin $PATH"

if type -q banner_message
  function fish_greeting
    banner_message --shell=Fish --mail-count
  end
end


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/henry/.pyenv/versions/miniconda3-latest/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

