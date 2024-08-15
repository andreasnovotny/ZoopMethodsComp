# ZoopMethodsComp

Order of operation:

1: Run "prepare_datasets.Rmd

This script is ment to merge the metabarcoding data from several different MiSeq runs, using sever different marker genes, and combine it with its sample metadata. To prepare we load libraries and copy all ASV tables, taxonomy tables, and metadata from the AmpliconSeqAnalysis directory. In the Amplicon Seq analysis directory, raw FASTQ sequences has already been demultiplexed, quality filtered, and annotated to taxonomic databases. For details, see separate documentation.\

2: Run "figures_and_stats.Rmd

This script is used to produce all graphical and statistical output for the manuscript and its supplementary material. Before starting this script, run all steps in the "prepare_datasets.Rmd"
