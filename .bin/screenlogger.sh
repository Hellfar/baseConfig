#!/bin/bash

# https://superuser.com/questions/662974/logging-lock-screen-events#answer-832111

export SCREENSAVERSERVICE="org.mate.ScreenSaver"

exit_report(){
echo "$(date) Monitoring Terminated."
}
trap "exit_report; exit;" 0

lockmon() {
adddate() {
    while IFS= read -r line; do
      echo "$(date) $line" | grep "boolean" | sed 's/   boolean true/Screen Locked/' | sed 's/   boolean false/Screen Unlocked/'
    done
}
echo "$(date) Monitoring Started."
dbus-monitor --session "type='signal',interface='$SCREENSAVERSERVICE'" | adddate

}

lockmon >> ~/log/lock_screen.log
