# Run 1Password4 (for windows) via Wine in a container
# Linux with Linux in Docker + wine + .exe .. What could go wrong? If you like GIGANTIC NON-EFFICIENT DOCKER BUILDS WITH SLOW MIRRORS that's 100%  pure cruft. You're in the right place.
#
# Perform the `xhost +local:root` trick {*Thanks John*}
#
# Note: If you want to use browser extensions with this, you'll need to add net="host" to your run command. However it's very unsecure so run at your own risk.
#
# docker run -it --name 1password \ 
# -v /tmp/.X11-unix:/tmp/.X11-unix \
# -v $HOME/Dropbox:/root/Dropbox \
# -e DISPLAY=unix$DISPLAY --net="host" \
# volcomism/1pass:4.x

.rawr.
