# CVS export:
#   One gene-disease pair can have multiple annotations of allelic requirement and mutation
# consequence pairs. We export one row for each pair of allelic requirement and mutation
# consequence. The header fields are:  
#   - gene symbol:                  HGNC gene symbol 
# - gene mim:                     OMIM number for a gene entry
# - disease name:                 Name provided by the curator
# - disease mim:                  OMIM number for a disease entry
# - disease confidence:           One value from the list of possible categories: both DD and IF, confirmed, possible, probable
# - allelic requirement:          comma-separated list of allelic requirement attributes. Possible values are: biallelic, monoallelic (Y),
# imprinted, uncertain, monoallelic, hemizygous, x-linked dominant, x-linked over-dominance, mosaic,
# mitochondrial, digenic 
# - mutation consequence:         One value from the list of possible consequences: 5_prime or 3_prime UTR mutation, activating,
# all missense/in frame, cis-regulatory or promotor mutation, dominant negative, increased gene dosage,
# loss of function, part of contiguous gene duplication, part of contiguous genomic interval deletion, uncertain
# - phenotypes:                   semicolon-separated list of HPO (http://www.human-phenotype-ontology.org/) IDs
# - organ specificity list:       semicolon-separated list of organs
# - pmids:                        semicolon-separated list of PMIDs 
# - panel:                        G2P panel: Cancer, Cardiac, DD, Ear, Eye or Skin
# - prev symbols:                 Symbols previously approved by the HGNC for this gene
# - hgnc id:                      HGNC identifier
# - gene disease pair entry date: Entry date for the gene disease pair into the database


# G2P_examples
# CancerG2P_1_4_2020 <- read_csv("~/Research/g2p/G2P_panels/CancerG2P_1_4_2020.csv")
# DDG2P_30_5_2019 <- read_csv("~/Research/g2p/G2P_panels/DDG2P_30_5_2019.csv")


library(tidyverse)



CardiacG2P_master <- read_delim("CardiacG2P_master.csv", delim = ",", trim_ws = T)



#### edits 
# add ClinGen DCM genes 
# add new IC_signed_by column
# arrange cols
# 
# DCM_conf <- read_delim("DCM_conf.txt", delim = "\t", col_names = "gene_symbol")
# 
# DCM_conf$disease <- "DCM_CG"
# DCM_conf$share_status <- "confidential"
# 
# CardiacG2P_master <- plyr::rbind.fill(CardiacG2P_master, DCM_conf)
# 
# CardiacG2P_master$IC_signed_by = NA
# 
# CardiacG2P_master <- CardiacG2P_master[,c(1:4,10:14,5:9,16,18:23,17,15)]
# write_csv(CardiacG2P_master, "CardiacG2P_master.csv")
#####


#### edits
# trim whitespace in ClinGen_classification col
# arrange genes by CLinGen classification
# 
# CardiacG2P_master$ClinGen_classification<- str_trim(CardiacG2P_master$ClinGen_classification,side = c("both"))
# 
# CardiacG2P_master <- CardiacG2P_master %>%
#   arrange(match(ClinGen_classification, c("Definitive", "Strong", "Moderate", "Limited", "Disputed")), desc(ClinGen_classification))
# 
#
# write_csv(CardiacG2P_master, "CardiacG2P_master.csv")
#####


#### edits
# CardiacG2P_master$disease[CardiacG2P_master$gene_symbol=="APOB"] = "FH"
# CardiacG2P_master$disease[CardiacG2P_master$gene_symbol=="PCSK9	"] = "FH"
# CardiacG2P_master <- CardiacG2P_master[-170,] # empty line
# write_csv(CardiacG2P_master, "CardiacG2P_master.csv")
#####


#### edits
# change LDLR and LDLRAP1 to FH
# CardiacG2P_master$disease[CardiacG2P_master$gene_symbol=="LDLR"] = "FH"
# CardiacG2P_master$disease[CardiacG2P_master$gene_symbol=="LDLRAP1"] = "FH"
# 
# # Load ARVC data
# #ARVC_CG<- read_delim("../ClinGen_articles/ARVC_NEW_table2_supp2.txt", delim = "\t", trim_ws = T)
# ARVC_CG <- read_csv("~/Research/g2p/ClinGen_articles/ARVC_NEW_table2_supp2.csv")
# 
# # delete old ARVC entries
# CardiacG2P_master <- CardiacG2P_master[!CardiacG2P_master$disease=="ARVC",]
# 
# # rbind new ARVC data
# CardiacG2P_master <- rbind(CardiacG2P_master, ARVC_CG)
# 
# #trim possible whitespace
# CardiacG2P_master$ClinGen_classification<- str_trim(CardiacG2P_master$ClinGen_classification,side = c("both"))
# 
# # re-arrange based on classification of new genes
# CardiacG2P_master <- CardiacG2P_master %>%
#   arrange(match(ClinGen_classification, c("Definitive", "Strong", "Moderate", "Limited", "Refuted", "Disputed", "No human evidence")), desc(ClinGen_classification))
# 
# 
# 
# write_csv(CardiacG2P_master, "CardiacG2P_master.csv")
#####


#### edits
# trim63<- data_frame(
# "gene_symbol" = "TRIM63",
# "disease" = "HCM_new",
# "disease_subtype" = "NA",
# "syndrome" = "NA",
# "ClinGen_classification" = "NA",
# "G2P_classification" = "NA",
# "OMIM_inheritence" = "AR",
# "G2P_allelic_requirement" = "biallelic",
# "ClinGen_mutation_consequence" = "Missense, LOF",
# "OMIM_gene_ID" = "606131",
# "OMIM_disease_name" = "NA",
# "OMIM_disease_ID" = "NA",
# "ORPHA_ID" = "NA",
# "MONDO_ID" = "NA",
# "G2P_organ_specificity_list" = "NA",
# "G2P_panel" = "Cardiac",
# "prev_symbols" = "NA",
# "hgnc_id" = "NA",
# "gene_disease_pair_entry_date" = "NA",
# "share_status" = "confidential",
# "IC_signed_by" = "NA",
# "ClinGen_pmids" = "NA",
# "HPO_phenotypes" = "NA")
# 
# # rbind new  data
# CardiacG2P_master <- rbind(CardiacG2P_master, trim63)
# 
# write_csv(CardiacG2P_master, "CardiacG2P_master.csv")
####

CardiacG2P_1 <- CardiacG2P_master %>%
  #filter(!share_status == "confidential") %>%
  filter(is.na(share_status)) %>%
  select("gene symbol" = gene_symbol, 
         "gene mim" = OMIM_gene_ID,
         "disease name" = OMIM_disease_name,
         "disease mim" = OMIM_disease_ID,
         "DDD category" = G2P_classification,
         "allelic requirement" = G2P_allelic_requirement,
         "mutation consequence" = ClinGen_mutation_consequence,
         "phenotypes" = HPO_phenotypes,
         "organ specificity list" = G2P_organ_specificity_list,
         "pmids" = ClinGen_pmids,
         "panel" = G2P_panel,
         "prev symbols" = prev_symbols,
         "hgnc id" = hgnc_id,
         "gene disease pair entry date" = gene_disease_pair_entry_date)

CardiacG2P_2 <- CardiacG2P_1 %>%
  filter(!is.na(`DDD category`)) %>%
  mutate(`DDD category` = tolower(`DDD category`)) %>%
  mutate(`disease mim` = ifelse(!is.na(`disease mim`),`disease mim`, "No disease mim"))%>%
  mutate(`hgnc id` = str_replace(`hgnc id`,"HGNC:","")) %>%
  mutate(`prev symbols` = str_replace(`prev symbols`,", ",";")) %>%
  mutate(`gene disease pair entry date` = Sys.time()) %>%
  mutate(pmids = str_remove(pmids , "[;]$")) %>%
  mutate(`organ specificity list` = "Heart/Cardiovasculature/Lymphatic") %>%
  mutate(`mutation consequence` = case_when(
    grepl("LOF" , `mutation consequence`) ~ "loss of function",
    grepl( "Missense" , `mutation consequence`) ~ "all missense/in frame",
    TRUE ~ "uncertain"
  ))


write_csv(CardiacG2P_2, "CardiacG2P.csv")



# write only complete genes (eg. mutation consequence)
CardiacG2P_3 <- CardiacG2P_2 %>%
  filter(!`mutation consequence` == "uncertain") %>%
  write_csv("CardiacG2P_complete.csv")






