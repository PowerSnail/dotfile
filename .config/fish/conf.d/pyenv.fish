if type -q pyenv
  status --is-interactive; and source (pyenv init -|psub) 
  pyenv init - | source
  fish_add_path $HOME/.pyenv/shims
end
