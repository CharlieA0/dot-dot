# Setup fzf
# ---------
if [[ ! "$PATH" == */home/charlie/.fzf/bin* ]]; then
  export PATH="$PATH:/home/charlie/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/charlie/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/charlie/.fzf/shell/key-bindings.bash"

