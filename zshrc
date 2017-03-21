# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export EDITOR=vim

#Make it so that the numberpad enter key works in iTerm with Z Shell
#This breaks tmux, and everything seems to work without it
#Keeping for a while, will delete if no problems
#bindkey -s "^[OM" "^M"
#bindkey "${terminfo[kent]}" accept-line

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME=kardan

export TERM="xterm-256color"

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir)
POWERLEVEL9K_TIME_12HR=true
POWERLEVEL9K_TIME_BACKGROUND='blue'
POWERLEVEL9K_VCS_SHOW_SUBMODULE_DIRTY='false'

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

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

#DEFAULT_USER=alex

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
source $ZSH/oh-my-zsh.sh

#FULLSTORY STUFF
export PATH="$PATH:/Users/alex/Developer/protoc-3.2.0-osx-x86_64/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/Users/alex/fs-src/mn/projects/fullstory/go/bin"
export PATH="$PATH:/Users/alex/.cargo/bin"
export FS_HOME="$HOME/fs-src/mn/projects/fullstory"
export GOPATH="$FS_HOME/go"
export FS_LOCAL=true
ulimit -n 10000
# The next line updates PATH for the Google Cloud SDK.
source '/Users/alex/Developer/google-cloud-sdk/path.zsh.inc'
# The next line enables shell command completion for gcloud.
source '/Users/alex/Developer/google-cloud-sdk/completion.zsh.inc'
export PATH="$FS_HOME/backend/install/go_appengine_1.9.46:$PATH"

alias fsdir="cd $FS_HOME"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias jsc="/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc"

alias matlab="/Applications/MATLAB_R2014a.app/bin/matlab -nodisplay -nosplash"

# The next line updates PATH for the Google Cloud SDK.
source '/Users/alex/Developer/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/alex/Developer/google-cloud-sdk/completion.zsh.inc'
