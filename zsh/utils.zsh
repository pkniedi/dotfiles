function afk() {
    pgrep vlc &>/dev/null && {echo there is a video playing;return 1}
    systemctl suspend
}
