alias gksudo="pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY"
alias fzp="fzf --preview 'cat {}'"
alias grep="grep --color=auto --exclude-dir=node_modules --exclude-dir=vendor"
alias dev-node='docker run -it --rm -v "$PWD":/app -w /app --user "$(id -u):$(id -g)" --entrypoint sh node:lts-alpine'
