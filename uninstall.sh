DIRNAME="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
source "$DIRNAME/dirs.sh"

function clean_dir_if_empty {
  if [[ -z "$(ls -A "$1")" ]]; then
    rmdir -v "$1"
  else
    echo "Directory \"$1\" is not empty so not removed"
  fi
}

function uninstall {
  # clean up all config files
  rm -v "$CONFIG_DIR/$CONFD/"*

  # clean up directories containing the config files
  clean_dir_if_empty "$CONFIG_DIR/$CONFD"
  clean_dir_if_empty "$CONFIG_DIR"
}

uninstall