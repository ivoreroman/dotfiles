# Add emacs to CLI

if [ -d "/Applications/Emacs.app/Contents/MacOS/bin" ]; then
  export PATH="/Applications/Emacs.app/Contents/MacOS/bin:$PATH"
  alias emacs="emacs -nw" # Always launch "emacs" in terminal mode.
fi

# Open VISUAL/EDITOR on C-x e
# source: https://distrustsimplicity.net/articles/zsh-command-editing/
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-xe' edit-command-line
