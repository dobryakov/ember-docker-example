FROM phusion/passenger-full:0.9.19
ENV HOME /root
CMD ["/sbin/my_init"]

RUN apt-get update && \
    apt-get install -y wget curl nano unzip git mc sudo autoconf automake && \
    curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash - && \
    apt-get install -y nodejs && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ARG uid=9999
ARG gid=9999
RUN usermod -u $uid app && groupmod -g $gid app

WORKDIR /home/app

# https://docs.npmjs.com/getting-started/fixing-npm-permissions
RUN su - app -c "mkdir ~/.npm-global" && \
    su - app -c "npm config set prefix '~/.npm-global'" && \
    su - app -c "echo export PATH=~/.npm-global/bin:$PATH >> ~/.profile"

RUN \
    cd /tmp &&\
	git clone https://github.com/facebook/watchman.git &&\
	cd watchman &&\
	git checkout v3.5.0 &&\
  ./autogen.sh &&\
  ./configure &&\
	make &&\
    make install

RUN su - app -c 'cd /home/app && npm install -g bower phantomjs ember-cli'
RUN su - app -c "cd /home/app && ember new ember-app"

# it is recommend to run at your HOST machine:
# sysctl -w fs.inotify.max_user_watches=10485760
