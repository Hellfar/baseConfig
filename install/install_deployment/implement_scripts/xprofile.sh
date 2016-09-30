#!/bin/bash

IFS=: read product dest <<< `echo "$2"`

# .xprofile
export lines="# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] && source /etc/xprofile
[ -f ~/.xprofile ] && source ~/.xprofile"

echo "$lines"
sed -n 'H;${x;s/(# invoke global X session script\n)?\. \/etc\/X11\/Xsession/test\
&/;p;}' tmp.txt
