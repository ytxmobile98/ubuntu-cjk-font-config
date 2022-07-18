DIRNAME="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
source "$DIRNAME/dirs.sh"

function install {
  mkdir -pv "$CONFIG_DIR"
  cp -rv "$DIRNAME/$CONFD" "$CONFIG_DIR"
}

install