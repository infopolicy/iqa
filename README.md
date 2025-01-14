# Information Quality Act Reporting Code and Analysis Repository
This project summarizes historical and contemporary Information Quality Act of 2000 (IQA) data that the Office of Management and Budget's (OMB) Office of Information and Regulatory Affairs (OIRA) has collected from Federal agencies. [The repository](https://github.com/infopolicy/iqa) provides public access to data, code, and analysis used by OIRA in generating an annual report to Congress. This project satisfies OMB's reporting requirements under the IQA. 

# Table of Contents
- [Technical Details](#Technical-Details)
- [Data Quality Summaries](#Data-Quality-Summaries)
- [Detailed Descriptions of Data Files](#Detailed-Descriptions-of-Data-Files)
- [Contact](#Contact)

# Technical Details
## Organization of the repository
There are four subdirectories in the repository.
* [bin/](bin/) -  excel files of source data
* [code/](code/) -  analytic and report build code, this is also the host source for the compiled reports
* [data/](data/) -  analytic source data in non-binary, comma-separated value, format
* [docs/](docs/) -  a reference archive of past IQA reports and guidelines 

## Code
The analytic code in [/code/](code/)  that compiles the reports is done in R via knitr and has the following package dependencies: knitr, dplyr, ggplot2, tidyverse, gt, and viridis. 

All source code files are saved as "qmd" files and can be sourced into R as a batch process or interactively. 

## Build and Deployment
The resulting report is output as an html file in [/code/](code/). This is deployed as a github pages static page through a standard deployment workflow with github actions. The current deployment routine is located [here](https://github.com/infopolicy/iqa/actions/runs/12691834619).

# Data Quality Summaries
Data on Federal agencies' Information Quality Act activities have been collected by OMB since 2003. In general, the data collected by OMB include information about requests for correct, requests for reconsideration, and peer-review activities conducted under the Information Quality Act.  A Request for Correction (RFC) is the original challenge or complaint initiated under the IQA.  A Request for Reconsideration (RFR) is the appeal of the agency's initial decision on the RFC.  As a result, some summary statistics in this report only count on the basis of the original submitted RFCs, since including RFRs would be a double-count of a single request. Peer reviews are internal or external reviews of agency information intended for public dissemination. As IQA activities, guidelines, and processes have changed over the years, the IQA data has various levels of quality and quality control issues. 

## Data and Reports Prior to Fiscal Year 2007
Data on Federal agencies' Information Quality Act activities have been collected by OMB since 2003. Data collected prior to 2006 occured at a time when the IQA implementation guidelines from OMB were still relatively new and agency procedures for collecting and reporting the data were not finalized.  Between 2003 and 2006, OMB was able to collect information on requests for reconsideration (RFRs) but not necessarly requests for correction (RFCs) from Federal agencies.  Discrepancies and variations in these data partially reflect the way in which the data were categorized by the agencies. The Fiscal Year (FY) 2003 and 2004 data included in this repository were largely manually extracted from the [2005 Report to Congress](docs/annual-reports/final_2005_cb_report.pdf).

In the [2005 Report to Congress](docs/annual-reports/final_2005_cb_report.pdf), OMB attempted to differentiate data on requests for reconsideration (RFR) reported by agencies that were initiated through the IQA from more trivial requests that were no different in substance from the simple web page fixes or technical corrections that agencies have always received. The report presented analyses that grouped together the FY-2003 and FY-2004 RFRs. In cases where all of an agency’s correction requests were not collected in response to RFRs through the IQA, the 2005 Report to Congress did not include them in the FY-2003 and FY-2004 totals.   For example: FEMA (24,433 flood insurance rate map revisions), DOT (particularly those to Federal Motor Carrier Safety Administration, FMCSA), NARA, DOL, DOJ, Treasury, NASA, the Commodity Futures Trading Commission (CFTC), the Federal Deposit Insurance Corporation (FDIC), the State Department, and DOE.  While these agency totals are summarized in tables presented in the FY-2005 report, they were omitted from the data extractions archived here. 
 
However, in cases where an agency report included requests OMB believed to be generated through IQA processes along with requests that were not, OMB had included all the requests in the FY-2003 and FY-2004 totals.  This was done for transparency, and likely includes some data that was not generated under the IQA.  As a result, total requests for correction for FY-2003 and FY-2004 are overstated and contain requests not generated through IQA proceses.  Some requests reported by agencies for FY-2005 were also not included in the totals as-per the [2006 Report to Congress](docs/annual-reports/2006_cb_final_report.pdf) (one each from State Department, GSA, and DOT). 

## Data and Reports from Fiscal Year 2007 to 2018
From 2007 onward, some data are collected on what's referred to as a "a partial correction", which can result from the agency taking an action in response to an RFR or RFC that partially, but not fully, addresses the request. It was not until the [2007 Report to Congress](docs/annual-reports/2007_cb_final_report.pdf) where “partial corrections” were explicitly accounted for in RFC resolutions data (for FY-2006).  In data archived here, all corrections are simply listed as “full correction” for FY-2006 and earlier, even though some of those may have been “partial corrections” in practice.  

The [2013 Report to Congress](docs/annual-reports/2013_cost_benefit_report-updated.pdf) listed incorrect fiscal years in the tables and text, and descriptions of the agencies or programs within large departments performing peer reviews were not consistent with the data presented.  As a result, there may be some inaccuracies in peer review data for this year, and data tables are incomplete (agencies within departments were not correctly listed).  

## Data that Span Multiple Fiscal Years
In counting how requests are ultimately resolved, OMB extracted data from graphical flowcharts and tallied data based on the final conclusive resolution (after appeals, if applicable).  For example, if an initial determination was “no correction”, and the requestor appealed and the agency later granted a “partial correction”, this was counted only as a “partial correction” since the aim is determining how requests are ultimately resolved.  If an initial agency determination was “partial correction” and the requestor appealed, and the agency denied the appeal, this would also count as a “partial correction”.  

Because of the graphical nature of the data contained in the Reports to Congress, there is some loss of information when appeals are unresolved at the end of a fiscal year.  These are accounted for in the proceeding years’ Reports.  However, all the prior unresolved appeals are simply listed together as “pending”, regardless of the original determinations.  The flowcharts often list appeals as being “denied”.  Without knowing the origin of each appeal, it is therefore unclear how the denied appeal would presumably default to the original agency determination.  It is implied from many of the reports and flowcharts that “denied” is equivalent to “no correction” (and this nomenclature varied over the years).  Appeals are typically made by requestors when a request for correction is initially denied and no correction is made.  Therefore, we made the decision to equate “denied” with “no correction” when there was no other information to indicate otherwise.  While this may introduce an error in the year-to-year tally and pie charts of final RFC resolutions, it only affects approximately 10 (out of hundreds) of RFCs received.  Therefore, this particular error is small.      

For simplicity, the total data for RFC resolutions do not include any “pending” actions as may be noted Reports to Congress. These actions are ultimately resolved and accounted for in subsequent fiscal years.  

## Fiscal Year 2019 to 2023 Data Call
Data were not collected on an annual basis between 2019 and 2022. As a result, a "catch-up" data call was issued to Federal agencies by OMB in 2023. To reduce burden on agencies for this special multi-year effort, OMB did not collect as much information as years prior. Furthermore, these years encompass the COVID-19 public health emergency, which put considerable strain on some agencies' IQA activities - HHS in particular. As a result, OIRA only asked agencies to estimate the number of public comments received on their peer review plans during this period. HHS peer review data on waivers/deferrals/exemptions and potential reviewer conflicts for this period were not available at the time of collection.

Because OIRA did not collect specific details of RFCs and RFRs received and resolved, full data quality audits could not be performed.  For example, OIRA would typically correct errors related to how agencies categorized the type of information corrected or the organizations requesting correction.  For the FY-2019 to FY-2023 data call, OIRA occasionally evaluated the submitted data against RFC/RFR correspondence posted online and worked with agencies whenever discrepancies were noted. This was not done on a systematic basis.

# Detailed Descriptions of Data Files
The following section describes the structure and contents of categories of files located in [/data/](/data/).

## PEER_REVIEWS.csv
Total number of peer reviews of Influential Scientific Information (ISI) and the subset Highly Influential Scientific Assessments (HISA) reported to have been produced or sponsored by the agencies (indicated as “Agency”), that completed peer review in each fiscal year (indicated as FY03, FY04, etc). Data extracted from OIRA Reports to Congress (for FY2003 to FY-2018), and from electronic submission (FY2019 to present).

## HISA.csv
Number of Highly Influential Scientific Assessments (HISA) reported to have been produced or sponsored by the agencies (defined as “Agency”), that completed peer review in each fiscal year (indicated as FY03, FY04, etc). Data extracted from OIRA Reports to Congress (for FY-2003 to FY-2018), and from electronic submission (FY19-current).

## PEER_REVIEW_SUMMARY_TABLE_FYXX.csv
All summary in formation from Peer Review data extracted from OIRA Reports to Congress (for FY03-FY18), and from electronic submission (FY2019 to current).  Contains information on numbers of peer reviews, waivers/deferrals/exemptions, and potential peer reviewer conflicts by each agency ( “Agency”).  This also contains lists of agencies or offices within larger departments performing most or all of the peer reviews (defined as Agency1, Agency2, etc).   Agency names may contain formatting and acronym inconsistencies (including punctuations which can inhibit some data importation).  Additional aggregation and formatting will be performed at a later date.  Also note that there were inter-departmental and year-to-year variations in how agency-under-department data were reported, and so users are cautioned against drawing any conclusions about trends regarding agencies under larger departments (e.g., FDA under HHS or FWS under DOI).  

## RFC_AGENCIES.csv
Number of all requests for correction (RFCs) reported to have been received by each  agency (defined as “Agency), by fiscal year (indicated as FY03, FY04, etc). Data extracted from OIRA Reports to Congress (for FY03-FY18), and from electronic submission (FY19-current).

## RFR_AGENCIES.csv
Number of all requests for reconsideration (RFRs, or "appeals") reported to have been received by each agency (defined as “Agency”), by fiscal year (indicated as FY03, FY04, etc). Data extracted from OIRA Reports to Congress (for FY03-FY18), and from electronic submission (FY19-current). 

## RFC_FINAL_RESOLUTION.csv
Numbers of RFCs resolved in each fiscal year (defined as “Year”), and how those RFCs were resolved (after being appealed, if applicable).  Resolutions are defined as “Correction”, “Partial Correction”, “No Correction”, and “Other”.  Data extracted from OIRA Reports to Congress (for FY03-FY18), and from electronic submission (FY19-current).   Please see earlier note about accounting of [RFRs (or “appeals”) that go unresolved between fiscal years](#requests-for-reconsideration-rfrs-or-appeals-that-go-unresolved-between-fiscal-years), as well as introduction of the [“Partial Correction” category for FY2006 data](#partial-and-full-correction-reporting). 

## PR_FY_PLOT.csv
Total number of peer reviews of Influential Scientific Information (ISI) and the subset Highly Influential Scientific Assessments (HISA) reported to have been produced or sponsored by the agencies, that completed peer review in each fiscal year. These are the sums over all agencies (using data presented in PEER_REVIEWS.csv)

## HISA_FY_PLOT.csv
Number of Highly Influential Scientific Assessments (HISA) reported to have been produced or sponsored by the agencies, that completed peer review in each fiscal year. These are the sums over all agencies (using data presented in HISA.csv)

## AGENCY_URLS.csv
Agency resources for Information Quality Act and Peer Review reporting. URLs obtained by agencies from recent electronic submissions.  

## REQUESTOR_SUMMARY_TABLE_FYXX.csv
Summary of requestors submitting RFCs by agency (one file for each fiscal year, e.g., requestor_summary_table_FY19.csv for FY19). Data extracted from electronic submission (FY19-current).  Data were not contained in the Reports to Congress. 

## RFC_REQUESTOR_TYPES.csv
Summary of requestors submitting RFCs by fiscal year (sum across all agencies using data noted in requestor summary tables).  

## INFORMATION_TYPE_SUMMARY_TABLE_FYXX.csv
Summary of the types of information challenged in RFCs by agency (one file for each fiscal year, e.g., information_type_summary_table_FY19.csv for FY 19). Data extracted from electronic submission (FY19-current).  Data were not contained in the Reports to Congress. 

## RFC_INFORMATION_TYPES.csv
Summary of the types of information challenged in RFCs by fiscal year (sum across all agencies using data noted in information summary tables).

## agency_urls_source.xlsx
Table of agency IQA URLs, collected from data calls and manual screening of department websites.  These links will continue to be updated. 

## peer_review_source.xlsx
Tables of peer review summaries.  Data extracted from OIRA Reports to Congress (for FY03-FY18), and from electronic submission (FY19-current).  One tab for each fiscal year.  Note: formatting differences between fiscal years for agencies within large departments are still unresolved between FY18/FY19+ data.  Some columns contain mathematical operations to make consistent for data extraction.  

## rfcs_resolutions_source.xlsx
Final resolutions (if applicable) of requests for corrections and reconsiderations resolved within each fiscal year. Resolutions are correction/no correction/partial correction/handled by other processes/pending.   Data extracted from OIRA Reports to Congress (for FY-2003 to FY-2018), and from electronic submission (FY-2019 to present).  In counting how requests are ultimately resolved, OMB extracted data from graphical flowcharts and tallied data based on the final conclusive resolution (after appeals, if applicable).  For example, if an initial determination was “no correction”, and the requestor appealed and the agency later granted a “partial correction”, this was counted only as a “partial correction” since the aim is determining how requests are ultimately resolved.  If an initial agency determination was “partial correction” and the requestor appealed, and the agency denied the appeal, this would also count as a “partial correction”.

## pending_rfcs_source.xlsx and pending_rfrs_source.xlsx
For each fiscal year, OIRA Reports to Congress (for FY-2003 to FY-2018) provided tables of all RFCs and RFRs that were reported as unresolved from prior fiscal years, and how those were ultimately resolved (correction/no correction/partial correction/handled by other processes/pending).  Those data are presented here.  These are ultimately merged with data from rfcs_resolutions_source and rfr_agencies_source to determine a running count of how RFCs are ultimately resolved. For the data collection FY-2019 to FY-2023, this granular level of detail (by fiscal year) was not collected due to the multi-year nature of the call.  OMB was only able to ask about the nature of pending RFCs/RFRs at the end of FY-2023. 

## rfc_agencies_source.xlsx
Table of RFCs recieved by each agency, by fiscal year.  Data extracted from OIRA Reports to Congress (for FY2003 to FY-2018), and from electronic submission (FY-2019 to FY-2023). Please see earlier notes (under [Data and Reports Prior to Fiscal Year 2007](#Data-and-Reports-Prior-to-Fiscal-Year-2007)) regarding adjustments to the totals for earlier years. 

## rfr_agencies_source.xlsx
Table of RFRs recieved by each agency, by fiscal year.  Data extracted from OIRA Reports to Congress (for FY-2003 to FY-2018), and from electronic submission (FY-2019 to FY-2023). Please see earlier notes (under [Data and Reports Prior to Fiscal Year 2007](#Data-and-Reports-Prior-to-Fiscal-Year-2007)) regarding adjustments to the totals for earlier years. 

## rfc_information_types_source.xlsx
Summary of the types of information challenged in RFCs by agency (one tab for each fiscal year).  Data from electronic submission (FY-2019 to present).

## rfc_requestors_source.xlsx
Summary of requestors submitting RFCs by agency (one tab for each fiscal year).  Data from electronic submission (FY2019 to present).

# Contact
For questions or suggestions regarding the data or analysis in this repository, please email <MBX.OMB.InformationQuality@OMB.eop.gov>. For technical improvements to the repository, please use github issues and pull requests as appropriate.  
