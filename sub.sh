#!/bin/bash

function error_exit {
    echo $1
    exit
}

case $1 in
    help)
        echo "you can use the following commands:"
        echo "clone...........checks out <TWAN> into your clients folder"
        echo "branch..........creates a branch with <branch-name> in the <TWAN>/branches folder"
        echo "merge...........merges branch into QA"
        echo "help............list of commands for this script"
        ;;
    clone)
        echo "what client would you like to clone?"
        read client
        echo "checking out $client into your clients folder"
        cd ~/IgnitionOne/clients || exit
        svn co REMOTEWORKREPOURLGOESHERE/$client
        ;;
    branch)
        echo "What client are you making a branch for?"
        read twan
        echo "checking client directory"
        cd ~/IgnitionOne/clients/$twan || error_exit "$twan is not a client directory in your clients folder. Please clone the client before creating a branch."
        echo "client directory exists"
        echo "What will you name your branch?"
        read branch
        echo "first updating client"
        svn update
        echo "now creating branch $branch in $twan/branches"
        svn cp trunk branches/$branch
        echo "finally committing branch with message 'ADD new branch $branch'"
        svn ci -m "ADD new branch $branch"
        ;;
    merge)
        echo "what is the qa branch?"
        read qa
        cd ../$qa || error_exit "$qa is not the correct name for this client's qa branch"
        echo "what revision do you want to merge?"
        read revision
        echo "what is your branch?"
        read branch
        if cd ../$branch || error_exit "i think you misspelled your branch."
            then
                echo "good branch"
                cd ../$qa
        fi
        echo "merging revision $revision of branch $branch into $qa"
        svn update
        svn merge -c $revision ../$branch
        svn ci -m "merged r$revision from $branch branch into $qa"
        ;;
    *)
        echo "command not found"
        echo "type sub help for a list of commands"
        ;;
esac