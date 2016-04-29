FROM ubuntu
MAINTAINER Bill C Riemers https://github.com/docbill

ARG URL=https://download.sublimetext.com/sublime-text_build-3103_amd64.deb
RUN apt-get update -y && \
	apt-get install -y sudo curl wget libglib2.0-0 libx11-6 libgtk2.0-0 language-pack-en-base && \
	wget --quiet --output-document=/tmp/sublime-text.deb "$URL" && \
	apt-get install -y -f /tmp/sublime-text.deb && \
	rm -f /tmp/sublime-text.deb && \
	apt-get clean -y all

ADD Dockerfile /Dockerfile
ADD subl-wrapper /usr/local/bin/subl-wrapper

RUN chmod 555 /usr/local/bin/subl-wrapper

VOLUME /workspace
ENV HOME=/workspace DISPLAY=:0 LC_ALL=en_US.UTF-8
WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/subl-wrapper"]

