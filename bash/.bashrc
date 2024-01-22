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
    # alias ls='ls --color=auto'
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

export PATH="${PATH}:${HOME}/.local/bin/"
export PATH="${PATH}:${HOME}/bashscripts/ffmpeg"

export VISUAL=nvim
export EDITOR=nvim

# colorful manpages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
#export PDFVIEWER=zathura

#more aliases
alias nf='clear && neofetch'
alias remove='~/bashscripts/remove.sh'

# one letter aliases
alias s='~/bashscripts/screenshot_clipboard.sh'
alias g='~/bashscripts/get_songkey.sh'
alias mz='cd ~/Downloads; ~/bashscripts/musiczip.sh *.zip; cd music; ranger'

alias pdf='~/bashscripts/pdf.sh'
alias png='~/bashscripts/png.sh'
alias chtheme='~/bashscripts/chtheme.sh'
alias copysong='~/bashscripts/copysong.sh'
alias themes='~/bashscripts/walthemes.sh'
alias shading='~/bashscripts/shading.sh'
alias weather='~/bashscripts/weather.sh'
alias graph='git log --all --decorate --oneline --graph'
alias addsong='mpc current >> ~/Documents/notes/songs'
alias dirzip='~/bashscripts/dirzip.sh'
alias musiczip='~/bashscripts/musiczip.sh'
alias discoverip='~/bashscripts/showhosts.sh'
alias yt='~/bashscripts/yt.sh'
alias fixtablet='~/bashscripts/fix_stuff/fix_tablet.sh'
alias zips='~/bashscripts/zips_in_download_dir.sh'
alias hc='herbstclient'
alias musicstatus='~/bashscripts/musicstatus.sh'
alias downloadsong='~/bashscripts/download_song.sh'
alias cleartrash='rm -rf ~/.trash/*'
alias publicip='curl ipinfo.io/ip'

alias music='cd /mnt/D/music/bandcamp'
alias harmonica='cd ~/Documents/harmonica/'
alias keys='cd ~/Documents/harmonica/keys/'
alias uni='cd ~/Documents/uni/; cd $(fd -d 1| fzf)'

alias circle='feh ~/Pictures/circle-5th.png & disown 2>/dev/null'
alias spotify='~/bashscripts/spot.sh'
alias ff_volume='~/bashscripts/fix_stuff/set_firefox_volume.sh'
alias killpulse='~/bashscripts/personal/killpulse.sh'

alias y='mpv $(xclip -selection c -out)'
alias ya='mpv --no-video $(xclip -selection c -out)'
alias ymp3='yt-dlp -f bestaudio -x --audio-format mp3 $(xclip -selection c -out)'
alias ymusic='yt-dlp -f bestaudio $(xclip -selection c -out)'
alias ycookie='yt-dlp --cookies /home/seb22/Downloads/tmp/cookies/newcookie.txt'

alias ur='setsid -f urxvt -xrm "URxvt.font: xft:spleen:size=12" 2>&1 > /dev/null'
alias ur2='setsid -f urxvt -xrm "URxvt.font: xft:spleen:size=5" 2>&1 > /dev/null'


source /usr/share/fzf/shell/key-bindings.bash

# upload to transfer.sh
transfer() {
	if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
	tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile;
	echo
}

# run in background
sid(){
	setsid $@ >/dev/null 2>&1
}

cut_silence(){
	auto-editor "$@" --video_codec libx264 --no_open
}

only_silence(){
	auto-editor "$@" --video_codec libx264 --edit_based_on not_audio --frame_margin 0 --min_clip_length 1
}

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
PATH="${PATH}:${HOME}/.cargo/bin"

if [ -n "$INSIDE_EMACS" ]; then
	alias v='emacsclient -n'
	export EDITOR='emacsclient -n'
	export VISUAL='emacsclient -n'
fi

bindiff() {
	delta <(xxd "$1") <(xxd "$2")
}
eval "$(zoxide init bash)"

alias http="python -m http.server"

rga-fzf() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
	echo "opening $file" &&
	xdg-open "$file"
}

rfv() {
    # 1. Search for text in files using Ripgrep
    # 2. Interactively narrow down the list using fzf
    # 3. Open the file in Vim
    rg --color=always --line-number --no-heading --smart-case "${*:-}" |
      fzf --ansi \
	  --color "hl:-1:underline,hl+:-1:underline:reverse" \
	  --delimiter : \
	  --preview 'bat --color=always {1} --highlight-line {2}' \
	  --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
	  --bind 'enter:become(nvim {1} +{2})'
}

alias check_thesis='~/bashscripts/personal/check.pl'
alias thesis='cd ~/Documents/master/thesis/; nvim thesis.tex'
