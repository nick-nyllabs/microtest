FROM ubuntu:14.04
MAINTAINER Nick Palenchar
RUN apt-get update && apt-get install -y curl wget default-jre git python
RUN adduser --home /home/nick --disabled-password --gecos '' nick
RUN echo '%sudo ALL=(ALL) NOPASS:ALL' >> /etc/sudoers
USER nick
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "source /home/sinatra/.rvm/scripts/rvm"
RUN /bin/bash -l -c "rvm install 2.1.2"
RUN /bin/bash -l -c "gem install sinatra"
RUN /bin/bash -l -c "gem install thin"
RUN /bin/bash -l -c "gem install aws-sdk"
RUN wget -O /home/sinatra/dynamodb_local.tar.gz https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_2013-12-12.tar.gz
RUN tar -C /home/sinatra -xvzf /home/sinatra/dynamodb_local.tar.gz