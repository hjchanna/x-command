#!/usr/bin/env bash

function __install_() {
    local qualifier reference destination

    qualifier="$1"
    reference="$2"

    case "$qualifier" in
    file)
        # install a file
        ;;
    url)
        # install a url such as gist
        destination="$X_COMMAND_DIR/repo"
        
        ;;
    git)
        # install a repository
        destination="$X_COMMAND_DIR/repo"

        git clone "$reference" "$destination"
        ;;
    esac
}