#' Calculate and index Relative Abundances (eDNA Index).
#'
#' @description
#' The following function will calculate relative abundance (RA) and the index
#' of relative abundance (eDNA-index) for any data set. The RA_Index is identical
#' to eDNA Index or Wisconsin double standardization.
#' This function will also handle extreme values to falls outside a given
#' percentile. Extreme will otherwise have a big impact on the index,
#' that is based on the population max.

#' @param data A data frame containing the input data.
#' @param sample Column in the data identifying the sample ID.
#' @param taxa Column in the data identifying the taxonomic group or species.
#' @param abundance Column in the data containing abundance values.
#' @param ... Additional grouping variables (e.g., treatments or environmental factors).
#' @param na.rep Numeric. Value to replace `NA` abundance values. Default is \code{0}.
#' @param extreme.perc Numeric. Percentile threshold for identifying extreme relative abundance values (e.g., \code{0.99} for the 99th percentile). Default is \code{0.99}.
#'
#' @return A data frame with the following columns:
#' \describe{
#'   \item{\code{sample}}{Sample ID.}
#'   \item{...}{Any additional grouping variables provided.}
#'   \item{\code{taxa}}{Taxonomic group or species.}
#'   \item{\code{abundance}}{Original or adjusted abundance value.}
#'   \item{\code{RA}}{Relative abundance (proportion of total abundance per sample).}
#'   \item{\code{RA_Index}}{Indexed relative abundance (scaled to the maximum RA for each taxon).}
#' }
#'
#' @details 
#' The function performs the following steps:
#' \enumerate{
#'   \item Replaces `NA` values in the abundance column with the value specified by \code{na.rep}.
#'   \item Aggregates abundance values per sample and taxon.
#'   \item Calculates the relative abundance (RA) of each taxon within a sample.
#'   \item Removes extreme RA values based on the specified percentile threshold, reassigning them to the highest RA value withing the percentile.
#'   \item Indexes the RA values for each taxon by dividing by the maximum RA observed for that taxon.
#'   \item Outputs the final data frame with relevant columns arranged in a structured format.
#' }
#'
#' @examples
#' \dontrun{
#' # Example data
#' df <- tibble(
#'   Sample = rep(c("S1", "S2"), each = 3),
#'   Taxa = c("Taxon1", "Taxon2", "Taxon3"),
#'   Abundance = c(10, 20, NA, 15, 25, 30)
#' )
#' 
#' # Run the function
#' indexed_RA <- index_RA(df, sample = Sample, taxa = Taxa, abundance = Abundance, na.rep = 0, extreme.perc = 0.99)
#' 
#' print(indexed_RA)
#' }
#' 
#' @export



index_RA <- function(data, sample, taxa, abundance, ...,
                     na.rep = 0, extreme.perc = 0.99) {
  
  output <- data %>%
    
    # 1. Replace NA
    mutate("{{abundance}}" := ifelse(is.na({{abundance}}),
                                     na.rep,
                                     {{abundance}})) %>% 
    
    # 2. Summaries abundance per sample and taxa
    group_by({{sample}}, {{taxa}}, ...) %>% 
    summarise("{{abundance}}" := sum({{abundance}})) %>% 
    
    # 3. Calculate relative abundance (RA) for each sample
    group_by({{sample}}, ...) %>% 
    reframe(RA = {{abundance}} / sum({{abundance}}),
            {{taxa}}, {{abundance}}) %>%
    filter(is.na(RA) == FALSE) %>% 
    
    # 4. Remove extreme values of relative abundance
    # Extreme values are defined by percentile, and temporally assigned -1
    group_by({{taxa}}) %>%
    reframe(RA = ifelse(RA <= quantile(RA, extreme.perc), RA, -1),
            {{sample}}, {{abundance}}, ...) %>%
    # Extreme values (assigned -1) are reassigned to the new maximum value.
    group_by({{taxa}}) %>%
    reframe(RA = ifelse(RA == -1, max(RA), RA),
            {{sample}}, {{abundance}}, ...) %>% 
    
    # 5. Calculate indexed relative abundance per taxa.
    group_by({{taxa}}) %>%
    reframe({{abundance}}, RA, RA_Index = RA/max(RA),
            {{sample}}, ...) %>% 
    filter(is.na(RA_Index) == FALSE) %>% 
    
    # 6. Arrange columns:
    select({{sample}}, ..., {{taxa}}, {{abundance}}, RA, RA_Index)

}