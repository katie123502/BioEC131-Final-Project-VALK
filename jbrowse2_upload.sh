#!/bin/bash

# Check if a sample assembly is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 sample_name, ex: $0 HHV1" 
    exit 1
fi

# Ensure JBROWSE2_ROOT is equal to the path to the folder jbrowse2/
if [ -z "$JBROWSE2_ROOT" ]; then
    echo "Use export to set JBROWSE2_ROOT to the file path to the folder where jbrowse2 is installed"
    exit 1
else
    echo "JBROWSE2_ROOT has value: $JBROWSE2_ROOT"
fi

SAMPLE_NAME=$1

jbrowse add-assembly "${SAMPLE_NAME}.fasta" --out "${JBROWSE2_ROOT}/jbrowse2" --load copy --force
echo "Added ${SAMPLE_NAME}'s assembly genome to jbrowse2"

jbrowse add-track "${SAMPLE_NAME}_clean_genes.gff.gz" --out "${JBROWSE2_ROOT}/jbrowse2" --load copy --assemblyNames "${SAMPLE_NAME}.fasta" --force
jbrowse text-index --out "${JBROWSE2_ROOT}/jbrowse2" 
echo "Added ${SAMPLE_NAME}'s genome annotation to jbrowse2"