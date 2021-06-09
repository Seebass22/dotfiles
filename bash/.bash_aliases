# navigation
alias gj='echo $(pwd -P) > ~/.jump'
alias jump='cd "$(cat ~/.jump)"'

# replace core programs
alias tree='exa -T'
alias ls='exa'

# update youtube-dl
alias yu='pip install --user --upgrade youtube-dl'

# mpv with mono audio
alias mpvmono='mpv --audio-channels=mono'
alias mpvjack='mpv --ao=jack'

# GNU Octave
alias m='octave --no-gui -q'
alias mp='octave --no-gui --persist -q'

# hide banners and startup messages
alias ffprobe='ffprobe -hide_banner'
alias gdb='gdb -q'

# misc
alias clip='xclip -selection clipboard'
alias lscreenshot='import -window root -crop 1920x1080+0+0'
alias rscreenshot='import -window root -crop 1920x1080+1920+0'
alias eclient='emacsclient -n'
alias magit='emacsclient -n -e "(magit-status)"'

# one letter aliases for most used programs
alias v='nvim'
alias n='ncmpcpp'
alias r='ranger'
