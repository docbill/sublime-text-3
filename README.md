# docbill/sublime-text-3
A docker container to run sublime-text-3 with the specified workspace.

## Overview

This is just a container to avoid the pains of installing sublime-text-3 
natively.
 
## Quick Start

 
If you have already have docker working you can start sublime-text-3 as easily as:

	[ -d ~/workspace ] || mkdir ~/workspace
	xhost local:root
	docker run -i --net=host --rm -e DISPLAY -v $HOME/workspace/:/workspace/:z docbill/sublime-text-3

For windows this was a bit more complicated.  I had to make sure Xwin (from
cygwin) was started with the -listen tcp option, and that security was 
disabled.  Once that was done the following command worked:

	docker run -i --rm -e DISPLAY=172.31.253.119:0 -v /d/cygwin64/home/docbi/workspace/:/workspace/:z docbill/sublime-text-3

Where my ip address is 172.31.253.119, and the folder I wanted the workspace in
was D:\cygwin64\home\docbi\workspace\


