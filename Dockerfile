FROM ubuntu:16.04

# install wine
RUN dpkg --add-architecture i386
RUN apt-get clean && apt-get update --fix-missing
RUN apt-get install -y software-properties-common --no-install-recommends
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ xenial universe multiverse"
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ xenial-updates universe multiverse"

RUN apt-get clean && apt-get update --fix-missing
RUN apt-get install -y \
  wine1.6 \
  wine1.6-i386 \
  wine-development \
  wine-mono0.0.8 \
  wine-gecko2.21 \
  xauth \
  xvfb \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

# https://sourceforge.net/projects/wine/files/
ADD http://pilotfiber.dl.sourceforge.net/project/wine/Wine%20Gecko/2.21/wine_gecko-2.21-x86.msi /usr/share/wine/gecko/wine_gecko-2.21-x86.msi

ADD https://app-updates.agilebits.com/download/OPW4 /usr/src/1Password.exe

RUN xvfb-run -a bash -c "\
  WINEDLLOVERRIDES=mscoree=d wine /usr/src/1Password.exe /VERYSILENT && \
  wineserver -k"

ENV HOME /root
WORKDIR $HOME

CMD [ "wine", "/root/.wine/drive_c/Program Files (x86)/1Password 4/1Password.exe" ]

