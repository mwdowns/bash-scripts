#!/bin/bash

# You'll want to edit the case match in the for loop with any really big clients you have.

check_update()
{
    echo "$1 is a big client. sure you wanna update now? (y/n -- default n)"
    read -t 10 -p "" answer || answer="n"
    case $answer in
        y)
            echo "you asked for it. updating $1"
            svn update
            ;;
        n)
            echo "moving on"
            ;;
        *)
            echo "you must type a y or n"
            check_update $1
            ;;
    esac
}

easy_update()
{
    echo "updating $1"
    svn update
}

for d in ~/IgnitionOne/clients/* ; do
    cd $d || exit
    case $d in
        PATHTOLOCAL/IgnitionOne/clients/GMDS_OPEL)
            check_update $d
            ;;
        PATHTOLOCAL/IgnitionOne/clients/GMDS_CHEVROLET)
            check_update $d
            ;;
        PATHTOLOCAL/IgnitionOne/clients/GMC)
            check_update $d
            ;;
        *)
            easy_update $d
            ;;
    esac
done