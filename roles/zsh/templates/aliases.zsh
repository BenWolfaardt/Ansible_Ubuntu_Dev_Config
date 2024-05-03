# View aliases
alias va='cat $ans/roles/zsh/templates/aliases.zsh'

# Default oh my zsh
#   https://github.com/ohmyzsh/ohmyzsh/wiki/Cheatsheet

# Docker
alias d='docker'
alias dc='docker compose'
alias dcd='docker compose down'
alias dcdd='docker compose down -d'
alias dcu='docker compose up'
alias dcub='docker compose up --build'
alias dcud='docker compose up -d'
alias de='docker exec -it'
alias din='docker info'
alias di='docker image'
alias dil='docker image ls'
alias dn='docker network'
alias dni='docker network inspect'
alias dnl='docker network ls'
alias dp='docker ps'
alias dv='docker volume'
alias dvi='docker volume inspect'
alias dvl='docker volume ls'

# git
# See also ~/src/config/dotfiles/.gitconfig
alias g='git'

# poetry
alias pa='poetry add'
# alias pad='poetry add $1 --group dev'
function pad() { poetry add $1 --group dev }
alias plnu='poetry lock --no-update'
alias pi='poetry install'
alias pr='poetry remove'
alias psi='poetry shell && poetry init'

# pre-commit
alias pci='pre-commit install'
alias pcra='pre-commit run --all-files'
alias pcram='pre-commit run mypy --all-files'
alias pcrar='pre-commit run ruff --all-files'
alias pcrf='pre-commit run --files'
alias pcrfm='pre-commit run mypy --files'
alias pcrfr='pre-commit run ruff --files'

# pyenv
alias pyi='pyenv install'
alias pyil='pyenv install --list'
alias pyilg='pyenv install --list | grep'
alias pys='pyenv shell'
alias pyv='pyenv versions'
alias pyvg='pyenv versions | grep'
alias pywp='pyenv which python'

# system commands
# ip
alias ip4='curl -4 icanhazip.com'
alias ip6='curl -6 icanhazip.com'
alias ip6d='curl -s https://ifconfig.me | xargs ipv6calc -q -i -m'  # details
# update software
alias supd='sudo apt update'
alias supg='sudo apt upgrade'
alias supgy='sudo apt upgrade -y'
alias suu='sudo apt update && sudo apt upgrade'
alias suuy='sudo apt update && sudo apt upgrade -y'

# terraform
alias tfa='terraform apply -var "do_token=${DO_PAT}"'
alias tfp='terraform plan -var "do_token=${DO_PAT}"'
