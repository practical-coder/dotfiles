# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export TERM=xterm-color
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
#HISTCONTROL=ignoreboth

# if word is not recognized try cd to it
shopt -s autocd

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Environment variables

# history
export HISTSIZE=20000
export HISTFILESIZE=20000
export PROMPT_COMMAND='history -a'
export HISTTIMEFORMAT="<%F %T>  "

# editor, pager, man etc
export FCEDIT=/usr/bin/vim
export EDITOR=/usr/bin/vim
export LESS='--ignore-case --LONG-PROMPT --no-init -R'

export RI='--format ansi --width 70'

# man colours
export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m' # begin bold
export LESS_TERMCAP_me=$'\E[0m' # end mode
export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m' # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# mysql                                                                                                                             
export MYSQL_HISTFILE=/home/jac/mysql_files/history/`date +%Y-%m`_mysql_history

#java related

export JAVA_HOME='/opt/java/jdk1.6.0_25'

# log4j
export LOG4J_HOME='/opt/java/apache-log4j-1.2.16'

# ant
export ANT_HOME='/opt/java/apache-ant-1.8.0'
export ANT_ARGS='-logger org.apache.tools.ant.listener.AnsiColorLogger'

#export ANT_OPTS=-Xmx512M
#export ANT_OPTS='-Dhttp.proxyHost=proxy.mycompany.com -Dhttp.proxyPort=8080'

# grails
#export GRAILS_HOME='/opt/java/grails-1.1.1/'

# eclipse
export GDK_NATIVE_WINDOWS=1

# Tomcat
export CATALINA_HOME='/opt/java/tomcat7'

# PATH
export PATH=/home/jac/bin:$PATH
export PATH=$JAVA_HOME/bin:$ANT_HOME/bin:$PATH

# eclipse
export GDK_NATIVE_WINDOWS=1
# RadRails
export MOZILLA_FIVE_HOME=/usr/lib/xulrunner-1.9.1.9

if [ -n $LD_LIBRARY_PATH ]; then
	export LD_LIBRARY_PATH="/usr/lib/xulrunner-1.9.1.9":$LD_LIBRARY_PATH
else
	export LD_LIBRARY_PATH="/usr/lib/xulrunner-1.9.1.9"
fi

# RUBY
export RUBYOPT='-W0'

# custom functions
function g { firefox -search "$*";}

# RVM
[[ -s "/home/jac/.rvm/scripts/rvm" ]] && source "/home/jac/.rvm/scripts/rvm"  # This loads RVM into a shell session.


# get_ssh_env
get_ssh_env() {
	pid=`pgrep -t pts/0 bash`
	command_output=`sudo strings /proc/$pid/environ | grep SSH`
	for x in $command_output
	do
		export $x
	done
}

#### END ####
