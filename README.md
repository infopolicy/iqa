# Information Quality Act Reporting Code and Analysis Repository
This project summarizes historical and contemporary Information Quality Act of 2000 (IQA) data that the Office of Management and Budget's (OMB) Office of Information and Regulatory Affairs (OIRA) has collected from Federal agencies. [The repository](https://github.com/infopolicy/iqa) provides public access to data, code, and analysis used by OIRA in generating an annual report to Congress. This project satisfies OMB's reporting requirements under the IQA. 

# Organization of the repository
There are four subdirectories in the repository.
* (/bin/)[bin/] -  excel files of source data
* (/code/)[code/] -  analytic and report build code, this is also the host source for the compiled reports
* (/data/)[data/] -  analytic source data in non-binary, comma-separated value, format
* (/docs/)[docs/] -  a reference archive of past IQA reports and guidelines 

# Data Quality Summaries

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

## Fiscal Year 2019-2023 catch-up data call
Data over these years are incomplete relative to years prior, because detailed questions about each request were omitted from the data call to decrease burden on agencies for this special multi-year effort. Furthermore, these years encompass the COVID-19 public health emergency, which put strain on some agencies as priorities rapidly evolved.

OIRA only asked agencies to estimate the number of public comments received on their peer review plans. HHS peer review data on waivers/deferrals/exemptions and potential reviewer conflicts for FY19-23 were not available.  

Because OIRA did not collect specific details of RFCs and RFRs received and resolved, full QA/QC or audits of the data could not be performed.  For example, OIRA would typically correct errors related to how agencies categorized the type of information corrected or the organizations requesting correction.  For the FY2019-FY2023 data call, OIRA occasionally evaluated the submitted data against RFC/RFR correspondence posted online and worked with agencies whenever discrepancies were noted.     

### File list and descriptions

#### IQA_annual_data_report (HTML and qmd files)
Summary of IQA and Peer Review data generated from IQA_annual_data_report.Rmd and using csv files listed below.  IQA_annual_data_report.Rmd requires the following libraries: dplyr, ggplot2, tidyverse, gt, and viridis. 

#### PEER_REVIEWS.csv
Total number of peer reviews of Influential Scientific Information (ISI) and the subset Highly Influential Scientific Assessments (HISA) reported to have been produced or sponsored by the agencies (defined as “Agency”), that completed peer review in each fiscal year (defined as FY03, FY04, etc). Data extracted from OIRA Reports to Congress (for FY03-FY18), and from electronic submission (FY19-current).

#### HISA.csv
Number of Highly Influential Scientific Assessments (HISA) reported to have been produced or sponsored by the agencies (defined as “Agency”), that completed peer review in each fiscal year (defined as FY03, FY04, etc). Data extracted from OIRA Reports to Congress (for FY03-FY18), and from electronic submission (FY19-current).

#### PEER_REVIEW_SUMMARY_TABLE_FYXX.csv
All summary in formation from Peer Review data extracted from OIRA Reports to Congress (for FY03-FY18), and from electronic submission (FY19-current).  Contains information on numbers of peer reviews, waivers/deferrals/exemptions, and potential peer reviewer conflicts by each agency (defined as “Agency”).  This also contains lists of agencies or offices within larger departments performing most or all of the peer reviews (defined simply as Agency1, Agency2, etc).   Agency names may contain formatting and acronym inconsistencies (including punctuations which can inhibit some data importation).  Additional aggregation and formatting will be performed at a later date.  Also note that there were inter-departmental and year-to-year variations in how agency-under-department data were reported, and so users are cautioned against drawing any conclusions about trends regarding agencies under larger departments (e.g., FDA under HHS or FWS under DOI).  

#### RFC_AGENCIES.csv
Number of all requests for correction (RFCs) reported to have been received by each  agency (defined as “Agency), by fiscal year (defined as FY03, FY04, etc). Data extracted from OIRA Reports to Congress (for FY03-FY18), and from electronic submission (FY19-current).

#### RFR_AGENCIES.csv
Number of all requests for reconsideration (RFRs, or "appeals") reported to have been received by each agency (defined as “Agency”), by fiscal year (defined as FY03, FY04, etc). Data extracted from OIRA Reports to Congress (for FY03-FY18), and from electronic submission (FY19-current). 

#### RFC_FINAL_RESOLUTION.csv
Numbers of RFCs resolved in each fiscal year (defined as “Year”), and how those RFCs were resolved (after being appealed, if applicable).  Resolutions are defined as “Correction”, “Partial Correction”, “No Correction”, and “Other”.  Data extracted from OIRA Reports to Congress (for FY03-FY18), and from electronic submission (FY19-current).   Please see earlier note about accounting of [RFRs (or “appeals”) that go unresolved between fiscal years](#requests-for-reconsideration-rfrs-or-appeals-that-go-unresolved-between-fiscal-years), as well as introduction of the [“Partial Correction” category for FY2006 data](#partial-and-full-correction-reporting). 

#### PR_FY_PLOT.csv
Total number of peer reviews of Influential Scientific Information (ISI) and the subset Highly Influential Scientific Assessments (HISA) reported to have been produced or sponsored by the agencies, that completed peer review in each fiscal year. These are the sums over all agencies (using data presented in PEER_REVIEWS.csv)

#### HISA_FY_PLOT.csv
Number of Highly Influential Scientific Assessments (HISA) reported to have been produced or sponsored by the agencies, that completed peer review in each fiscal year. These are the sums over all agencies (using data presented in HISA.csv)

#### AGENCY_URLS.csv
Agency resources for Information Quality Act and Peer Review reporting. URLs obtained by agencies from recent electronic submissions.  

#### REQUESTOR_SUMMARY_TABLE_FYXX.csv
Summary of requestors submitting RFCs by agency (one file for each fiscal year, e.g., requestor_summary_table_FY19.csv for FY19). Data extracted from electronic submission (FY19-current).  Data were not contained in the Reports to Congress. 

#### RFC_REQUESTOR_TYPES.csv
Summary of requestors submitting RFCs by fiscal year (sum across all agencies using data noted in requestor summary tables).  

#### INFORMATION_TYPE_SUMMARY_TABLE_FYXX.csv
Summary of the types of information challenged in RFCs by agency (one file for each fiscal year, e.g., information_type_summary_table_FY19.csv for FY 19). Data extracted from electronic submission (FY19-current).  Data were not contained in the Reports to Congress. 

#### RFC_INFORMATION_TYPES.csv
Summary of the types of information challenged in RFCs by fiscal year (sum across all agencies using data noted in information summary tables).

#### agency_urls_source.xlsx
Table of agency IQA URLs, collected from data calls and manual screening of department websites.  These links will continue to be updated. 

#### peer_review_source.xlsx
Tables of peer review summaries.  Data extracted from OIRA Reports to Congress (for FY03-FY18), and from electronic submission (FY19-current).  One tab for each fiscal year.  Note: formatting differences between fiscal years for agencies within large departments are still unresolved between FY18/FY19+ data.  Some columns contain mathematical operations to make consistent for data extraction.  

#### rfcs_resolutions_source.xlsx
Final resolutions (if applicable) of requests for corrections and reconsiderations resolved within each fiscal year. Resolutions are correction/no correction/partial correction/handled by other processes/pending.   Data extracted from OIRA Reports to Congress (for FY03-FY18), and from electronic submission (FY19-current).  In counting how requests are ultimately resolved, OMB extracted data from graphical flowcharts and tallied data based on the final conclusive resolution (after appeals, if applicable).  For example, if an initial determination was “no correction”, and the requestor appealed and the agency later granted a “partial correction”, this was counted only as a “partial correction” since the aim is determining how requests are ultimately resolved.  If an initial agency determination was “partial correction” and the requestor appealed, and the agency denied the appeal, this would also count as a “partial correction”.

#### pending_rfcs_source.xlsx and pending_rfrs_source.xlsx
For each fiscal year, OIRA Reports to Congress (for FY03-FY18) provided tables of all RFCs and RFRs that were reported as unresolved from prior fiscal years, and how those were ultimately resolved (correction/no correction/partial correction/handled by other processes/pending).  Those data are presented here.  These are ultimately merged with data from rfcs_resolutions_source and rfr_agencies_source to determine a running count of how RFCs are ultimately resolved. For the data collection FY19-FY23, this granular level of detail (by fiscal year) was not collected due to the multi-year nature of the call.  OMB was only able to ask about the nature of pending RFCs/RFRs at the end of FY23. 

#### rfc_agencies_source.xlsx
Table of RFCs recieved by each agency, by fiscal year.  Data extracted from OIRA Reports to Congress (for FY03-FY18), and from electronic submission (FY19-current). Please see earlier notes (under [Data prior to Fiscal year 2006](#data-prior-to-fiscal-year-2006)) regarding adjustments to the totals for earlier years. 

#### rfr_agencies_source.xlsx
Table of RFRs recieved by each agency, by fiscal year.  Data extracted from OIRA Reports to Congress (for FY03-FY18), and from electronic submission (FY19-current). Please see earlier notes (under [Data prior to Fiscal year 2006](#data-prior-to-fiscal-year-2006)) regarding adjustments to the totals for earlier years. 

#### rfc_information_types_source.xlsx
Summary of the types of information challenged in RFCs by agency (one tab for each fiscal year).  Data from electronic submission (FY19-current).

#### rfc_requestors_source.xlsx
Summary of requestors submitting RFCs by agency (one tab for each fiscal year).  Data from electronic submission (FY19-current).


#### Contact
For questions or suggestions regarding this repository or data, please email <MBX.OMB.InformationQuality@OMB.eop.gov>. 
