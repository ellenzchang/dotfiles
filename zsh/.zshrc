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
  z
  web-search
)


# --- ALIAS AND COMMANDS ---

alias ks="~/scripts/quickcommands/kube-shell.sh"
alias todos="task list"
alias zsh="vim ~/.zshrc"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias ga="git add"
alias gp="git push"
alias copy="tr -d '\n' | pbcopy"

getId(){
  eval "ps -A | grep $@ | awk '{print $1}'"
}

kill(){
  eval "kill -9 $@"
}

todo(){
  eval "task $@"
}

so() {
  eval "stackoverflow $@"
}

go() {
  eval "google $@"
}

gcm() {
  eval 'git commit -m "$@"'
}

gb() {
  eval "git branch -b $1"
}


# --- FINN specific ---

alias repo="finn repo:web"
alias travis="finn ci:web"
alias pipe="finn pipeline:web"
alias pods="finn pod:list"

alias k="kubectl"
alias kbet="k get pods -lowner=buyer-experience-torget"
alias finnd="k config use-context finn-fiaas-dev-gke01"
alias finnp="k config use-context finn-fiaas-prod-gke01"
alias torid="kubectl config use-context nmp-rc-toripg-apps-gke01"
alias torip="kubectl config use-context nmp-rc-i01-apps-gke01"
alias dbad="kubectl config use-context nmp-i002"
alias dbap="kubectl config use-context dk-prod-i006"
alias blocketd="kubectl config use-context se-dev-i007"
alias blocketp="kubectl config use-context se-prod-i009"

jwtprod(){
  eval "~/scripts/account-tools/user_jwt_prod.sh $1 | copy"
}

jwtdev(){
  eval "~/scripts/account-tools/user_jwt_dev.sh $1 | copy"
}

jwtdbad(){
  eval "~/scripts/account-tools/user_jwt_dba_dev.sh $1 | copy"
}

jwtdbap(){
  eval "~/scripts/account-tools/user_jwt_dba_prod.sh $1 | copy"
}

jwttorid(){
  eval "~/scripts/account-tools/user_jwt_toripg.sh $1 | copy"
}

jwttorip(){
  eval "~/scripts/account-tools/user_jwt_tori_prod.sh $1 | copy"
}

boprod(){
  eval "~/scripts/account-tools/backoffice_jwt_prod.sh $1 | copy"
}

bodev(){
  eval "~/scripts/account-tools/backoffice_jwt_dev.sh $1 | copy"
}

podrestart(){
  eval "finn pod:restart --pod $1"
}

podget(){
  eval "k get pods | grep $1"
}

podrollout(){
  eval "k rollout restart deployment $1"
}

kitempage(){
  eval "finn pod:list --app recommerce-item-page --env $1"
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
export PATH=$PATH:~/dev/nmp-team-search-techdocs/scripts

. /opt/homebrew/opt/asdf/libexec/asdf.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
