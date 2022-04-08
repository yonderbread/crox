#!/usr/bin/env bash
set -e
#if [ ! [ -d /usr/local/go ]]; then
#  rm -rf /usr/local/go && tar -C /usr/local -xzfv
#fi

#export QT_DEBUG=false
#export QT_DEBUG_CONSOLE=false
#export QT_STUB=false
#export QT_QMAKE_DIR=
#export QT_DIR=$HOME/qt
export QT_VERSION=5.13.0
export QT_API=5.13.0

# For go versions 1.10.x
#
#export CGO_CFLAGS_ALLOW=".*"
#export CGO_CXXFLAGS_ALLOW=".*"
#export CGO_LDFLAGS_ALLOW=".*"

sudo apt update && sudo apt install -y git curl
sudo apt install -y build-essential g++ libglu1-mesa-dev libpulse-dev libglib2.0-dev
sudo apt upgrade -y

export GOTEMP_DIR="$(mktemp -d)"
rm -rf $GOTEMP_DIR
mkdir -p $GOTEMP_DIR && rm -vf /tmp/gotemp.tar.gz
wget "https://go.dev/dl/go1.18.linux-amd64.tar.gz" -O /tmp/gotemp.tar.gz
echo "SHA256: $(sha256sum /tmp/gotemp.tar.gz)"
tar -C "$GOTEMP_DIR" -xzvf /tmp/gotemp.tar.gz
#rm -rf /tmp/gotemp.tar.gz
export PATH=$PATH:$GOTEMP_DIR

sleep 0.5
chmod a+x $GOTEMP_DIR/go/bin/go
echo "Verifying go install"
$GOTEMP_DIR/go/bin/go version

echo "Building crox"
$GOTEMP_DIR/go/bin/go build -x .

rm -rf $GOTEMP_DIR
