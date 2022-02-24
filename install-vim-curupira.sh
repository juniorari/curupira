#!/bin/bash

curupira=$(pwd) # TODO better word directory awareness 

miscdots=(
    'bashrc'
    'gitconfig'
    'gitignore_global'
    'inputrc'
    'tmux.conf'
)

vimdots=('vim' 'vimrc')

# combine miscdots and vimdots
dots=( ${miscdots[@]} ${vimdots[@]} )

function test_path_exist {
    if [ -e $1 ]; then
        echo "Move '$1' to a backup folder and Re-run this script."
        exit 1
    fi
}

function check_existing_path {
    for i in ${dots[@]}; do
        test_path_exist "$HOME/.$i"
    done
}


function remove_existing_symlinks {
    for i in ${dots[@]}; do
        filepath="$HOME/.$i"
        if [ -h $filepath ]; then
            echo "Removing old symbolic link"
            rm $filepath
        fi
    done
}


function create_symlinks {
    for i in ${miscdots[@]}; do
        ln -s $curupira/misc/$i "$HOME/.$i"
    done

    for i in ${vimdots[@]}; do
        ln -s $curupira/$i "$HOME/.$i"
    done
}


function main {
    remove_existing_symlinks
    check_existing_path
    create_symlinks
    echo 'Done.'
    exit
}


main
