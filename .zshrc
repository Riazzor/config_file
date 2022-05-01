Z_DIR_CONFIG="/home/$USER/.zsh-config"

if [ -f ~/.work_config ]; then
    . ~/.work_config
fi
source $Z_DIR_CONFIG/zshfunction
# personal alias
zsh_add_file zsh_aliases

zsh_add_file zshcompletions
# zsh_add_file zsh_export
zsh_add_file zsh_prompt

#TODO : green U for untracked file, yellow cross for added but uncommited change
#	red cross for unstaged change
#	order is green yellow red git_branch
autoload colors && colors
#VCS LOAD FOR PROMPT
autoload -Uz vcs_info

setopt PROMPT_SUBST
setopt nomatch
stty stop undef
zle_highlight=('paste:none')

# %b : branch | %d : path(complete)| %e (0) %h (3896) %j (0)
zstyle ':vcs_info:git:*' formats '(%b)'
# zstyle ':vcs_info:git:*' formats '(%b c: %c d: %d e: %e f: %f g: %g h: %h i: %i j: %j)'

# Lines configured by zsh-newuser-install
HISTFILE=$Z_DIR_CONFIG/histfile
HISTSIZE=10000
# Avoid duplicates
HISTCONTROL=ignoredups:erasedups
SAVEHIST=10000
unsetopt autocd beep extendedglob nomatch notify
bindkey -e
bindkey "^H" backward-kill-word
####> new bindkey moved to zsh_aliases

# End of lines configured by zsh-newuser-install

# save and reload history after each command
export PROMPT_COMMAND="history -a; history -c, history -r; $PROMPT_COMMAND"
