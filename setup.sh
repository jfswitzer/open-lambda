doas apk update
doas apk upgrade
doas apk add --update docker openrc
doas rc-update add docker boot
doas adduser $USER docker
apk add --no-cache clang clang-dev alpine-sdk dpkg
apk add --update --no-cache cmake
apk add --update --no-cache ccache
apk add llvm-dev
doas apk add curl
doas apk add go
doas apk add gcc
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain=nightly-2022-07-25
curl –proto ‘=https’ –tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup target add wasm32-unknown-unknown
cargo install cross
