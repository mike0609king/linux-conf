##################################################
# 		Theme INIT
##################################################
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

##################################################
#  A Lot of Space for oh-my-zsh configuragions
##################################################

# If you come from bash you might have to change your $PATH.
export PATH=/$HOME/.local/bin:/home/mike0609king/Apps:$HOME/bin:/usr/local/bin:$PATH
# path for dart !!! remove if you don't have anylonger
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Path to your oh-my-zsh installation.
# export ZSH="/home/mike0609king/.oh-my-zsh"
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting)
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 

source $ZSH/oh-my-zsh.sh

##################################################
# 	Load Powerline
##################################################
#if [ -f `which powerline-daemon` ]; then
#    powerline-daemon -q
#    POWERLINE_BASH_CONTINUATION=1
#    POWERLINE_BASH_SELECT=1
#fi
#if [ -f /usr/local/lib/python3.8/dist-packages/powerline/bindings/bash/powerline.sh ]; then
#    source /usr/local/lib/python3.8/dist-packages/powerline/bindings/bash/powerline.sh
#fi

########################################################################################################
# 						User configuration
########################################################################################################

# History
# HISTSIZE=10000
# SAVEHIST=10000
# HISTFILE=~/.zshHistory

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files

# Use vim keys in tab complete menu
# Selecting things 
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Makes it possible to use vi in the editor
bindkey -v
export KEYTIMEOUT=1

# Edit line in vim with ctrl-e:
autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# export MANPATH="/usr/local/man:$MANPATH"

# Google Chrome executable setting
CHROME_EXECUTABLE=/bin/google-chrome-stable
export CHROME_EXECUTABLE

# getting utf-8 (languague environment)
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export vimPath='vim -u ~/.vim/vim/vimrc'
export nvimPath='nvim -u ~/.vim/vim/vimrc'

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else # local
  #export EDITOR='mvim'
  export EDITOR=$nvimPath
fi


fpath+=${ZDOTDIR:-~}/.zsh_functions
TERMINAL=alacritty

export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

##################################################
# 	Plugin Configurations
##################################################
# zsh-autosuggestions configuration
bindkey '^ ' autosuggest-accept

##################################################
# 	      Other: At start of bash              ###
##################################################

# Changing keybinding
setxkbmap -option caps:escape

##################################################
### 	             Aliases                     ###
##################################################

#############################
#          Commands         #
#############################

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias serve='browser-sync start --server --files . --no-notify -- host `hostname -I` --port 9000'

#############################
#      Special Dir          #
#############################
export media='/media/mike0609king'
export apps='/home/mike0609king/Apps'

#############################
#         Programs          #
#############################
alias tmux='tmux -u' 	                            # so that the characters doesn't look weird

# from now on only nvim gets used!!
alias vim=$nvimPath # loading rc files correctly
alias nvim=$nvimPath # loading rc files correctly
alias mvim=$nvimPath

export CALCURSE_EDITOR=$vimPath
alias mon2cam='deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts'
alias Discord='$apps/Discord/Discord'
alias DiscordScreen='python $apps/discord-monitors-to-vc/main.py'
alias ffmpeg='$apps/ffmpeg/ffmpeg'
alias Bazecor='$apps/Bazecor'
alias notify='~/.myScripts/notify.sh'
alias calcurse='calcurse -D ~/.config/calcurse'

alias clang11='clang -Wall -std=c11 -lm'
alias clang11Mem='clang -Wall -std=c11 -fsanitize=memory -lm'
alias clang11Addr='clang -Wall -std=c11 -fsanitize=address -lm'

alias f='source ranger'
