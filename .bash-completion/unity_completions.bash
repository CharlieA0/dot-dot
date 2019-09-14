
# Adds make autocompletions supporting unity tests
_unity_make() 
{
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD]}"
  opts="unity-help unity-test unity-add unity-create unity-coverage"

  # Only autocomplete if we think we're under MY19 repository
  if [[ $PWD != *"MY19"* ]]; then
    return 0
  fi

  if [[ ${COMP_CWORD} == 1 ]] ; then
    COMPREPLY=( $(compgen -W "${opts}" ${cur}) )
    return 0
  fi
}

complete -F _unity_make make
