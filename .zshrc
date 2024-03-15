source "$HOME/.cargo/env"

eval "$(zoxide init zsh)"

export QT_STYLE_OVERRIDE=kvantum
export PATH=$PATH:/usr/local/go/bin
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# aliases
alias myip="curl http://ipecho.net/plain; echo"
alias redurl="echo https://localhost:3000/api/auth/callback/[AUTH_PROVIDER_NAME]"
alias basegit="echo https://github.com/"
alias shttp="python3 -m http.server"
alias vim="helix"
alias nvim="helix"
alias code="helix"
alias ld="lsd"
alias reload="source $HOME/.zshrc"
alias cd="z"
#
plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/tarik/.zprofile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export DENO_INSTALL="/home/tarik/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# bun completions
[ -s "/home/tarik/.bun/_bun" ] && source "/home/tarik/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval $(thefuck --alias)
