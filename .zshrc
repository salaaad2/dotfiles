export ZSH="/home/salade/.oh-my-zsh"
PATH="/home/salade/.local/bin${PATH:+:${PATH}}";
PATH="/home/salade/.platformio/penv/bin${PATH:+:${PATH}}";
PATH="/home/salade/go/bin${PATH:+:${PATH}}"; export PATH;
export VISUAL=nvim;
export EDITOR=nvim;

source $ZSH/custom/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

ZSH_THEME="geoffredside"
plugins=(fzf)

source $ZSH/oh-my-zsh.sh

dockercleanall()
{
    docker container stop $1
    docker container rm $1
    docker rmi $(docker images -a -q)
}

lazygit()
{
	git add .
	git commit -m $1
}

coolergit()
{
	clang-format -i src/*
	git add .
	git commit -m $1
}

batdiff()
{
	git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

dec2hex()
{
    printf '%x\n' $1
}

hex2dec()
{
    echo $(($1))
}

autoload -U add-zsh-hook
on_cd() { exa -l --no-permissions --color=auto; }
add-zsh-hook chpwd on_cd

LESS_TERMCAP_mb=$(printf '\e[1;31m');		export LESS_TERMCAP_mb
LESS_TERMCAP_md=$(printf '\e[1;31m');		export LESS_TERMCAP_md
LESS_TERMCAP_me=$(printf '\e[0m');			export LESS_TERMCAP_me
LESS_TERMCAP_so=$(printf '\e[1;33;40m');	export LESS_TERMCAP_so
LESS_TERMCAP_se=$(printf '\e[0m');			export LESS_TERMCAP_se
LESS_TERMCAP_us=$(printf '\e[0;4;35m');		export LESS_TERMCAP_us
LESS_TERMCAP_ue=$(printf '\e[0m');			export LESS_TERMCAP_ue

alias vim="nvim"
alias emacs="TERM=xterm-256color emacs -nw"
alias ccpp="clang++ -Wall -Werror -Wextra"
alias school="cd ~/docs/42projects"
alias worldmon="sh ~/.local/share/mon.sh"
alias ls='exa -l --no-permissions --group-directories-first'
alias grep='grep -n --color=auto'
alias weather="curl --silent wttr.in/lyon"
alias wttr="curl --silent wttr.in/lyon | head -n 7"
alias cat="bat"
alias mk="make -j25"
alias ma="make asan -j25"
alias mkr="make run -j25"
alias mar="make asan run -j25"
alias mkf="make fclean"
alias cp='/bin/cp -iv'
alias mv='/bin/mv -iv'
alias rm='/bin/rm -v'
alias ln='/bin/ln -v'
alias mkdir='/bin/mkdir -v'
alias rmdir='/bin/rmdir -v'
alias chmod='/bin/chmod -v'
alias chown='/usr/sbin/chown -v'
alias grep='/usr/bin/grep --color'
alias srcnt="find . -type f -name '*.c' -exec cat {} \; | sed '/^\//d' | sed '/^\*/d' | sed '/^ \*/d' | sed '/^\/\//d' | sed '/^$/d' | wc -l"
alias tohex='printf "%x\n"'
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d %C(reset)%n'' %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias IP="curl ifconfig.me"
alias fzf="fzf --height=42% --layout=reverse --border sharp"
alias conf='nvim $(find ~/.config | fzf)'
alias pushall="git remote | xargs -L1 git push --all"
alias untar="tar xvf"

fortune | cowsay -f $(\ls /usr/share/cowsay/cows/ | shuf -n1)
