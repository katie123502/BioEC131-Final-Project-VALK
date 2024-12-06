#!/bin/bash

./wget.sh

# Define the array of all samples
all_samples=("sample_data/HHV1_X14112" "sample_data/HHV2_Z86099" "sample_data/HHV3_X04370" 
             "sample_data/HHV4_NC_007605" "sample_data/HHV5_X17403" "sample_data/HHV6_X83413" 
             "sample_data/HHV6_AB021506" "sample_data/HHV6_AF157706" "sample_data/HHV7_U43400" 
             "sample_data/HHV7_AF037218" "sample_data/HHV8_U75698" "sample_data/HHV8_U93872" 
             "sample_data/HHV8_AF148805" "sample_data/McHV1_AF533768" "sample_data/MuGHV4_U97553")

# Loop through all samples
for FILENAME in "${all_samples[@]}"; do
    # Extract the sample name (everything after the last '/')
    SAMPLE_NAME=$(basename "$FILENAME")
    
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

    echo "Finished processing sample: $SAMPLE_NAME"
done

echo "All samples processed successfully!"