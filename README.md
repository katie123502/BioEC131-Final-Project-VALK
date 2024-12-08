
# BioEC131-Final-Project-VALK

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
Run the following commands to get a set of reference HVV genomes from GenBank, download them to the local folder ```sample_data```, run some basic analyses, and make them available to JBrowse.

```
chmod +x wget.sh
chmod +x sample_indexing.sh
chmod +x jbrowse2_upload_loop.sh
chmod +x load_sample_data.sh
./load_sample_data.sh
```
  **```wget.sh```**: obtains all the fasta and gff files for studied genomes from NCBI  
  **```sample_indexing.sh```**: indexes and processes all files  
  **```jbrowse2_upload_loop.sh```**: configures jbrowse2 with the indexed and original genome files  
  **```load_sample_data.sh```**: simplifies data processing by running the above three bash scripts  

## 3. Explore herpesvirus! 🦠

Access JBrowse2 to explore herpesvirus at http://localhost:8080/jbrowse2. Make sure to clear your browser cache first or open in Incognito Mode. You can also explore an example of our working database here: https://katie123502.github.io/jbrowse2 

**Genome View** 🧬

The sample data includes the reference genome files for 10 human HHV strains, 1 mouse HHV strain, and 1 macaque HHV strain, which can be visualized in the Linear Genome View. 

**MSA View** 🌳

The sample data includes two example results of MAFFT whole genome alignment between strains that can be visualized on the JBrowse MSA view. In order to visualize these alignmnents, first ensure that your JBrowse has the MSA plugin installed. See the setup section for installation instructions for plugins. Once MSA view is launched, select the appropriate alignment file from the ```sample_data``` folder. The file ```hhv1_hhv2.fna``` contains the alignment for the HHV1 and HHV2 strain genomes, and the file ```hhv6b.fna``` contains the alignment for the two HHV6B strain genomes. Once you select a file, click Open to launch the MSA view.

**Protein View Exploration** 👀

  *To view the structure of significant proteins in herpesvirus mechanisms, complete the following steps:*  
1. In the navigation bar, select Tool > Plugin store and then scroll to the bottom to install Protein3d
2. In the "Select a view to launch" drop down, select "Protein view" and press "Launch view"
3. On the right hand side, select the wrench (the third option down from the top) in the option bar
4. On the left hand side, in the "Download Structure" section, enter the PDB id(s) of your desired proteins and press apply
5. Under the assembly tab, Apply Action > 3D Representation > Apply. Feel free to change parameters for type, color theme, and size theme as you wish.

Take a look at your protein(s)!

Here are some proteins that we suggest taking a look at specifically for herpesvirus:
| Protein        | PDB ID |  Description                       | Relevant Strains            |
|----------------|--------|------------------------------------|-----------------------------|
| gB (UL27)      |  2GUM  |  External domain of Glycoprotein B | All strains                 |
| UL30           |  8EXX  |  DNA polymerase (bound to DNA)     | All strains                 |
| gH, gL         |  3M1C  |  Glycoprotein H/L complex          | Differentiates HHV-1, HHV-2 |
| IE-2 (UL89/90) |  5WX8  |  DNA binding protein, C-term       | In HHV6A/B, not in HHV7     |
| K3 protease    |  1VYX  |  Protease, N-term                  | HHV8, MuGHV4                |

## Genomes Explored 🔎

If you are interested in directly viewing the genomes, you can access them using their NCBI accession numbers on https://www.ncbi.nlm.nih.gov/

| Virus Name	                         | NCBI accession number  |
|-------------------------------------|------------------------|
| Herpes simplex virus type 1 (HSV-1) |       	X14112          |
| Herpes simplex virus type 2 (HSV-2) |	       Z86099          |
| Varicella-zoster virus (VZV, HHV-3) |	       X04370          |
| Epstein–Barr virus (EBV, HHV-4)     |	       NC_007605       |
| Human cytomegalovirusa (HCMV, HHV-5)|	       X17403          |
| Human herpesvirus 6A (HHV-6A)       |	       X83413          |
| Human herpesvirus 6B (HHV-6B)       |	  AB021506, AF157706   |
| Human herpesvirus 7 (HHV-7)         |    U43400,	AF037218    |
| Human herpesvirus 8 (HHV-8)         |	       AF148805.2      |
| Macaque Monkey (McHV1)              |	       AF533768.1      |
| Mouse (MuGHV4)                      |	       U97553.2        |

## Optional: Upload your genome assemblies

1. Upload the genome assembly in .fasta and .gff3 file format to a directory of your choice.
2. Run the indexing and upload scripts on this file. These scripts process both the .fasta file and the annotated .gff3 file for an assembly. For example, if your file is in the folder hhv_assemblies and is named HHV1.fasta, you would run the following command (note that the .fasta or .gff3 is excluded):
```
./sample_indexing.sh hhv_assemblies/HHV1
./jbrowse2_upload_loop.sh hhv_assemblies/HHV1
```
3. Reload JBrowse2 to view your new assembly. Make sure to open in an Incognito tab or clear your browser cache.

## Optional: Run your own MAFFT Whole Genome Alignments

1. Download MAFFT for your OS: https://mafft.cbrc.jp/alignment/software/source.html 
2. Run the following command to generate a new alignment. Replace ```othersequences``` with a .fasta or .fna file containing the sequences to align to the reference, ```referencessequence``` with the .fasta/.fna file of the reference sequence, and ```output``` with the desired output file path.
```
mafft --6merpair --addfragments othersequences referencesequence > output
```
3. Run the indexing and upload scripts on your output file to make them available to JBrowse. Make sure to use the full file path to your output files.
```
./sample_indexing.sh output
./jbrowse2_upload_loop.sh output
```
4. Follow the instructions in the Exploration section to open MSAView.
