#!/bin/bash

./wget.sh

# Define the array of all samples
all_samples=("sample_data/HHV1_X14112" "sample_data/HHV2_Z86099" "sample_data/HHV3_X04370" 
             "sample_data/HHV4_NC_007605" "sample_data/HHV5_X17403" "sample_data/HHV6_X83413" 
             "sample_data/HHV6_AB021506" "sample_data/HHV6_AF157706" "sample_data/HHV7_U43400" 
             "sample_data/HHV7_AF037218" "sample_data/HHV8_AF148805" "sample_data/McHV1_AF533768" 
             "sample_data/MuGHV4_U97553")

# Loop through all samples
for SAMPLE_NAME in "${all_samples[@]}"; do
    # Extract the sample name (everything after the last '/')
    
    echo "Processing sample: $SAMPLE_NAME"
    
    # Run sample_indexing.sh
    ./sample_indexing.sh "$SAMPLE_NAME"
    if [ $? -ne 0 ]; then
        echo "Error while running sample_indexing.sh for $SAMPLE_NAME"
        exit 1
    fi

    # Run jbrowse2_upload_loop.sh
    ./jbrowse2_upload_loop.sh "$SAMPLE_NAME"
    if [ $? -ne 0 ]; then
        echo "Error while running jbrowse2_upload_loop.sh for $SAMPLE_NAME"
        exit 1
    fi

    echo "Finished processing sample genome: $SAMPLE_NAME"
done

echo "All sample genomes processed successfully!"

echo "Running MAFFT whole genome alignment for HHV1 and HHV2"

mafft --6merpair --addfragments sample_data/HHV2_Z86099.fna sample_data/HHV1_X14112.fna > sample_data/hhv1_hhv2.fna 
./sample_indexing.sh sample_data/hhv1_hhv2
./jbrowse2_upload_loop.sh sample_data/hhv1_hhv2

echo "Finished and loaded MSA for HHV1 and HHV2"

echo "Running MAFFT whole genome alignment for HHV6_AB021506 and HHV6_AF157706"

mafft --6merpair --addfragments sample_data/HHV6_AF157706.fna sample_data/HHV6_AB021506.fna > sample_data/hhv6b.fna 
./sample_indexing.sh sample_data/hhv6b
./jbrowse2_upload_loop.sh sample_data/hhv6b

echo "Finished and loaded MSA for HHV6_AB021506 and HHV6_AF157706"

jbrowse text-index --out "${JBROWSE2_ROOT}/jbrowse2" --force
