# Created by newuser for 5.8
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=/usr/local/bin:$PATH
source ~/enhancd/init.sh

#export PS1="%~ %n "

#zshの操作をVimキーバインドにする
bindkey -v

#alias
alias la='ls -la'
alias pwd='pwd && pwd | pbcopy'

# vimでデフォルトでnvimを立ち上げる
alias vim='nvim'

# powerline-shell
function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

# nvim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# version
eval "$(anyenv init -)"

# atcoder
atg() {
	local contest="$1"
	cd ~/dev/atCoder/
	atcoder-tools gen "$contest" --workspace ~/dev/atCoder/ --template ~/dev/atCoder/template.cpp
	cp -rf ~/dev/atCoder/cpp/.vscode/ ~/dev/atCoder/$contest/.vscode/
	cd ./"$contest"
	code -r .
}
att() {
	g++ ./main.cpp
	atcoder-tools test --exec ./a.out
}
ats() {
	atcoder-tools submit --exec ./a.out -u
}

 source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
