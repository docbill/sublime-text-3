# docbill/sublime-text-3
A docker container to run sublime-text-3 with the specified workspace.

## Overview

This is just a container to avoid the pains of installing sublime-text-3 
natively.
 
## Quick Start

 
If you have already have docker working you can start sublime-text-3 as easily as:

	[ -d ~/workspace ] || mkdir ~/workspace
	xhost local:root
	docker run -i --net=host --rm -v /var/lib/sss:/var/lib/sss:ro -e "DISPLAY=$DISPLAY" -e "HOME=$HOME" -v $HOME:$HOME:z docbill/sublime-text-3

-or- If you wish to restrict sublime-text-3 to a particular workspace:

	[ -d ~/workspace ] || mkdir ~/workspace
	xhost local:root
	docker run -i --net=host --rm -v /var/lib/sss:/var/lib/sss:ro -e "DISPLAY=$DISPLAY" -v "$HOME/workspace/:/workspace/:z" docbill/sublime-text-3

Please note: It is recommended that you remove any existing .config/sublime-text-2 or .config/sublime-text-3 folders.


