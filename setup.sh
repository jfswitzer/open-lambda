sudo apk update
sudo apk upgrade
sudo apk add --update docker openrc
sudo rc-update add docker boot
sudo addgroup $USER docker
apk add --no-cache clang clang-dev alpine-sdk dpkg
apk add --update --no-cache cmake
apk add --update --no-cache ccache
apk add llvm-dev
sudo apk add curl
sudo apk add go
sudo apk add gcc
sudo apk add g++
sudo apk add build-base
sudo apk add bash
sudo apk add fuse-overlayfs
curl –proto ‘=https’ –tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup target add wasm32-unknown-unknown
cargo install cross

#upgrade to go 1.18
#jen todo fix the cd-ing
git clone https://go.googlesource.com/go goroot
cd goroot
git checkout go1.18
cd src
./all.bash
