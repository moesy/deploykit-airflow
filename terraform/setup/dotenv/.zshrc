# store in a gist
# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# Spell check commands!  (Sometimes annoying)
setopt CORRECT

# 10 second wait if you do something that will delete everything.
setopt RM_STAR_WAIT

export EDITOR="vi"

# Environment Variables
# export AIRFLOW_HOME="/opt/airflow"

# Alt+s onserts sudo in front
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

#{{{ Shell Conveniences

alias sz='source ~/.zshrc'
alias ez='vim ~/.zshrc'
alias mk=popd
alias ls='pwd; ls --color'
