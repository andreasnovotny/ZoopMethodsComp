update_DNA_datasets <- function(repo = "Data_Novotny/AmpliconSeqAnalysis") {
  
  # This function should update the repository with all necessary files from Google Drive.
  # No data other than what is imported in this function should be used for this data project.
  
  require(googledrive)
  repo = "Data_Novotny/AmpliconSeqAnalysis"
  file.path(repo, "Taxtab_COI.rds")
  
  ##############################
  # Download COI data components
  
  drive_download(file.path(repo, "Taxtab_COI.rds"),
                 "Data_import/COI/Taxtab_COI.rds",
                 overwrite = TRUE)
  
  drive_download(file.path(repo, "ASV_COI.rds"),
                 "Data_import/COI/ASV_COI.rds",
                 overwrite = TRUE)
  
  drive_download(file.path(repo, "Samptab_COI.rds"),
                 "Data_import/COI/Samptab_COI.rds",
                 overwrite = TRUE)
  
  ##############################
  # Download 18S data components
  
  drive_download(file.path(repo, "Taxtab_18S.rds"),
                 "Data_import/18S/Taxtab_18S.rds",
                 overwrite = TRUE)
  
  drive_download(file.path(repo, "ASV_18S.rds"),
                 "Data_import/18S/ASV_18S.rds",
                 overwrite = TRUE)
  
  drive_download(file.path(repo, "Samptab_18S.rds"),
                 "Data_import/18S/Samptab_18S.rds",
                 overwrite = TRUE)
  
}

update_ZP_datasets <- function(repo = "Data_Novotny/ZooplanktonData") {
  
  require(googledrive)
  
  
  #################################
  # Download Microscopy data
  drive_download(file.path(repo, "Vertical_ZP_count_2022.xlsx"),
                 "Data_import/Microscopy/Vertical_ZP_2022.xlsx",
                 overwrite = TRUE)
  
  drive_download(file.path(repo, "Hakai_Zooplankton_2013-2017_AN.rds"),
                 "Data_import/Microscopy/Hakai_Zooplankton_2013-2017_AN.rds",
                 overwrite = TRUE)
}



update_Contributed_data <- function(repo = "Data_Novotny/ContributedDNAprojects") {
  
  require(googledrive)
  
  
  #################################
  # Download 18S time series data
  drive_download(file.path(repo, "18S_Caterina/ps_18S.rds"),
                 "Data_import/Contributed18S/ps_18S.rds",
                 overwrite = TRUE)

}

