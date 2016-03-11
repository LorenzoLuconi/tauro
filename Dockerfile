FROM centos:6

RUN 	yum install -y http://fedora.uib.no/epel/6/i386/epel-release-6-8.noarch.rpm && \
	yum install -y tre-devel expat-devel zlib-devel gcc automake && \
	yum clean all

WORKDIR /root
RUN curl http://www.signum.sns.it/fileadmin/Archivio_files/Area_testi/TauRo-1.0.2a.tar.gz | tar -xz

WORKDIR TauRo
RUN aclocal && autoheader && automake && ./configure && make && make install

