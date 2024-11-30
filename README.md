# DNA Metabarcoding Captures Temporal and Vertical Dynamics of Mesozooplankton Communities - Supplementary Data S3

***Authors: Andreas Novotny (1,2), Caterina Rodrigues (1,2), Loïc Jacquemot (1,2), Rute B. G. Clemente-Carvalho (2), Rebecca S. Piercey (2), Evan Morien (2), Moira Galbraith (3), Colleen T. E. Kellogg (2), Matthew A. Lemay (2), and Brian P. V. Hunt (1,4)***

Contact: mail\@andreasnovotny.se

1.  *Institute for the Oceans and Fisheries, University of British Columbia, 2202 Main Mall, Vancouver, BC, V6T 1Z4 Canada*

2.  *Hakai Institute, PO Box 25039, Campbell River, BC, V9W 0B7, Canada*

3.  *Institute of Ocean Sciences, Fisheries and Oceans Canada, PO Box 6000, Sidney, BC, V8L 4B2, Canada*

4.  *Department of Earth, Ocean and Atmospheric Sciences, University of British Columbia, 2202 Main Mall, Vancouver, BC, V6T 1Z4 Canada*

### Rationale

In this study, we examined how well DNA metabarcoding capture changes in biomass of marine mesozooplankton. We evaluated the effectiveness of three different standardization methods – relative abundance, presence-absence, and the eDNA-index – for correlating seasonal trends between DNA sequence read abundance and microscopic biomass estimates of zooplankton net samples collected every two weeks in a 1-year time series. To assess if taxa specific trends are sensitive to the selection of genetic marker, we sequenced both short fragment of the COI gene, with primers optimized to capture marine invertebrate community (Leray *et al.*, 2013) and the 18S gene, with universal primers optimized for marine microbial eukaryotes (Balzano *et al.*, 2015). In doing so, we provide both new insights into the reliability of DNA metabarcoding analysis and guidelines for future studies that aim to use environmental DNA to study marine community dynamics. Further, through analysis of discreet water column DNA samples, we demonstrate the potential of the DNA approach in resolving differences in vertical zooplankton distributions.

**COI** **(Mitochondrial Cytochrome Oxidase I) gene**\
Targeting **Marine Invertebrates** with the primers mICOIintF / dgHCO2198R (Leray et al 2013).\
Prepared and sequenced according to <https://dx.doi.org/10.17504/protocols.io.rm7vzjjjxlx1/v1>

**18S SSU rRNA gene**\
Targeting **Marine Eukaryotes** with the primers Primers: V4-565F / V4981R (Balzano et al 2015)\
Prepared and sequenced according to <https://dx.doi.org/10.17504/protocols.io.261ge5d7yg47/v1>

# Structure of Directory

## Directory - ./Data

#### Sequence_Metadata_18S_QU39_2017.csv and 

#### Sequence_Metadata_18S_QU39_2017.csv

These comma separated files contain metadata for sequence libraries produced in this project. Column names align with entries in NCBI Sequence Read Archive.

-   **library_ID -** Unique identifier of the sequencing library. General structure is SampleName_MiseqRun

-   **collection_date -** Date of sample collection YYYY-MM-DD

-   **depth -** Depth of sample collection

-   **lat_lon -** Latitude and Longitude

-   **source_material_id -** Id of the extracted DNA. (In most cases this is the *Hakai_ID*, used as identifier in the Hakai Institutes data catalog.

-   **title -** Library description

-   **sra_accession -** NCBI accession number to FASTQ files and metadata.

-   **biosample_accession -** NCBI accession number to sample metadata.

-   **bioproject_accession -** NCBI accession number to project metadata.

-   **collection_method -** Method for sample collection. May contain link to detailed protocol.

-   **size_frac -** Sample size_fraction for filter or zooplankton nets.

-   **design_description -** The library design. With link to detailed library preparation protocol.

-   **geo_loc_name -** Name of geolocation.

-   **samp_collect_device -** Instruments used for sampling.

-   **samp_mat_process -** Processing of sample, such as DNA extraction, prior to sequencing preparation.

-   **samp_size -** Volume of collected sample (ml)

-   **samp_store_temp -** Sample storage temperature (celcius).

#### ASV_18S_MZGdb_QU39_2017.csv and 

#### ASV_COI_MZGdb_QU39_2017.csv

These files contains processed data (OTUs/ASVs) from the FASTQ sequence reads listed in the metadata above. Processing was done using these scripts: <https://www.ncbi.nlm.nih.gov/sra/PRJNA1141475> for 18S and COI respectively. Briefly, primer sequences were removed from the demultiplexed fastq files using **cutadapt** version 3.7 (Martin, 2011). Filtering, dereplication, error rate modeling, inference of amplicon sequence variants (ASVs), chimera detection and removal, and taxonomic assignment were accomplished using the **dada2** R package version 1.30 (Callahan *et al.*, 2016). ASVs are annotated using the **RDP Naïve Bayesian Classifier** algoritm implemented in the *AssignTaxonomy* function in the dada2 r package (Wang *et al.*, 2007; Callahan *et al.*, 2016). The training data sets for 18S and COI was constructed separately based on the **MetaZooGene database v3.0** (Bucklin *et al.*, 2021) a curated database of marine zooplankton, fish and protists, along with their observational and sampling metadata. Here, the subset provided for **North Pacific Ocean species (mode-A**), where only species with previously recorded presence in the North Pacific Ocean was included is downloaded and transformed (for details, see Bucklin *et al.*, 2021).

The comma separated files contain summarized sequence read abundances with taxonomic rank annotation according to the **MetaZooGene database v3.0.**

#### Zooplankton_QU39_2017.csv

Taxonomic identification and biomass estimation from the formalin-preserved zooplankton net samples was performed by Moira Galbraith at the Institute of Ocean Science (Fisheries and Oceans Canada, BC, Canada) following the standard method for zooplankton monitoring in the Strait of Georgia (Perry *et al.*, 2021). Each sample was analyzed under a stereomicroscope (Zeiss SteREO Discovery 8) and processed by dividing it into two parts based on zooplankton size. First, the entire sample was examined for individuals larger than 5 mm or for any rare species. After this initial scan, the sample was split with a Folsom splitter to obtain a subset of around 100 individuals over 5 mm in size. These larger specimens were identified down to species level, with sex and developmental stage noted where applicable, and then removed. For the remaining portion containing organisms under 5 mm, further subsampling was done to achieve roughly 400 individuals, which were then classified to the lowest possible taxonomic level and assigned a life stage or size category. Biomass calculations for each combination of taxon-stage or taxon-size class were based on abundance and average individual biomass within each sample, using measured or published values (Mackas *et al.*, 2013).

## Directory - ./Code

### Function.R

The generalized function *index_RA()* calculates the relative abundance (RA) and eDNA-index of taxa within samples, adjusts for extreme values, and indexes these values to the maximum observed RA for each taxon. It replaces missing abundance values, aggregates abundance data, and scales RA values to remove outliers based on a specified percentile threshold. The final output includes the original abundance, calculated RA, and scaled eDNA for each taxon across samples, structured to support further analysis of ecological or microbiome datasets. For details, se function description.

## Vignette

### figures_and_stats.Rmd and figures_and_stats.html

This R notebook contains instructions and code to reproduce the graphical and statistical output for the manuscript and its supplementary material. Output from running the notebook will be available in the ./Figure_output directory.
