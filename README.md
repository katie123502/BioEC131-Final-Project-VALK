
# BioEC131-Final-Project-VALK

## Pre-reqs before starting:

## Setup:
Download JBrowse2: https://jbrowse.org/jb2/docs/quickstart_web/
If you do not have JBrowse2 downloaded, see the above quickstart guide.
Make sure that you have the Samtools package installed. 
Once you have JBrowse installed and are able to open it on your web browser, click Tools, then click Plugin store. Install the plugins MSAViewer and Protein3D.

## 1. Clone this repo to your local computer 💻

```
git clone https://github.com/katie123502/BioEC131-Final-Project-VALK.git
cd BioEC131-Final-Project-VALK
```

## 2. Run the data processing script to load a set of sample HHV genome tracks 🧑‍💻
Run the following commands to get a set of reference HVV genomes from GenBank, download them to the local folder sample_data, run some basic analyses, and make them available to JBrowse.

```
chmod +x wget.sh
chmod +x sample_indexing.sh
chmod +x jbrowse2_upload_loop.sh
chmod +x load_sample_data.sh
./load_sample_data.sh
```
  **wget.sh**: obtains all the fasta and gff files for studied genomes from NCBI  
  **sample_indexing.sh**: indexes and processes all files  
  **jbrowse2_upload_loop.sh**: configures jbrowse2 with the indexed and original genome files  
  **load_sample_data.sh**: simplifies data processing by running the above three bash scripts  

## 3. Explore herpesvirus! 🦠

Access JBrowse2 to explore herpesvirus at http://localhost:8080/jbrowse2. Make sure to clear your browser cache first or open in Incognito Mode.

The sample data includes the reference genome files for 10 human HHV strains, 1 mouse HHV strain, and 1 macaque HHV strain, which can be visualized in the Linear Genome View. It also includes several example results of MAFFT whole genome alignment between strains that can be visualized on the JBrowse MSA view.

You can also explore an example of our working database here: https://katie123502.github.io/jbrowse2 

## Genomes Explored 🔎

| Virus Name	                         | NCBI accession number      |
|-------------------------------------|----------------------------|
| Herpes simplex virus type 1 (HSV-1) |       	X14112              |
| Herpes simplex virus type 2 (HSV-2) |	       Z86099              |
| Varicella-zoster virus (VZV, HHV-3) |	       X04370              |
| Epstein–Barr virus (EBV, HHV-4)     |	       NC_007605           |
| Human cytomegalovirusa (HCMV, HHV-5)|	       X17403              |
| Human herpesvirus 6 (HHV-6)         |	X83413, AB021506, AF157706 |
| Human herpesvirus 7 (HHV-7)         |	      U43400,	AF037218     |
| Human herpesvirus 8 (HHV-8)         |	U75698,	U93872,	AF148805.2 |
| Macaque Monkey (McHV1)              |	        AF533768.1         |
| Mouse (MuGHV4)                      |	       U97553.2            |

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
