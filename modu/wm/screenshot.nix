{pkgs}:

pkgs.writeShellScriptBin "screenshot" ''
case $@ in
  screen)
    grim - | wl-copy
    ;;
  region)
    slurp | grim -g - - | wl-copy
    ;;
  window)
    if  [ $XDG_CURRENT_DESKTOP == sway ]; then
      swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"' | grim -g - - | wl-copy
    else
      if [ $XDG_CURRENT_DESKTOP == Hyprland ]; then
        hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | grim -g - - | wl-copy
      else
        echo "This WM is not supported."
      fi
    fi
    ;;
esac
if [ $(notify-send --action 'default=default' "Edit or save screenshot?) == default ]; then
  wl-paste | swappy -f -
fi
''
