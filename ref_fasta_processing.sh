#!/bin/bash

# Check if a sample assembly is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 assembly_file(fasta file)" 
    exit 1
fi

# Ensure JBROWSE2_ROOT is equal to the path to the folder jbrowse2/
if [ -z "$JBROWSE2_ROOT" ]; then
    echo "Use export to set JBROWSE2_ROOT to the file path to the folder where jbrowse2 is installed"
    exit 1
else
    echo "JBROWSE2_ROOT has value: $JBROWSE2_ROOT"
fi

FASTA_FILE=$1

#index fasta file
samtools faidx "${FASTA_FILE}"
#make new reference accesible in jbrose 2 view
jbrowse add-assembly "${FASTA_FILE}" --out "${JBROWSE2_ROOT}/jbrowse2" --load copy
echo "Make sure to clear your cache or open up jbrowse2 in incognito mode to see the new addition"