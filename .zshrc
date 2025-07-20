export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/home/snowfox/.local/bin"
export EDITOR=nvim

ZSH_THEME="amuse"

plugins=(git)

source $ZSH/oh-my-zsh.sh

mkcd() {
    mkdir -p "$1" && cd "$1";
}

ytdl() {
    pipx run yt-dlp --extract-audio --audio-format mp3 --embed-thumbnail --convert-thumbnails jpg --output "~/Music/%(playlist_title)s/%(title)s.%(ext)s" "$1"
}

count() {
    find "$2" -name "*.$1" -type f | xargs wc -l
}

alias ls="exa -T --icons -L0 -B --no-permissions --no-user --no-time"
alias cd=z
alias vim=nvim
alias htop=btm
alias neofetch="neofetch --separator \" \""

eval "$(zoxide init zsh)"

neofetch
