source dirs.sh

function clean_dir_if_empty {
  if [[ -z $(ls "$1") ]]; then
    rmdir -v "$1"
  else
    echo "Directory \"$1\" is not empty so not removed"
  fi
}

function uninstall {
  for file in $(ls -1 $CONFD); do
    rm -v "$CONFIGDIR/$CONFD/$file"
  done

  # clean up
  clean_dir_if_empty "$CONFIGDIR/$CONFD"
  clean_dir_if_empty "$CONFIGDIR"
}

uninstall