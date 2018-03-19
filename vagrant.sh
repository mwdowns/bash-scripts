#!/bin/bash

cd ~/IgnitionOne || exit
case $1 in
    help)
        echo "you can use the following commands:"
        echo "v ssh.......ssh into vagrant"
        echo "v up........vagrant up"
        echo "v up-p......vagrant up --provision"
        echo "v halt......vagrant halt"
        echo "v tail......ssh into vagrant and run tail"
        echo "v help......list of commands for this script"
        ;;
    ssh)
        ssh root@10.0.0.10
        ;;
    up)
        echo "starting vagrant"
        vagrant up
        ;;
    up-p)
        echo "starting vagrant and updating"
        vagrant up --provision
        ;;
    halt)
        echo "stopping vagrant"
        vagrant halt
        ;;
    tail)
        echo "running tail"
        sh ~/scripts/vagrant_tail.sh
        ;;
    *)
        echo "command not found"
        echo "type v help for a list of commands"
        ;;
esac
