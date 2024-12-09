#!/bin/bash

# usage
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 sample_name1 [sample_name2 ... sample_nameN]"
    echo "Example: $0 HHV1 HHV2"
    exit 1
fi

# Ensure JBROWSE2_ROOT is set
if [ -z "$JBROWSE2_ROOT" ]; then
    echo "Use export to set JBROWSE2_ROOT to the file path to the folder where jbrowse2 is installed"
    exit 1
else
    echo "JBROWSE2_ROOT has value: $JBROWSE2_ROOT"
fi


# loop through 
for FILE_NAME in "$@"; do
    SAMPLE_NAME=$(basename "$FILE_NAME")
    
    echo "Processing sample: $SAMPLE_NAME"

    # Add the assembly
    jbrowse add-assembly "${FILE_NAME}.fna" --name "${SAMPLE_NAME}" --out "${JBROWSE2_ROOT}/jbrowse2" --load copy --force
    echo "Added ${SAMPLE_NAME}'s assembly genome to jbrowse2"

    # Add the track
    jbrowse add-track "${FILE_NAME}_clean_genes.gff.gz" --out "${JBROWSE2_ROOT}/jbrowse2" --load copy --assemblyNames "${SAMPLE_NAME}" --force

    # Reindex
    echo "Added ${SAMPLE_NAME}'s genome annotation to jbrowse2"
done

jbrowse text-index --out "${JBROWSE2_ROOT}/jbrowse2" --force
