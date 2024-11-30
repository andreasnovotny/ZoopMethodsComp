# Directory - ./Code

## Function.R

### index_RA

***NAME***

index_RA - Calculate Indexed Relative Abundance (RA) for Taxa Across Samples

***SYNOPSIS***

index_RA(data, sample, taxa, abundance, ..., na.rep = 0, extreme.perc = 0.99)

***DESCRIPTION***

The index_RA function calculates the relative abundance (RA) of taxa within samples, adjusts for extreme values, and indexes the RA to the maximum observed value for each taxon. This is particularly useful for analyzing ecological or microbiome datasets. The function replaces missing abundance values, aggregates abundance data, identifies extreme values based on a user-defined percentile threshold, and scales/indexes the RA values to provide a structured output.

***PARAMETERS***

-   **data** - A *data frame* containing the input data.

-   **sample** - Column in the data identifying the sample ID.

-   **taxa** - Column in the data identifying the taxonomic group or species.

-   **abundance** - Column in the data containing abundance values.

-   **...** - Additional grouping variables (e.g., treatments or environmental factors).

-   **na.rep** - *Numeric*. Value to replace missing abundance (NA) values. Default: 0.

-   **extreme.perc** - Numeric. Percentile threshold for identifying extreme relative abundance values (e.g., 0.99 for the 99th percentile). Default: 0.99.

***RETURN VALUE***

A data frame with the following columns:

-   **sample**: Sample ID.

-   **...**: Any additional grouping variables provided.

-   **taxa**: Taxonomic group or species.

-   **abundance**: Original or adjusted abundance value.

-   **RA**: Relative abundance (proportion of total abundance per sample).

-   **RA_Index**: Indexed relative abundance (scaled to the maximum RA for each taxon).

***DETAILS***

The function executes the following steps:

1.  Replaces NA values in the abundance column with the value specified by na.rep.

2.  Aggregates abundance values per sample and taxon.

3.  Calculates the relative abundance (RA) of each taxon within a sample.

4.  Removes extreme RA values based on the specified percentile threshold, reassigning them to the next-highest RA value.

5.  Indexes the RA values for each taxon by dividing by the maximum RA observed for that taxon.

6.  Outputs the final data frame with relevant columns arranged in a structured format.

**EXAMPLES**

`library(tibble)`

`# Example data`

`df <- tibble(`

`Sample = rep(c("S1", "S2"), each = 3),`

`Taxa = c("Taxon1", "Taxon2", "Taxon3"),`

`Abundance = c(10, 20, NA, 15, 25, 30)`

`)`

`# Run the function`

`indexed_RA <- index_RA(df, sample = Sample, taxa = Taxa, abundance = Abundance, na.rep = 0, extreme.perc = 0.99)`

`print(indexed_RA)`
**AUTHOR**

Developed by [Andres Novotny].
