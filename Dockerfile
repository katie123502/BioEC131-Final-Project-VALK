FROM gmod/jbrowse-web:latest

# Install Other Tools
# TODO: Update tools we want here
RUN apt-get update && apt-get install -y \
    bowtie \
    bowtie2 \
    samtools \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set up JBrowse2 (data and configurations can be added here too)
COPY herpes-genomes /jbrowse/data
# Optionally, copy over your Bowtie index or data
# COPY my-bowtie-index /jbrowse/data/bowtie-index