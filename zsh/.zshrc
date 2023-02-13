# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Uncomment to update zsh
zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13   # update frequency in days

plugins=(
  git
  z
  web-search
)


# --- ALIAS AND COMMANDS ---

alias ks="~/scripts/quickcommands/kube-shell.sh"
alias todos="task list"
alias zsh="vim ~/.zshrc"

todo(){
  eval "task $@"
}

so() {
  eval "stackoverflow $@"
}

go() {
  eval "google $@"
}


# --- FINN specific ---

alias repo="finn repo:web"
alias travis="finn ci:web"
alias pipe="finn pipeline:web"
alias pods="finn pod:list"

alias kdev="kubectl config use-context finn-fiaas-dev-gke01"
alias kprod="kubectl config use-context finn-fiaas-prod-gke01"
alias kbet="kubectl get pods -lowner=buyer-experience-torget"

alias jwtprod='~/scripts/user_jwt_prod.sh $JWT_PROD | pbcopy'
alias jwtdev='~/scripts/user_jwt_dev.sh $JWT_DEV | pbcopy'

boprod(){
  eval "~/scripts/backoffice_jwt_prod.sh $1 | pbcopy"
}

bodev(){
  eval "~/scripts/backoffice_jwt_dev.sh $1 | pbcopy"
}

podrestart(){
  eval "finn pod:restart --pod $1"
}

# --- Sources and exports ---

source $ZSH/oh-my-zsh.sh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && source /opt/homebrew/etc/profile.d/autojump.sh
source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/dotfiles/zsh/.zshenv

eval $(thefuck --alias)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/dotfiles/zsh/.p10k.zsh ]] || source ~/dotfiles/zsh/.p10k.zsh

# pnpm
export PNPM_HOME="/Users/ellen/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export TODO_DB_PATH=$HOME/todo.json
export PATH="/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:$PATH"
export PATH="/Users/ellen/dev/android_finn_app/ffs:$PATH"
export ANDROID_HOME=/Users/ellen/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/emulator
