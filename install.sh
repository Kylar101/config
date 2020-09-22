install_library()
{
  LIBRARY=$1
  echo "---- Checking for $LIBRARY ----"
  if ! type -P $LIBRARY; then
    echo "does not exist"
  else
    return
  fi
}

install_library bat
