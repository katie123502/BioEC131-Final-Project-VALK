# from node image
FROM node:16-buster

LABEL org.opencontainers.image.authors="toni.hermoso@crg.eu"

ARG SAMTOOLS_VERSION=1.15.1
ARG HTSLIB_VERSION=1.15.1

# Handle dependencies
RUN apt-get update && apt-get -y upgrade && apt-get -y install build-essential git zlib1g-dev \
	genometools && \
	apt-get clean && echo -n > /var/lib/apt/extended_states

RUN mkdir -p /soft/bin

RUN wget -q https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 && \
	tar jxf samtools-${SAMTOOLS_VERSION}.tar.bz2 && \
	cd samtools-${SAMTOOLS_VERSION} && \
	make prefix=/soft/samtools install && \
	cd /soft/bin && ln -s /soft/samtools/bin/* . && cd /soft && \
	rm -rf *tar.bz2

RUN wget -q https://github.com/samtools/htslib/releases/download/${HTSLIB_VERSION}/htslib-${HTSLIB_VERSION}.tar.bz2 && \
	tar jxf htslib-${HTSLIB_VERSION}.tar.bz2 && \
	cd htslib-${HTSLIB_VERSION} && \
	make prefix=/soft/htslib install && \
	cd /soft/bin && ln -s /soft/htslib/bin/* . && cd /soft && \
	rm -rf *tar.bz2

# PATH
ENV PATH=$PATH:/soft/bin

RUN mkdir -p /srv

WORKDIR /srv

COPY index.js .
COPY package.json .

RUN npm install -g forever
RUN npm install -g @jbrowse/cli
RUN npm install

# Volumes
VOLUME /var/www
VOLUME /data

EXPOSE 8080
CMD ["forever", "start", "--minUptime", "1000", "--spinSleepTime", "1000", "index.js"]

# FROM node:16

# # Install dependencies
# RUN apt-get update && apt-get install -y \
#     bowtie \
#     bowtie2 \
#     samtools \
#     git \
#     wget \
#     && apt-get clean && rm -rf /var/lib/apt/lists/*

# RUN mkdir -p /jbrowse2
# WORKDIR /jbrowse2

# #data
# RUN mkdir -p /srv
# WORKDIR /srv
# COPY herpes-genomes/HHV1.fasta .
# COPY herpes-genomes/HHV1.fasta.fai .
# # Install JBrowse2
# RUN npm install -g forever
# RUN npm install -g @jbrowse/cli

# RUN jbrowse-server start /srv --host 0.0.0.0 --port 8080 &

# # Expose the correct port for Apache
# EXPOSE 8080