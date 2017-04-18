# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# Set the default editor to vim
export EDITOR=vim

# Set an initial PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$PATH"

# Include configuration that is local to this machine
# At some point, figure out how to make this a relative path
# (For example, use ~ instead of /Users/alex)
source '/Users/alex/zshrc-local.zsh.inc'

# Do some color magic to get tmux working
export TERM="xterm-256color"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Load in the base ZSH config
source $ZSH/oh-my-zsh.sh

# -----------------------------------------
# --- Configure the PowerLevel 9k theme ---
# -----------------------------------------

# Only show the last two directories in the path
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
# Set the time format
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
# Show the status symbol of the last command and the current time on the 
# right hand side of the status line
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
# Show the user, host, and PWD on the left side of the status line
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir)
# Show 12 hour time instead of 24 hour time
POWERLEVEL9K_TIME_12HR=true
# Set the background color of the status line
POWERLEVEL9K_TIME_BACKGROUND='blue'
# Don't check if submodules are dirty when showing vcs status
# This isn't important if I am not using VCS status
# (which is slow in the fs repo)
POWERLEVEL9K_VCS_SHOW_SUBMODULE_DIRTY='false'


# -----------------------------------------
# ---------------- Aliases ----------------
# -----------------------------------------

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias jsc="/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc"


# -----------------------------------------
# --------- Other Unused options ----------
# -----------------------------------------

#Make it so that the numberpad enter key works in iTerm with Z Shell
#This breaks tmux, and everything seems to work without it
#Keeping for a while, will delete if no problems
#bindkey -s "^[OM" "^M"
#bindkey "${terminfo[kent]}" accept-line

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration

#DEFAULT_USER=alex

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#
