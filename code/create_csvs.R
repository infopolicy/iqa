
library(dplyr)
library(tidyverse)
library(readxl)


#defining path for csv outfiles, and resetting working directory
setwd("..")
mypath<-getwd()
outpath<-paste0(mypath, "/data/csvs/")
mywd<-paste0(mypath, "/code")
setwd(mywd)

#import from agency_URL source file and replace NA wth blanks
agency_URLs<- read_excel("../bin/agency_urls_source.xlsx")
agency_URLs[is.na(agency_URLs)] <-""
agency_URLs_sorted <- agency_URLs %>%
  arrange(Agency)

#import from RFC resolutions source file
RFCs_resolutions<-read_excel("../bin/rfcs_resolutions_source.xlsx")

#import the RFC and RFR resolutions source file, of requests that were 'pending from prior fiscal years' and ultimately resolved
pending_rfrs <- read_excel("../bin/pending_rfrs_source.xlsx")
pending_rfcs <- read_excel("../bin/pending_rfcs_source.xlsx")

#all 3 data structures are same format (in terms of fiscal years, and column headings)

#To count the total final resolutions of RFCs, the "pending" data category in all structures is ignored. 
#Final resolutions that were extracted from reports to congress and 
#input to rfcs_resolutions_source.xlsx (corrected, partial corrected, no correction) avoided double-counting by 
#only considering the final resolution AFTER appeals.  
#Anything "pending" from prior years is ultimately counted as either correction/final correction/no correction/other.  
#See README for errors due to lack of "partial correction" category for earlier years, and year-to-year carryover appeals. 

#Create a FY-by-resolution table (amenable to both a pie chart and FY-plots), 
#without counting "pending" columns (column 6), or the Fiscal year labels (column 1):
RFC_resolution_totals<-RFCs_resolutions[, 2:5]+pending_rfcs[, 2:5]+pending_rfrs[, 2:5]

#adding the FY list back as first column (all 3 files had the same format and FY list)
RFC_resolution_df<-bind_cols(RFCs_resolutions[1], RFC_resolution_totals)
write.csv(RFC_resolution_df, file = paste0(outpath,"RFC_FINAL_RESOLUTION.csv"), row.names = FALSE)

#Read RFC and RFR source files, and replace NA with zeros
RFCs_by_agency <- read_excel("../bin/rfc_agencies_source.xlsx") 
RFCs_by_agency[is.na(RFCs_by_agency)] <-0 

RFRs_by_agency <- read_excel("../bin/rfr_agencies_source.xlsx")
RFRs_by_agency[is.na(RFRs_by_agency)] <-0 

#convert any numbers that may have been imported as characters to numeric, and add a new "Total" column
RFCs_by_agency[-1] <- lapply(RFCs_by_agency[-1], function(x)as.numeric(as.character(x)))
RFCs_by_agency$Total<- rowSums(RFCs_by_agency[, -1])

RFRs_by_agency[-1] <- lapply(RFRs_by_agency[-1], function(x)as.numeric(as.character(x)))
RFRs_by_agency$Total<- rowSums(RFRs_by_agency[, -1])

#Read peer review source file (by tab), save as separate CSVs, and re-structure to formats amenable to analysis
peer_review_FYs<-excel_sheets("../bin/peer_review_source.xlsx") #list of all FY tabs

#define empty structures for peer reviews and HISAs to populate in the for-loop
peer_review_running_list<-c(); HISA_running_list<-c();
#loop over all tabs (fiscal years) to extract data
for (x in peer_review_FYs) {
  print(x)
  tempx<-read_excel("../bin/peer_review_source.xlsx",  sheet = x)
  Ax<-select(tempx, "Agency (abbrv.)", "Total Peer Reviews Completed")
  #create a new column listing the FY for each row (data to be re-shaped at later steps)
  #Repeat the FY label for all entries in this FY tab
  FYrep<-data.frame(rep(x, nrow(Ax))) 
  colnames(FYrep)<-"FY"
  FY_data<-cbind(Ax, FYrep)
  #append FY data to peer review structure
  peer_review_running_list<-rbind(peer_review_running_list,FY_data) 
  
  #repeat same process for HISA reviews 
  Bx<-select(tempx, "Agency (abbrv.)", "Reviews of HISA") 
  FY_dataHISA<-cbind(Bx, FYrep) # FY column is the same for both peer review/HISA data structures
  HISA_running_list<-rbind(HISA_running_list,FY_dataHISA)
  
  # while this FY sheet open, save it to a CSV. Tables not currently used in FY24 report, but can be useful in future. 
  #Some manual work needs to be done in the source files to harmonize FY04-18 data with data from the FY19+ 
  write.csv(tempx, na = "", file = paste0(outpath, "PEER_REVIEW_SUMMARY_TABLE_", x, ".csv"), row.names = FALSE)
  
}

##### re-structure peer review table
#replace NA with 0
peer_review_running_list <- peer_review_running_list %>% replace(is.na(.), 0)
#create new data structure, re-defining the column names as simpler variables instead of strings
PR_list<-peer_review_running_list |> rename(FY="FY", Agency="Agency (abbrv.)", PR="Total Peer Reviews Completed")

by_FY<-PR_list|>group_by(FY)
PR_FY_plot<-by_FY |>summarise(total_FY_PR=sum(PR))

#use 'pivot wider' in the "by fiscal year" files so that the FY appears at the top
#The final result is a matrix of peer reviews by agency and fiscal year

peer_reviews_by_fiscal_year <- by_FY |>
  pivot_wider(
    names_from = FY, values_from = PR
  )
peer_reviews_by_fiscal_year <- peer_reviews_by_fiscal_year %>% replace(is.na(.), 0)
#note: this is ISI+HISA

##### re-structure HISA/agencies table (same  as above)
#replace NA with 0
HISA_running_list <- HISA_running_list %>% replace(is.na(.), 0)
HISA_list<-HISA_running_list |> rename(FY="FY", Agency="Agency (abbrv.)", HISA="Reviews of HISA")
by_FY_HISA<-HISA_list|>group_by(FY)
HISA_FY_plot<-by_FY_HISA |>summarise(total_FY_HISA=sum(HISA))

HISA_by_fiscal_year <- by_FY_HISA |>
  pivot_wider(
    names_from = FY, values_from = HISA
  )
HISA_by_fiscal_year <- HISA_by_fiscal_year%>%replace(is.na(.), 0)
######

#read and re-shape "requestor-type" source file (multiple tabs by FY) 
requestor_FYs<-excel_sheets("../bin/rfc_requestors_source.xlsx") #list of all FY tabs
requestor_vector<-c()
#create a table of the total requestor types for each fiscal year
#Tables not currently used in FY24 report, but can be useful in future
for (x in requestor_FYs) {
  print(x)
  tempx<-read_excel("../bin/rfc_requestors_source.xlsx",  sheet = x)
  tempx[is.na(tempx)] <-0 
  requestor_vector<-rbind(requestor_vector,colSums(tempx[-1]) )
  write.csv(tempx, na = "", file = paste0(outpath, "REQUESTOR_SUMMARY_TABLE_", x, ".csv"), row.names = FALSE)
  
}
#create RFC requestor type data frame
RFC_requestor_types<-as.data.frame(requestor_vector, row.names=requestor_FYs)|>
  rownames_to_column(var="Fiscal Year")

#read and re-shape "information-type" source file (multiple tabs by FY) 
information_types_FYs<-excel_sheets("../bin/rfc_information_types_source.xlsx") #list of all FY tabs
information_type_vector<-c()

for (x in information_types_FYs) {
  print(x)
  tempx<-read_excel("../bin/rfc_information_types_source.xlsx",  sheet = x)
  tempx[is.na(tempx)] <-0 
  
  information_type_vector<-rbind(information_type_vector,colSums(tempx[-1]) )
  write.csv(tempx, na = "", file = paste0(outpath, "INFORMATION_TYPE_SUMMARY_TABLE_", x, ".csv"), row.names = FALSE)
  
}
#create RFC information type data frame
RFC_information_types<-as.data.frame(information_type_vector, row.names=information_types_FYs)|>
  rownames_to_column(var="Fiscal Year")


#write necessary variables (to be used in data visualizations) to csv files
#pending_rfrs, pending_rfcs, RFCs_resolutions currently not saved or used in the markdown page
write.csv(RFCs_by_agency, file = paste0(outpath, "RFC_AGENCIES.csv"), row.names = FALSE)
write.csv(RFRs_by_agency, file = paste0(outpath, "RFR_AGENCIES.csv"), row.names = FALSE)
write.csv(peer_reviews_by_fiscal_year, file = paste0(outpath, "PEER_REVIEWS.csv"), row.names = FALSE)
write.csv(HISA_by_fiscal_year, file = paste0(outpath, "HISA.csv"), row.names = FALSE)
write.csv(PR_FY_plot, file=paste0(outpath, "PR_FY_PLOT.csv"), row.names = FALSE)
write.csv(HISA_FY_plot, file=paste0(outpath, "HISA_FY_PLOT.csv"), row.names = FALSE)
write.csv(agency_URLs_sorted, file=paste0(outpath, "AGENCY_URLS.csv"), row.names = FALSE)
write.csv(RFC_requestor_types, file=paste0(outpath, "RFC_REQUESTOR_TYPES.csv"), row.names = FALSE)
write.csv(RFC_information_types, file=paste0(outpath, "RFC_INFORMATION_TYPES.csv"), row.names = FALSE)