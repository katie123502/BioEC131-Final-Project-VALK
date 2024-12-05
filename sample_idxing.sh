#!/bin/bash

# Check if a sample name is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 annotated_genome(GFF3 format)" 
    exit 1
fi

#Extract sample name
FILE_NAME=$1
SAMPLE_NAME="${FILE_NAME%.gff3}"

#sort gff file for tabix
jbrowse sort-gff "${FILE_NAME}" > "${SAMPLE_NAME}_genes.gff"
#delete any empty rows
grep -v "^$" "${SAMPLE_NAME}_genes.gff" > "${SAMPLE_NAME}_clean_genes.gff"
#compress file
bgzip "${SAMPLE_NAME}_clean_genes.gff"
#index compressed annotated genome
tabix "${SAMPLE_NAME}_clean_genes.gff.gz"