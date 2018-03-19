#!/bin/bash
sh ~/scripts/clients_update.sh
svn update ~/IgnitionOne/mat
svn update ~/IgnitionOne/HIL5
svn update ~/IgnitionOne/tools
svn update ~/IgnitionOne/systems
svn update ~/IgnitionOne/projects
svn update ~/IgnitionOne/modules
svn update ~/IgnitionOne/SVNlibrary
git -C ~/IgnitionOne/WPT/mat-backend pull origin master
git -C ~/IgnitionOne/WPT/mat-legacy pull origin master
git -C ~/IgnitionOne/WPT/mat-omg pull origin master
git -C ~/IgnitionOne/WPT/mat-skins pull origin master