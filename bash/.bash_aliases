# navigation
alias gj='echo $(pwd -P) > ~/.jump'
alias jump='cd "$(cat ~/.jump)"'

# replace core programs
alias tree='eza -T'
alias ls='eza'

# update yt-dlp
alias yu='pip install --user --upgrade yt-dlp'

# mpv with mono audio
alias mpvmono='mpv --audio-channels=mono'
alias mpvjack='mpv --ao=jack'

# use vi keys for gnu info
alias info='info --vi-keys'

# GNU Octave
alias m='octave --no-gui -q'
alias mp='octave --no-gui --persist -q'

# hide banners and startup messages
alias ffprobe='ffprobe -hide_banner'
alias gdb='gdb -q'

# misc
alias clip='xclip -selection clipboard'
alias lscreenshot='import -window root -crop 2560x1440+0+0'
alias rscreenshot='import -window root -crop 1920x1080+2560+0'
alias eclient='emacsclient -n'
alias magit='emacsclient -n -e "(magit-status)"'
alias aac='video4discord -c aac -a 128'

# one letter aliases for most used programs
alias v='nvim'
alias n='ncmpcpp'
alias r='ranger'
