if type -q pyenv
  if status --is-interactive 
    pyenv init - | source
  end
end
