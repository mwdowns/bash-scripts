#!/bin/bash

case $1 in
    personal)
        echo "changing git creds to personal"
        sh ~/scripts/mygitcreds.sh personal
        ;;
    work)
        echo "changing git creds to work"
        sh ~/scripts/mygitcreds.sh work
        ;;
    who)
        echo "this is the user"
        git config --list
        ;;
    *)
        echo "i don't recognize that name"
        ;;
esac

# this script points to a script that is in the gitignore of this repo
# create a file called mygitcreds.sh in your folder
# add the following code to the file with your info inserted into the various fields
#
# case $1 in
#   work)
#       git config --global user.name "<PUT WORK NAME HERE>"
#       git config --global user.email "<PUT WORK EMAIL HERE>"
#       ;;
#   personal)
#       git config --global user.name "<PUT NAME HERE>"
#       git config --global user.email "<PUT EMAIL HERE>"
#       ;;
#   *)
#       ;;
# esac