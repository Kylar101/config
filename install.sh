#!/bin/bash

cargo()
{
  LIBRARY=$1
  echo "Installing $LIBRARY with cargo"
  run=$(cargo install $LIBRARY) || echo "Unable to install $LIBRARY"
  echo "Successfuly installed $LIBRARY"
  return
}

install_library()
{
  LIBRARY=$1
  METHOD=$2
  echo "---- Checking for $LIBRARY ----"
  if ! type -P $LIBRARY; then
    $METHOD $LIBRARY
  else
    return
  fi
}

# install_library bat cargo
# Setup work spaces
mkdir -p ~/_repos
mkdir -p ~/_work
