#!/usr/bin/env bash

# source configurations
source "$X_COMMAND_DIR/config.sh"

# environment variables
if [ -z "$X_COMMAND_DIR" ]; then export X_COMMAND_DIR=$(dirname $0); fi
if [ -z "$X_DEBUG_MODE" ]; then export X_DEBUG_MODE="true"; fi

# source main file
source "$X_COMMAND_DIR/main.sh"

# source core scripts
__x_source "$X_COMMAND_DIR/core"

# source repository
__x_source "$X_COMMAND_DIR/repo"

# source custom script files
__x_source "$X_COMMAND_DIR/custom"