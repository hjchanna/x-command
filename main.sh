#!/usr/bin/env bash

# -------------------------------------------------
# MAIN ENTRY POINT
# -------------------------------------------------
function x() {
    local xcommand p1 p2 p3 p4 p5
    local command_path=""
    local final_result=0
    local x="\U0002694\U000FE0F"

    xcommand="$1"
    __x_echo_debug "initialising x-command: $xcommand"

    p1="$2"
    p2="$3"
    p3="$4"
    p4="$5"
    p5="$6"

    command_path=$(__x_command_path "$xcommand")

    # built-in functions

    # profile

    # locate

    # install [file|url|git]

    # delete [x-command]

    # help

    # env [add|delete]

    # new [simple|package]

    # source

    # export

    # alias

    if [ -z "$command_path" ]; then
        __x_echo_error "x-command not found"
    else
        __x_echo_debug "x-command found at: $command_path"

        __"$xcommand"_ "$p1" "$p2" "$p3" "$p4" "$p5"
        final_result=$?
    fi

    echo -e "$x command completed with result: $final_result"

    return final_result
}

# -------------------------------------------------
# CORE FUNCTIONS
# -------------------------------------------------
# source script files
function __x_source() {
    # source shell scripts
    OLD_IFS="$IFS"
    IFS=$'\n'
    scripts=($(find "$1" -type f -name '*.sh'))
    for script in "${scripts[@]}"; do
        source "$script"
        __x_echo_debug "$script is successfully sourced"
    done
    IFS="$OLD_IFS"
    unset OLD_IFS scripts script

    # source sub dirs
    sub_dirs=($(find "$1" -type d))
    for sub_dir in "${sub_dirs[@]}"; do
        if [ "$sub_dir" != "$1" ]; then
            __x_source "$sub_dir"
        fi
    done
    unset sub_dir sub_dirs
}

function __x_command_path() {
    path=""

    # file based commands
    if [ -f "$X_COMMAND_DIR/core/$1.sh" ]; then path="$X_COMMAND_DIR/core/$1.sh"; fi
    if [ -f "$X_COMMAND_DIR/repo/$1.sh" ]; then path="$X_COMMAND_DIR/repo/$1.sh"; fi
    if [ -f "$X_COMMAND_DIR/custom/$1.sh" ]; then path="$X_COMMAND_DIR/custom/$1.sh"; fi

    # directory based commands
    if [ -f "$X_COMMAND_DIR/core/$1/main.sh" ]; then path="$X_COMMAND_DIR/core/$1"; fi
    if [ -f "$X_COMMAND_DIR/repo/$1/main.sh" ]; then path="$X_COMMAND_DIR/repo/$1"; fi
    if [ -f "$X_COMMAND_DIR/custom/$1/main.sh" ]; then path="$X_COMMAND_DIR/custom/$1"; fi

    echo $path
}

# terminal output
function __x_echo() {
    echo -e "\033[1;$1$2\033[0m"
}

# echo in red
function __x_echo_error() {
    __x_echo "31m" "$1"
}

# echo in yellow
function __x_echo_warn() {
    __x_echo "33m" "$1"
}

# echo in green
function __x_echo_info() {
    __x_echo "32m" "$1"
}

# echo for debug
function __x_echo_debug() {
    if [[ "$X_DEBUG_MODE" == 'true' ]]; then
        echo -e "$1"
    fi
}