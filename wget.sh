mkdir sample_data
cd sample_data

#.fna.gz files

wget -O HHV1_X14112.fna.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/003/052/245/GCA_003052245.1_ASM305224v1/GCA_003052245.1_ASM305224v1_genomic.fna.gz"
wget -O HHV2_Z86099.fna.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/003/052/145/GCA_003052145.1_ASM305214v1/GCA_003052145.1_ASM305214v1_genomic.fna.gz"
wget -O HHV3_X04370.fna.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/858/285/GCF_000858285.1_ViralProj15198/GCF_000858285.1_ViralProj15198_genomic.fna.gz"
wget -O HHV4_NC_007605.fna.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/002/402/265/GCF_002402265.1_ASM240226v1/GCF_002402265.1_ASM240226v1_genomic.fna.gz"
wget -O HHV5_X17403.fna.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/930/115/GCA_027930115.1_ASM2793011v1/GCA_027930115.1_ASM2793011v1_genomic.fna.gz"
wget -O HHV6_X83413.fna.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/845/685/GCF_000845685.2_ViralProj14462/GCF_000845685.2_ViralProj14462_genomic.fna.gz"
wget -O HHV6_AB021506.fna.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/935/855/GCA_027935855.1_ASM2793585v1/GCA_027935855.1_ASM2793585v1_genomic.fna.gz"
wget -O HHV6_AF157706.fna.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/846/365/GCF_000846365.1_ViralProj14422/GCF_000846365.1_ViralProj14422_genomic.fna.gz"
wget -O HHV7_U43400.fna.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/938/645/GCA_027938645.1_ASM2793864v1/GCA_027938645.1_ASM2793864v1_genomic.fna.gz"
wget -O HHV7_AF037218.fna.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/848/125/GCF_000848125.1_ViralProj14625/GCF_000848125.1_ViralProj14625_genomic.fna.gz"
wget -O HHV8_AF148805.fna.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/838/265/GCF_000838265.1_ViralProj14158/GCF_000838265.1_ViralProj14158_genomic.fna.gz"
wget -O McHV1_AF533768.fna.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/844/145/GCF_000844145.1_ViralProj14489/GCF_000844145.1_ViralProj14489_genomic.fna.gz"
wget -O MuGHV4_U97553.fna.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/845/665/GCF_000845665.1_ViralProj14458/GCF_000845665.1_ViralProj14458_genomic.fna.gz"

#.fna files

wget -O HHV8_U75698.fna "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&id=U75698&report=fasta&format=text"
wget -O HHV8_U93872.fna "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&id=U93872&report=fasta&format=text"

#.gff.gz files

wget -O HHV1_X14112.gff.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/003/052/245/GCA_003052245.1_ASM305224v1/GCA_003052245.1_ASM305224v1_genomic.gff.gz"
wget -O HHV2_Z86099.gff.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/003/052/145/GCA_003052145.1_ASM305214v1/GCA_003052145.1_ASM305214v1_genomic.gff.gz"
wget -O HHV3_X04370.gff.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/858/285/GCF_000858285.1_ViralProj15198/GCF_000858285.1_ViralProj15198_genomic.gff.gz"
wget -O HHV4_NC_007605.gff.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/002/402/265/GCF_002402265.1_ASM240226v1/GCF_002402265.1_ASM240226v1_genomic.gff.gz"
wget -O HHV5_X17403.gff.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/930/115/GCA_027930115.1_ASM2793011v1/GCA_027930115.1_ASM2793011v1_genomic.gff.gz"
wget -O HHV6_X83413.gff.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/845/685/GCF_000845685.2_ViralProj14462/GCF_000845685.2_ViralProj14462_genomic.gff.gz"
wget -O HHV6_AB021506.gff.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/935/855/GCA_027935855.1_ASM2793585v1/GCA_027935855.1_ASM2793585v1_genomic.gff.gz"
wget -O HHV6_AF157706.gff.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/846/365/GCF_000846365.1_ViralProj14422/GCF_000846365.1_ViralProj14422_genomic.gff.gz"
wget -O HHV7_U43400.gff.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/938/645/GCA_027938645.1_ASM2793864v1/GCA_027938645.1_ASM2793864v1_genomic.gff.gz"
wget -O HHV7_AF037218.gff.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/848/125/GCF_000848125.1_ViralProj14625/GCF_000848125.1_ViralProj14625_genomic.gff.gz"
wget -O HHV8_AF148805.gff.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/838/265/GCF_000838265.1_ViralProj14158/GCF_000838265.1_ViralProj14158_genomic.gff.gz"
wget -O McHV1_AF533768.gff.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/844/145/GCF_000844145.1_ViralProj14489/GCF_000844145.1_ViralProj14489_genomic.gff.gz"
wget -O MuGHV4_U97553.gff.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/845/665/GCF_000845665.1_ViralProj14458/GCF_000845665.1_ViralProj14458_genomic.gff.gz"

#.gff files
wget -O HHV8_U75698.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&id=U75698&report=gff&format=text"
wget -O HHV8_U93872.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&id=U93872&report=gff&format=text"

#unzip .fna.gz files
echo "Unzipping .fna.gz files..."
for file in *.fna.gz; do
    if [ -f "$file" ]; then
        echo "Unzipping $file..."
        gunzip "$file"
    fi
done

#unzip .gff.gz files
echo "Unzipping .gff.gz files..."
for file in *.gff.gz; do
    if [ -f "$file" ]; then
        echo "Unzipping $file..."
        gunzip "$file"
    fi
done

echo "All files unzipped successfully!"
