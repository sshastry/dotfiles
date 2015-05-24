
. ~/.nix-profile/etc/profile.d/nix.sh
. ~/.git-completion.zsh

PS1="%m:%~$ "
RPS1="%D{%a %m/%d} %T"
alias ls="ls -F --color=always"
alias tree="tree -fCA"
alias vim="vim -p"
alias less="less -FRX"
export PAGER="less -FRX"
alias -g G="| grep -i --color=always"
alias -g L="| less"
export TERM=xterm-256color

# autoload -U compinit && compinit
setopt notify pushdtohome autolist \
       sunkeyboardhack autocd recexact longlistjobs mailwarning \
       autoresume histignoredups pushdsilent noclobber \
       autopushd pushdminus extendedglob rcquotes
unsetopt bgnice correct correctall

# emacs key bindings
bindkey -e

