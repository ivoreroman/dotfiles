# Add emacs to CLI

if [ -d "/Applications/Emacs.app/Contents/MacOS/bin" ]; then
  export PATH="/Applications/Emacs.app/Contents/MacOS/bin:$PATH"
  alias emacs="emacs -nw" # Always launch "emacs" in terminal mode.
fi

# Open VISUAL/EDITOR on C-x C-e
# source: https://distrustsimplicity.net/articles/zsh-command-editing/
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
