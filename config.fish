if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (/opt/homebrew/bin/brew shellenv)
end
fish_add_path /opt/homebrew/Cellar/llvm@16/16.0.6_1/bin
fish_add_path /opt/local/bin
fish_add_path /Users/yamamurashinji/.local/bin/

set -x PATH $HOME/.nodebrew/current/bin $PATH

bind -e \cs 

# aliases
alias vim="nvim"

# atcoder
function atg
    cd ~/dev/atCoder/
    atcoder-tools gen $argv --workspace ~/dev/atCoder/ --template ~/dev/atCoder/cpp/template.cpp
    cp -rf ~/dev/atCoder/cpp/.vscode/ ~/dev/atCoder/$argv/.vscode/
    cursor -r ./"$argv"
end

function att
	clang++ -std=c++2b -O2 -mtune=native -march=native main.cpp -o a.out -fsanitize=address -g -I ~/dev/atCoder/ac-library/
    atcoder-tools test --exec ./a.out
end

function ats
	atcoder-tools submit --exec ./a.out -u
end

function atf
	atcoder-tools submit --exec ./a.out -u -f
end

function execDebug
	echo "started debug case $argv"
	clang++ -std=c++2b -O2 -mtune=native -march=native  main.cpp -o a.out -D DEFINED_ONLY_IN_LOCAL -Wunused-variable -fsanitize=address -g -I ~/dev/atCoder/ac-library/
	atcoder-tools test -e ./a.out -n $argv -t 7
end

function ad1
	execDebug 1
end

function ad2
	execDebug 2
end

function ad3
	execDebug 3
end
