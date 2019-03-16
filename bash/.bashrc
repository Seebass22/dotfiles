source /etc/bashrc
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=30000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#enable git branch in PS1
source /usr/share/git-core/contrib/completion/git-prompt.sh

## set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi
#
## set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color|*-256color) color_prompt=yes;;
#esac
#
## uncomment for a colored prompt, if the terminal has the capability; turned
## off by default to not distract the user: the focus in a terminal window
## should be on the output of commands, not on the prompt
#force_color_prompt=yes
#
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
#

#new
#default with git and newline (yellow git branch):
   PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;33m\]$(__git_ps1 " (%s)")\n\[\033[00m\]\$ '

## PS1 for ssh session
#if [ -n "$SSH_CLIENT" ]; then
#   PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# My own additions:
# Import colorscheme from 'wal'
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
#(wal -r &) #old
(cat ~/.cache/wal/sequences &)

# If the command above doesn't work,
# try this alternative.
#setsid wal -r

#add ruby gems to path
#export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
#export GEM_HOME=$(ruby -e 'print Gem.user_dir')
#export GEM_PATH=$HOME/.gem

export PATH="${PATH}:${HOME}/.local/bin/"

export EDITOR=nvim
#VISUAL=vim
#export VISUAL EDITOR=vim
#export EDITOR
#export PDFVIEWER=zathura

#more aliases
alias v='nvim'
alias nf='clear && neofetch'
alias remove='~/bashscripts/remove.sh'
alias showfilesize='~/bashscripts/showfilesize.sh'
alias showip='~/bashscripts/showip.sh'
alias cheat='~/bashscripts/cheat.sh'
alias info='info --vi-keys'
alias vnrc='nvim -u NORC'
alias jump='cd "$(cat ~/.jump)"'
alias jtemp='cd "$(cat ~/.jump2)"'
alias gj='echo $(pwd -P) > ~/.jump'
alias n='ncmpcpp'
alias quiz='nvim -R ~/Documents/C/Quiz/quiz.c'
alias themes='~/bashscripts/walthemes.sh'
alias chtheme='~/bashscripts/chtheme.sh'
alias shading='~/bashscripts/shading.sh'
alias stopbg='pkill -9 xwinwrap'
alias weather='cat /tmp/weatherfile'
alias graph='git log --all --decorate --oneline --graph'
alias addsong='mpc current >> ~/Documents/notes/songs'
alias dirzip='~/bashscripts/dirzip.sh'
alias musiczip='~/bashscripts/musiczip.sh'
alias mz='~/bashscripts/musiczip.sh *.zip; cd music'
alias i3screenshot='~/bashscripts/i3screenshot.sh'
alias emoji='~/Downloads/emoji.sh'
alias s='~/bashscripts/scrotclip.sh'
alias book='~/bashscripts/books.sh'
alias pdf='~/bashscripts/pdf.sh'
alias discoverip='~/bashscripts/showhosts.sh'
alias mpvmono='mpv --audio-channels=mono'
alias m='octave --no-gui'
alias mp='octave --no-gui --persist'
alias p='~/bashscripts/vimpdf.sh'
alias yt='~/bashscripts/yt.sh'
alias twitch='~/bashscripts/twitch.sh'
alias fixdisplay='~/bashscripts/fixdisplay.sh'
alias zips='~/bashscripts/zips.sh'
alias music='cd /mnt/D/music/bandcamp'
alias hc='herbstclient'
alias startgnome='~/bashscripts/startgnome.sh'

alias dab='~/Documents/useless\ stuff/dab.sh'
alias doubt='cat ~/Documents/useless\ stuff/doubt'
alias tf2='steam steam://rungameid/440'

#vi intead of neovim for cool retro term
case "$TERM" in
    xterm) alias v='vi';;
esac

peek() { tmux split-window -p 33 "$EDITOR" "$@" || exit; }
