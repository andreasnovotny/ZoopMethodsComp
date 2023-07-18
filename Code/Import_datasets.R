update_datasets <- function() {
  
  # This function should update the repository with all nessecery files from google drive.
  # No data other than what is imported in this function should be used for this data project.
  
  library(googledrive)
  
  ##############################
  # Download COI data components
  
  drive_download("Data_Novotny/Taxtab_COI.rds",
                 "Data_import/COI/Taxtab_COI.rds",
                 overwrite = TRUE)
  
  drive_download("Data_Novotny/ASV_COI.rds",
                 "Data_import/COI/ASV_COI.rds",
                 overwrite = TRUE)
  
  drive_download("Data_Novotny/Samptab_COI.rds",
                 "Data_import/COI/Samptab_COI.rds",
                 overwrite = TRUE)
  
  drive_download("Data_Novotny/Samptab_COI.rds",
                 "Data_import/COI/Samptab_COI.rds",
                 overwrite = TRUE)
  
  ##############################
  # Download 18S data components
  
  drive_download("Data_Novotny/Taxtab_18S.rds",
                 "Data_import/18S/Taxtab_18S.rds",
                 overwrite = TRUE)
  
  drive_download("Data_Novotny/ASV_18S.rds",
                 "Data_import/18S/ASV_18S.rds",
                 overwrite = TRUE)
  
  drive_download("Data_Novotny/Samptab_18S.rds",
                 "Data_import/18S/Samptab_18S.rds",
                 overwrite = TRUE)
  
  drive_download("Data_Novotny/Samptab_18S.rds",
                 "Data_import/18S/Samptab_18S.rds",
                 overwrite = TRUE)
  
  #################################
  # Download Microscopy data
  drive_download("Data_Novotny/ZooplanktonData/Vertical_ZP_2022.xlsx",
                 "Data_import/Microscopy/Vertical_ZP_2022.xlsx",
                 overwrite = TRUE)
  
  drive_download("Data_Novotny/ZooplanktonData/Hakai_Zooplankton_2013-2017_AN.rds",
                 "Data_import/Microscopy/Hakai_Zooplankton_2013-2017_AN.rds",
                 overwrite = TRUE)
 }


