#!/bin/bash -e
export HOME=/workspace
if [ -z "$DISPLAY" -o ! -d "$HOME" ]
then
  echo 'Usage: sudo docker run -ti --net=host --rm -e DISPLAY -v $HOME/workspace/:/workspace/ subl' 2>&1
  exit 1
fi
cd "$HOME"

values=( $(stat -c '%g %u' /workspace) )
XGID=${values[0]}
XUID=${values[1]}

groupadd -f -g $XGID g$XGID 2>>/dev/null || true
useradd -u $XUID -g g$XGID -d /workspace u$XUID-$XGID 2>>/dev/null || usermod -u $XUID -g g$XGID u$XUID-$XGID 2>>/dev/null

exec sudo -u u$XUID-$XGID /usr/bin/subl "$@"
