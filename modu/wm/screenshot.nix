{pkgs}:

pkgs.writeShellScriptBin "screenshot" ''
  # region|window|output|all
  mode="$1"

  case $mode in
      "region")
          grim -g "$(slurp)" - | swappy -f -
          ;;
      "window")
          grim -g "$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')" - | swappy -f -
          ;;
      "output")
          grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') - | swappy -f -
          ;;
      "all")
          grim - | swappy -f -
          ;;
      *)
          echo >&2 "unsupported command \"$mode\""
          echo >&2 "Usage:"
          echo >&2 "screenshot.sh <region|window|output|all>"
          exit 1
  esac
''
