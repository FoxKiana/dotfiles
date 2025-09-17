export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/home/foxkiana/.local/bin"
export PATH="$PATH:/home/foxkiana/dev/sdk/windows-sdk/bin/x64"
export EDITOR=nvim

ZSH_THEME="amuse"

plugins=(git)

source $ZSH/oh-my-zsh.sh

mkcd() {
    mkdir -p "$1" && cd "$1";
}

ytdl() {
    yt-dlp --extract-audio --audio-format mp3 --embed-thumbnail --convert-thumbnails jpg --output "~/Music/%(playlist_title)s/%(title)s.%(ext)s" "$1"
}

count() {
    find "$2" -name "*.$1" -type f | xargs wc -l
}

update() {
    sudo reflector --verbose --sort rate -l 50 --save /etc/pacman.d/mirrorlist
    sudo pacman -Syuu
}

alias ls="exa -T --icons -L1 -B --no-permissions --no-user --no-time"
alias cd=z
alias vim=nvim
alias htop=btm
alias neofetch="neofetch --separator \" \""

eval "$(zoxide init zsh)"

neofetch

# bun completions
[ -s "/home/foxkiana/.bun/_bun" ] && source "/home/foxkiana/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
