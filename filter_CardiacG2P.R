
library(tidyverse)


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


CardiacG2P_master <- read_delim("CardiacG2P_master.csv", delim = ",")

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






