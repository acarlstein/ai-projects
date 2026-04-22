#!/bin/bash
# Download and extract the MovieLens ml-latest-small dataset

set -e

DATA_URL="https://files.grouplens.org/datasets/movielens/ml-latest-small.zip"
DATA_ZIP="ml-latest-small.zip"
DATA_DIR="ml-latest-small"

# Parse -y flag for auto-confirmation
AUTO_YES=false
for arg in "$@"; do
  if [ "$arg" = "-y" ]; then
    AUTO_YES=true
  fi
done


# Detect OS for package installation
OS_TYPE="$(uname)"
ask_install() {
  local pkg="$1"
  if [ "$OS_TYPE" = "Darwin" ]; then
    # macOS uses brew
    if ! command -v brew >/dev/null 2>&1; then
      echo "Homebrew is required to install $pkg. Please install Homebrew from https://brew.sh/ and re-run this script."
      exit 1
    fi
    if $AUTO_YES; then
      echo "Installing $pkg with brew (auto-confirmed)..."
      brew install "$pkg"
    else
      read -p "Install $pkg with brew? [Y/n] " yn
      case $yn in
        [Yy]*|"") brew install "$pkg";;
        *) echo "$pkg is required. Exiting."; exit 1;;
      esac
    fi
  else
    # Assume Linux with apt-get
    if $AUTO_YES; then
      echo "Installing $pkg (auto-confirmed)..."
      sudo apt-get install -y "$pkg"
    else
      read -p "Install $pkg? [Y/n] " yn
      case $yn in
        [Yy]*|"") sudo apt-get install -y "$pkg";;
        *) echo "$pkg is required. Exiting."; exit 1;;
      esac
    fi
  fi
}

# Check for wget
if ! command -v wget >/dev/null 2>&1; then
  echo "wget not found."
  ask_install wget
fi

# Check for unzip
if ! command -v unzip >/dev/null 2>&1; then
  echo "unzip not found."
  ask_install unzip
fi

if [ -d "$DATA_DIR" ]; then
  echo "Directory $DATA_DIR already exists. Remove it if you want to re-download."
  exit 0
fi

wget "$DATA_URL" -O "$DATA_ZIP"
unzip "$DATA_ZIP"
rm "$DATA_ZIP"
echo "MovieLens dataset downloaded and extracted to $DATA_DIR/"
