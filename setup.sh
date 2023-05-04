doas apk add --update docker openrc
doas rc-update add docker boot
doas apk add llvm-dev
doas apk add clang-dev
doas apk add curl
doas apk add alpine-sdk
doas adduser $USER docker
wget -q -O /tmp/go.tar.gz https://go.dev/dl/go1.18.3.linux-amd64.tar.gz
doas tar -C /usr/local -xzf /tmp/go.tar.gz
doas ln -s /usr/local/go/bin/go /usr/bin/go
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain=nightly-2022-07-25
source $HOME/.cargo/env
rustup target add wasm32-unknown-unknown
cargo install cross
