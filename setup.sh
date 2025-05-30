#!/bin/bash

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
        echo "curl -sfL https://hhwsun.github.io/test/install.sh | sh"
        ;;
    uninstall)
        echo "curl -sfL https://hhwsun.github.io/test/uninstall.sh | sh"
        ;;
    *)
        echo "Unknown option: $OPTION"
        echo "Available options: install, uninstall"
        exit 1
        ;;
esac
