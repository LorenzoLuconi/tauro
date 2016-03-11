FROM centos:6

# Dipendenze
RUN 	yum install -y http://fedora.uib.no/epel/6/i386/epel-release-6-8.noarch.rpm && \
	yum install -y tre-devel expat-devel zlib-devel gcc automake supervisor && \
	yum clean all

# Compilazione
RUN curl http://www.signum.sns.it/fileadmin/Archivio_files/Area_testi/TauRo-1.0.2a.tar.gz | tar -xz && \
	cd TauRo && aclocal && autoheader && automake && ./configure && make && make install && cd / && rm -Rf /TauRo 

RUN mkdir /tauro
WORKDIR tauro
RUN mkdir {data,conf,log}
COPY conf/* conf/

