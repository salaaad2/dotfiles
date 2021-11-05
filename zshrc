export ZSH="/home/salad/.oh-my-zsh"
PATH="/home/salad/.local/bin${PATH:+:${PATH}}"; export PATH;
PATH="/home/salad/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/salad/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/salad/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/salad/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/salad/perl5"; export PERL_MM_OPT;

source $ZSH/custom/plugins/fsh/fast-syntax-highlighting.plugin.zsh

ZSH_THEME="geoffredside"
plugins=(fzf)

source $ZSH/oh-my-zsh.sh

lazygit()
{
	git add .
	git commit -m $1
}

autoload -U add-zsh-hook
on_cd() { exa -l --color=auto; }
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
alias apti="sudo apt-get install"
alias aptu="sudo apt-get update && sudo apt-get upgrade"
alias ccpp="clang++ -Wall -Werror -Wextra"
alias dotccls="cp ~/.local/share/.ccls ."
alias rute="cd ~/docs/projects/rute"
alias school="cd ~/docs/42projects"
alias cfg="nvim ~/.config/awesome/rc.lua ~/.config/awesome/themes/powerarrow-dark/theme.lua ~/.config/vim/vimrc ~/.config/bspwm/bspwmrc ~/.config/sxhkd/sxhkdrc ~/.zshrc ~/.config/polybar/config"
alias worldmon="sh ~/.local/share/mon.sh"
alias ls='exa -l --no-permissions'
alias grep='grep -n --color=auto'
alias weather="curl --silent wttr.in/lyon"
alias wttr="curl --silent wttr.in/lyon | head -n 7"
alias cat="bat --paging=never"
alias mk="make -j5"
alias ma="make asan -j5"
alias mkr="make run -j5"
alias mar="make asan run -j5"
alias mkf="make fclean"
#alias norminette="~/.norminette/norminette.rb"
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
alias poweroff="sudo poweroff"
alias fzf="fzf --height=42% --layout=reverse --border"
alias pushall="git remote | xargs -L1 git push --all"
alias cmusic="st -e cava & cmus"
alias untar="tar -xvf"
