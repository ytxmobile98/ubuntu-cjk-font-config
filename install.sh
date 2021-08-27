source dirs.sh

function install {
  mkdir -pv "$CONFIGDIR"
  cp -rv "$CONFD" "$CONFIGDIR"
}

install