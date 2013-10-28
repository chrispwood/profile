# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

########################################################
# LOCAL ADDITIONS / EDITS
########################################################
if [ -f ~/.bashext ]; then
    . ~/.bashext
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in teh history.  See bash(1) bor more options
# don't overwrite GNU Midnight Commander's setting of 'ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for settinghistory length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size ater each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# this is a comment

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user:  the focus in a terminal window
# should be on the output of command, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429).  (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
#	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34\]\W\[\033[00m\]\$ '
	PS1='\[\e[0;32m\]\u:\[\e[0;34m\]\W \[\e[0;32m\]\$ \[\e[0;30m\]'
else
#	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
	PS1='\u:\W \$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	;;
*)
	;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#	. ~/.bash_aliases
#fi

########################################################
# enable color support of ls and also add handy aliases
########################################################
if [ -x /usr/bin/dircolors ]; then
	eval "`dircolors -b`"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='dir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

########################################################
# UDB DB2 - note that there is not a current db2
#           installation on this box
# if [ -f /Users/cwood/sqllib/db2profile ]; then
#     . /Users/cwood/sqllib/db2profile
# fi
########################################################


########################################################
# alias
########################################################
alias ll='ls -l'
alias la='ls -Al'
alias l='ls -CF'
alias vi='vim'
# tomcat
alias web='cd /Library/WebServer/Documents'
alias httpd='sudo vi /etc/apache2/httpd.conf'

alias ..='cd ..'

# enable programmable completion features (you don't need to enable
# thi, if it's already enabled in /etc/bash.bashrc and /etc/profile
# source /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

########################################################
# default bash editor is vi
########################################################
set -o vi
export EDITOR=vi

########################################################
# Environment variables
########################################################
export PROJECTS=~/projects
export PROFILE=$PROJECTS/profile/osx

# setup java
#export JRE_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home
export JAVA_OPTS="-Xmx2048m -XX:PermSize=999m -XX:MaxPermSize=999m"

# setup maven
export M2_HOME=/usr/share/maven
export M2_OPTS=-Xmx1024m
export MAVEN_OPTS="-Xmx1024m -Xms512m -XX:PermSize=256m -XX:MaxPermSize=512m"

# ruby
export RUBYLIB=.

# git
export GIT=/usr/local/git

# groovy
export GROOVY_HOME=/usr/groovy-1.8.6

# gradle
export GRADLE_HOME=/usr/local/Cellar/gradle/1.5

# grails
export GRAILS_HOME=/usr/local/grails

# hadoop
export HADOOP=/opt/hadoop
export HADOOP_OPTS="-Djava.security.krb5.realm= -Djava.security.krb5.kdc="

# hbase
export HBASE_HOME=/opt/hbase

########################################################
# PATH
########################################################
export PATH=$GRAILS_HOME/bin:$GIT/bin:/usr/local/bin:$PATH:$PROFILE/bin:$GROOVY_HOME/bin:$GRADLE_HOME/bin:$HADOOP/bin:$HBASE_HOME/bin

