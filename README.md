# BioEC131-Final-Project-VALK

## Pre-reqs before starting:

## Setup:
Download JBrowse2: https://jbrowse.org/jb2/docs/quickstart_web/
If you do not have JBrowse2 downloaded, see the above quickstart guide.

## 1. Clone this repo to your local computer 💻

```
git clone https://github.com/katie123502/BioEC131-Final-Project-VALK.git
cd BioEC131-Final-Project-VALK
```

## 2. Run the data processing script 🧑‍💻

```
chmod +x ref_fasta_processing.sh
./ref_fasta_processing.sh
```

## 3. Explore herpesvirus! 🦠

Access JBrowse2 to explore herpesvirus at http://localhost:8080/jbrowse2
See the Herpes Genomes folder for the list of reference HHV genomes from human-relevant strains.

You can also explore an example of our working database here: https://katie123502.github.io/jbrowse2 

## Optional: Upload your genome assemblies

1. Upload the genome assembly in .fasta or .gff3 file format to the Herpes Genomes folder.
2. Run the data processing script in Setup Step 2 again.

## Optional: MAFFT Whole Genome Alignment

1. Download MAFFT for your OS: https://mafft.cbrc.jp/alignment/software/source.html 
2. hhv_whole_alignment.fasta contains an example alignment with HHV1 as the reference genome.
3. Run the following command to generate a new alignment.
```
mafft --6merpair --addfragments othersequences referencesequence > output
```
