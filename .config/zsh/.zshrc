#           _
#          | |
#   _______| |__  _ __ ___
#  |_  / __| '_ \| '__/ __|
#   / /\__ \ | | | | | (__
#  /___|___/_| |_|_|  \___|
#
#

### Bash-Insulter:
if [ -f $HOME/.config/bash-insulter/src/bash.command-not-found ]; then
   source $HOME/.config/bash-insulter/src/bash.command-not-found
fi

### Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"

### History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

### Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

### Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

### vi mode
bindkey -v
export KEYTIMEOUT=1

### Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

### Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

### Set your language environment
export LANG=en_US.UTF-8

### Set colors for the terminal
export TERM="xterm-256color"

### Set zsh font
POWERLEVEL9K_MODE='nerd-font-complete'

### Disable COMPFIX
ZSH_DISABLE_COMPFIX=true

### Display red dots while waiting for command completion.
COMPLETION_WAITING_DOTS="true"

### SHORTEN DIR LENGTH - ALL USERS
POWERLEVEL9K_SHORTEN_DIR_LENGTH=20

### LEFT PROMPT
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
#POWERLEVEL9K_CONTEXT_TEMPLATE="%n | `hostname -f`"
POWERLEVEL9K_CONTEXT_TEMPLATE="%n"

### ALL USERS
POWERLEVEL9K_DIR_SHOW_WRITABLE=true
POWERLEVEL9K_DIR_HOME_BACKGROUND="150" #DarkSeaGreen3
POWERLEVEL9K_DIR_HOME_FOREGROUND="000" #Black

### SUBFOLDERS
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="110" #LightSkyBlue3
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="000" #Black

### OUSIDE OF $HOME DIR
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="182" #Thistle3
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="000" #Black

### DIR /etc
POWERLEVEL9K_DIR_ETC_BACKGROUND="174" #LightPink3
POWERLEVEL9K_DIR_ETC_FOREGROUND="000" #Black

### ROOT
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="001" #Red
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="000" #Black

### USER
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="150" #DarkSeaGreen3
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="000" #Black

### SUDO
POWERLEVEL9K_CONTEXT_SUDO_FOREGROUND="001" #Red
POWERLEVEL9K_CONTEXT_SUDO_BACKGROUND="000" #Black

### GIT REPO INFO
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="000" #Black
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="110" #LightSkyBlue3
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="238" #Grey
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="150" #DarkSeaGreen3
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="238" #Grey
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="110" #LightSkyBlue3

### RIGHT PROMPT
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode ssh status)
POWERLEVEL9K_STATUS_OK=true
POWERLEVEL9K_STATUS_CROSS=true
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND="110" #LightSkyBlue3
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND="000" #Black
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND="150" #DarkSeaGreen3
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND="000" #Black

### zsh theme location
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

### zsh auto suggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

### Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
