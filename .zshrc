# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/markus/.zshrc'
autoload -Uz compinit
compinit

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# z - jump around (https://github.com/rupa/z)
. /usr/local/z.sh

# https://github.com/nvbn/thefuck
eval $(thefuck --alias)

# Command-line fuzzy finder (https://github.com/junegunn/fzf)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Git scmpuff: Makes working with git from the command line quicker by substituting numeric shortcuts for files.
eval "$(scmpuff init -s)"

# Enable file overwrite: e.g. with existing newfile.txt: echo "foo" > newfile.txt
setopt clobber

# NodeJS: NVM (node version manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Gcloud GCP
alias gssh="gcloud compute ssh --ssh-flag=\"-A\""

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/markus/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/markus/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/markus/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/markus/google-cloud-sdk/completion.zsh.inc'; fi

# Merantix
#source $HOME/Development/merantix/core/developer_env/setup.sh PICASSO
#export ADDITIONAL_DRUN_PARAMS='-e PYTHON_LOG_FORMAT=SHORT_PATH'

# Charite (dentalxr.ai, rAIdiance)
alias show-origin='echo origin: $(git remote get-url origin)'
alias use-git-proxy='git remote set-url origin "$(git remote get-url origin | sed s/\.com:/-proxy:/g)"; show-origin'
alias use-git-noproxy='git remote set-url origin "$(git remote get-url origin | sed s/-proxy:/.com:/g)"; show-origin'

# Aliases
alias ll="ls -alh"
alias gpull="git pull"
alias gpu="git pull"
alias k="kubectl"
alias d="docker"
alias dc="docker-compose"
alias tf="terraform"
export DOCKER_SCAN_SUGGEST=false

# Kubernetes
source <(kubectl completion zsh)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# Poetry
export PATH="$HOME/.poetry/bin:$PATH"

# Python-related
export TK_SILENCE_DEPRECATION=1

# Nailvision Android Dev Setup
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# rosetta terminal setup
if [ $(arch) = "i386" ]; then
    alias brew86="/usr/local/bin/brew"
    alias pyenv86="arch -x86_64 pyenv"
fi

