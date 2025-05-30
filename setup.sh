#!/bin/sh

if [ $# -eq 0 ]; then
    echo "Usage: $0 <option>"
    exit 1
fi

OPTION=$1

case "$OPTION" in
    hello)
        curl -sfL https://hhwsun.github.io/test/hello.sh | sh -s
        ;;
    install)
        if command -v k3s > /dev/null 2>&1; then
            echo "k3s was already installed."
        else
            echo "Install k3s: curl -sfL https://hhwsun.github.io/test/install.sh | K3S_TOKEN=MYK3SSECRET sh -s - server --cluster-init"
            curl -sfL https://hhwsun.github.io/test/install.sh | K3S_TOKEN=MYK3SSECRET sh -s - server --cluster-init
        fi
        ;;
    uninstall)
        if command -v k3s > /dev/null 2>&1; then
            echo "Uninstall k3s: curl -sfL https://hhwsun.github.io/test/uninstall.sh | sh -s"
            curl -sfL https://hhwsun.github.io/test/uninstall.sh | sh -s
        else
            echo "k3s was not installed."
        fi
        ;;
    *)
        echo "Unknown option: $OPTION"
        echo "Available options: install, uninstall"
        exit 1
        ;;
esac
