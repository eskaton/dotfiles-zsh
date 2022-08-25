HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

zstyle :compinstall filename '~/.zshrc'

fpath+=(~/.zsh/config ~/.zsh/completions)

autoload -Uz prompt; prompt
autoload -Uz cursor-mode; cursor-mode
autoload -Uz text-objects; text-objects
autoload -Uz bd; bd 2>/dev/null
autoload -Uz compinit; compinit

setopt EXTENDED_GLOB
setopt HIST_IGNORE_SPACE
setopt NONOMATCH
setopt PROMPT_SUBST
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

autoload -U colors && colors
autoload edit-command-line
zle -N edit-command-line

bindkey -v
bindkey -M vicmd v edit-command-line
bindkey '^ ' autosuggest-accept

export TERM=xterm-256color
export LSCOLORS=Exfxcxdxbxegedabagacad
export LESS_TERMCAP_mb=$(tput bold; tput setaf 7) # white
export LESS_TERMCAP_md=$(tput bold; tput setaf 1) # red
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # yellow on blue
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 2) # green
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)

if [[ $(uname) = "FreeBSD" ]]; then
   if [[ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
      . /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
   fi
elif [[ $(uname) = "Linux" ]]; then
   if [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
      . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
   fi
fi

if [ -f ~/.env ]; then
   # source environment specific to this machine
   . ~/.env
fi

if [ -f ~/.aliases ]; then
   . ~/.aliases
fi

if [ -f ~/.aliases_loc ]; then
   # source aliases specific to this machine
   . ~/.aliases_loc
fi

if [ -f ~/.funcs ]; then
   . ~/.funcs
fi

if [ -f ~/.funcs_loc ]; then
   # source functions specific to this machine
   . ~/.funcs_loc
fi

