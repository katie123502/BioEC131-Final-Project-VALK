#!/bin/bash

# Check if a sample name is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 annotated_genome(GFF3 format)" 
    exit 1
fi

FILE_NAME=$1
SAMPLE_NAME="${FILE_NAME%.gff3}"

jbrowse sort-gff "${FILE_NAME}" > "${SAMPLE_NAME}_genes.gff"
grep -v "^$" "${SAMPLE_NAME}_genes.gff" > "${SAMPLE_NAME}_clean_genes.gff"
bgzip "${SAMPLE_NAME}_clean_genes.gff"
tabix "${SAMPLE_NAME}_clean_genes.gff.gz"
jbrowse add-track "${SAMPLE_NAME}_clean_genes.gff.gz" --out "${JBROWSE2_ROOT}/jbrowse2" --load copy --assemblyNames "${SAMPLE_NAME}.fasta"
jbrowse text-index --out "${JBROWSE2_ROOT}/jbrowse2"