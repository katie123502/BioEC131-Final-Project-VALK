#!/bin/bash

# Check if a sample name is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 sample_name, ex: $0 HHV1" 
    exit 1
fi

SAMPLE_NAME=$1

if [ ! -f "${SAMPLE_NAME}.fna" ]; then
    echo "Error: Fasta file ${SAMPLE_NAME}.fna does not exist."
    exit 1
fi

if [ ! -f "${SAMPLE_NAME}.gff" ]; then
    echo "Error: GFF file ${SAMPLE_NAME}.gff does not exist."
    exit 1
fi

echo "Indexing ${SAMPLE_NAME} fasta"
samtools faidx "${SAMPLE_NAME}.fna"
echo "Finished indexing fasta file. Your indexed fasta is at "

echo "Indexing and cleaning GFF3 File"
jbrowse sort-gff "${SAMPLE_NAME}.gff" > "${SAMPLE_NAME}_genes.gff"
grep -v "^$" "${SAMPLE_NAME}_genes.gff" > "${SAMPLE_NAME}_clean_genes.gff"
bgzip "${SAMPLE_NAME}_clean_genes.gff"
tabix "${SAMPLE_NAME}_clean_genes.gff.gz"
echo "Finished indexing GFF3 File"

echo "Final produced files are: ${SAMPLE_NAME}.fasta.fai, ${SAMPLE_NAME}_clean_genes.gff.gz, and ${SAMPLE_NAME}_clean_genes.gff.gz.tbi"