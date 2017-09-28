FROM ubuntu:16.04
MAINTAINER Christopher Jenkins <christj@gmail.com>
WORKDIR /code
RUN apt update
RUN apt install -y lsb-release
RUN apt install -y bundler
#RUN apt install -y curl
#RUN curl -O http://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
#RUN dpkg -i puppetlabs-release-pc1-xenial.deb
#RUN apt update
#RUN apt install -y puppet-agent
##RUN echo "DISTRIB_ID=Ubuntu\nDISTRIB_RELEASE=16.04\nDISTRIB_CODENAME=xenial\nDISTRIB_DESCRIPTION=\"Ubuntu 16.04 LTS\"\n" >> /etc/lsb-release
#COPY Gemfile .
#RUN bundler install --system
#RUN mkdir -p /manifests/get_iplayer
#COPY . /manifests/get_iplayer
#RUN cd /manifests/get_iplayer; rake spec_prep
#RUN mkdir -p /etc/puppetlabs/code/environments
#RUN ln -s /manifests/get_iplayer/spec/fixtures /etc/puppetlabs/code/environments/production
#RUN puppet apply /manifests/get_iplayer/examples/init.pp
EXPOSE 1935
