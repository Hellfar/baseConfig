#!/bin/bash

# https://superuser.com/questions/662974/logging-lock-screen-events#answer-832111

if [ -z "$1" ]
then
  export LOGFILE="~/log/lock_screen.log"
else
  export LOGFILE="$1"
fi

export SCREENSAVERSERVICE="org.mate.ScreenSaver"

exit_report(){
  printf "$(date)\tMonitoring Terminated"
}
trap "exit_report; exit;" 0

lockmon() {
  adddate() {
    while IFS= read -r line; do
      printf "$(date)\t$line" | grep "boolean" | sed 's/   boolean true/Screen Locked/' | sed 's/   boolean false/Screen Unlocked/'
    done
  }
  printf "$(date)\tMonitoring Started"
  dbus-monitor --session "type='signal',interface='$SCREENSAVERSERVICE'" | adddate
}

lockmon >> "$LOGFILE"
