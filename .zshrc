
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

alias myip="curl http://ipecho.net/plain; echo"
alias redurl="echo https://localhost:3000/api/auth/callback/[AUTH_PROVIDER_NAME]"
plugins=(
  git
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/tarik/.zprofile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

nvm use node
clear
