xdotool type $(grep -v '^#' ~/.local/share/snippets/bookmarks | dmenu -i -l 50 -b -w 0 | cut -d' ' -f1)
