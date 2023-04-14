
library(tidyverse)
library(readxl)
library(openxlsx)
library(jsonlite)
library(RCurl)


# KJosephs onedrive
# https://imperiallondon-my.sharepoint.com/:x:/r/personal/kjosephs_ic_ac_uk/Documents/Kat_Imperial/GenCC/Cardiac_G2P/G2P_panel_spreadsheets/Cardiac_G2P_MASTER_all_info_CURRENT.xlsx?d=wc3dc90132e974e65b0d8a26fd1228742&csf=1&web=1&e=RMXoMU
Cardiac_G2P_MASTER_all_info_CURRENT <- read_excel("Cardiac_G2P_MASTER_all_info_CURRENT.xlsx")

# G2P_submission_template_20211123 <- read_excel("G2P_submission_template_20211123.xlsx") %>% colnames() 
G2P_submission_template_20211123 <- read_excel("G2P_submission_202202.xlsm") %>% colnames() 


# 
# get_entrezID <- function(Gene) {
#   if (Gene %in% missing_entrez) {
#     out<-NA
#   }else { 
#     out<-fromJSON(system(command = paste0("curl -kX GET \"https://hpo.jax.org/api/hpo/search/?q=",Gene,"&max=-1&offset=0&category=genes\" -H \"accept: application/json\""),intern = T,wait = T,ignore.stderr = T))$genes$entrezGeneId[1] #%>% as.character()
#   }
#   return(out)
# }
# 
# get_HPOterm <- function(Gene,Gene_entrezID) {
#   if (Gene %in% missing_entrez) {
#     out<-NA
#   }else { 
#     out<-fromJSON(system(command = paste0("curl -kX GET \"https://hpo.jax.org/api/hpo/gene/",Gene_entrezID,"\" -H \"accept: application/json\""),intern = T,wait = T,ignore.stderr = T))$termAssoc %>% pull(1) %>% paste(collapse = ";")
#   }
#   return(out)
# }
# 
# 
# missing_entrez <- c("SLC4A3","CTF1","LRRC10","CALR3","KLF10","MYOM1","TJP1","CACNA2D1","KCNE5","KCNJ8","RANGRF","SLMAP","MAT2A","AQP1")
# 
# 
# Cardiac_G2P_MASTER_addHPO <- Cardiac_G2P_MASTER_all_info_CURRENT %>%
#   mutate(Gene = if_else(Gene=="LZTR1 (AR)","LZTR1",Gene)) %>% 
#   rowwise() %>% 
#   mutate(Gene_entrezID = get_entrezID(Gene)) %>% 
#   mutate(Gene_HPOterm = get_HPOterm(Gene,Gene_entrezID))
# 
# write.xlsx(Cardiac_G2P_MASTER_addHPO, "Cardiac_G2P_MASTER_all_info_CURRENT_HPO.xlsx",overwrite = T)
# 
# 


CG2P_edit <- Cardiac_G2P_MASTER_all_info_CURRENT %>% 
  #filter(Ware_Mechansim_curation=="Yes") %>% 
  mutate(Disease_grouping = str_replace(Disease_grouping, "^\\w{1}", toupper)) %>% 
  mutate(mechanism_curated_PMIDs = str_replace_all(mechanism_curated_PMIDs,":",";")) %>%
  mutate(mechanism_curated_PMIDs = str_replace_all(mechanism_curated_PMIDs,",",";")) %>% 
  mutate(mechanism_curated_PMIDs = str_replace_all(mechanism_curated_PMIDs, fixed(" "), "")) %>% 
  mutate(`Allelic requirement` = str_replace(`Allelic requirement`, "aut", "autosomal")) %>% 
  mutate(`Allelic requirement` = str_replace(`Allelic requirement`, "^\\w{1}", tolower)) %>% 
  mutate(`Allelic requirement` = if_else(is.na(`Allelic requirement`),Inheritance,`Allelic requirement`)) %>% 
  mutate(`Allelic requirement` = case_when(`Allelic requirement` == "AD" ~ "Monoallelic_autosomal",
                                           `Allelic requirement` == "AR" ~ "Biallelic_autosomal",
                                           T ~ `Allelic requirement`)) %>% 
  mutate(Gene_disease_validity = tolower(Gene_disease_validity)) %>%
  
  mutate(conseq_flag = "") %>% 
  mutate(review = "") %>% 
  
  mutate(cc_mod_requires_heterozygosity = case_when(requires_heterozygosity=="T" ~ "requires heterozygosity",T ~ "")) %>% 
  mutate(cc_mod_de_novo = case_when(de_novo=="T" ~ "typically de novo",T ~ "")) %>% 
  mutate(cc_mod_mosaic= case_when(mosaic=="T" ~ "typically mosaic",T ~ "")) %>% 
  mutate(cc_mod_age_related_penetrance = case_when(age_related_penetrance=="T" ~ "typified by age related penetrance",T ~ "")) %>% 
  mutate(cc_mod_reduced_penetrance = case_when(reduced_penetrance=="T" ~ "typified by reduced penetrance",T ~ "")) %>% 
  mutate(cc_mod_imprinting= case_when(requires_heterozygosity=="T" ~ "imprinted",T ~ "")) %>% 
  unite(cc_mod ,cc_mod_requires_heterozygosity,cc_mod_de_novo,cc_mod_mosaic,cc_mod_age_related_penetrance,cc_mod_reduced_penetrance,cc_mod_imprinting,sep=",") %>% 
  mutate(cc_mod =  gsub('(,)+',',',cc_mod)) %>% 
  mutate(cc_mod =  if_else(startsWith(cc_mod, ',') , str_sub(cc_mod, start = 2),cc_mod )) %>% 
  mutate(cc_mod =  if_else(endsWith(cc_mod, ',') , str_sub(cc_mod, end = -2),cc_mod )) %>% 
  
  mutate(csq_conseq_altered_product_structure = case_when(conseq_altered_product_structure=="T" ~ "altered_gene_product_structure",T ~ "")) %>% 
  mutate(csq_conseq_absent_product = case_when(conseq_absent_product=="T" ~ "absent_gene_product",T ~ "")) %>% 
  mutate(csq_conseq_increased_product_level = case_when(conseq_increased_product_level=="T" ~ "increased_gene_product_level",T ~ "")) %>% 
  mutate(csq_conseq_decreased_product_level = case_when(conseq_decreased_product_level=="T" ~ "decreased_gene_product_level",T ~ "")) %>% 
  mutate(csq_conseq_unspecified_change_level = case_when(conseq_unspecified_change_level=="T" ~ "uncertain",T ~ "")) %>% 
  mutate(csq_conseq_no_effect = case_when(conseq_no_effect=="T" ~ "no_effect",T ~ "")) %>% 
  unite(conseq ,csq_conseq_unspecified_change_level,csq_conseq_decreased_product_level,csq_conseq_absent_product,csq_conseq_increased_product_level,csq_conseq_altered_product_structure,csq_conseq_no_effect,sep = ",") %>% 
  mutate(conseq =  gsub('(,)+',',',conseq)) %>% 
  mutate(conseq =  if_else(startsWith(conseq, ',') , str_sub(conseq, start = 2),conseq )) %>% 
  mutate(conseq =  if_else(endsWith(conseq, ',') , str_sub(conseq, end = -2),conseq )) %>% 
  

  mutate(splice_region_variant   = case_when(splice_region_variant  =="T" ~ "splice_region_variant",T ~ "")) %>% 
  mutate(splice_acceptor_variant = case_when(splice_acceptor_variant=="T" ~ "splice_acceptor_variant",T ~ "")) %>% 
  mutate(splice_donor_variant    = case_when(splice_donor_variant   =="T" ~ "splice_donor_variant",T ~ "")) %>% 
  mutate(start_lost              = case_when(start_lost             =="T" ~ "start_lost",T ~ "")) %>% 
  mutate(frameshift_variant      = case_when(frameshift_variant     =="T" ~ "frameshift_variant",T ~ "")) %>% 
  mutate(stop_gained             = case_when(stop_gained            =="T" ~ "stop_gained",T ~ "")) %>% 
  mutate(stop_lost               = case_when(stop_lost              =="T" ~ "stop_lost",T ~ "")) %>% 
  mutate(missense_variant        = case_when(missense_variant       =="T" ~ "missense_variant",T ~ "")) %>% 
  mutate(inframe_insertion       = case_when(inframe_insertion      =="T" ~ "inframe_insertion",T ~ "")) %>% 
  mutate(inframe_deletion        = case_when(inframe_deletion       =="T" ~ "inframe_deletion",T ~ "")) %>% 
  mutate(`5_prime_UTR_variant`   = case_when(`5_prime_UTR_variant`  =="T" ~ "5_prime_UTR_variant",T ~ "")) %>% 
  mutate(`3_prime_UTR_variant`   = case_when(`3_prime_UTR_variant`  =="T" ~ "3_prime_UTR_variant",T ~ "")) %>% 
  mutate(synonymous_variant      = case_when(synonymous_variant     =="T" ~ "synonymous_variant",T ~ "")) %>% 
  mutate(intron_variant          = case_when(intron_variant         =="T" ~ "intron_variant",T ~ "")) %>% 
  unite(var_class,splice_region_variant,splice_acceptor_variant,splice_donor_variant,start_lost,frameshift_variant,stop_gained,stop_lost,missense_variant,
        inframe_insertion,inframe_deletion,`5_prime_UTR_variant`,`3_prime_UTR_variant`,synonymous_variant,intron_variant, sep = ",") %>% 
  mutate(var_class =  gsub('(,)+',',',var_class)) %>% 
  mutate(var_class =  if_else(startsWith(var_class, ',') , str_sub(var_class, start = 2),var_class )) %>% 
  mutate(var_class =  if_else(endsWith(var_class, ',') , str_sub(var_class, end = -2),var_class )) %>% 
  
  mutate(Disease_grouping = str_replace_all(Disease_grouping,"_"," ")) %>% 
  mutate(phenotypes = "") %>% 
  mutate(public_comment = "") %>% 
  mutate(across(c("mechanism_curated_PMIDs","cc_mod","conseq","var_class","Allelic requirement"),~ if_else(Ware_Mechansim_curation=="No" & !(Gene_disease_validity== "definitive"),"",.)))


  


# (splice_acceptor_variant predicted to undergo NMD)
# (splice_acceptor_variant predicted to escape NMD)
# (splice_donor_variant predicted to undergo NMD)
# (splice_donor_variant predicted to escape NMD) 
# (frameshift_variant predicted to undergo NMD)
# (frameshift_variant predicted to escape NMD) 
# (stop_gained predicted to undergo NMD)
# (stop_gained predicted to escape NMD)
# 
# (gain of upstream Start [uORF])
# (gain of upstream Start [oORF])
# (Stop lost [uORF])
# (Stop lost [oORF])
# (Start lost [uORF])
# (Frameshift [uORF])
# (Frameshift [oORF])
# (Stop gained [uORF])
# 
# regulatory_region_variant
# intergenic_variant
# structural_variant
# exon_loss
# transcript_ablation
  


CG2P_edit_format <- CG2P_edit %>% 
  select("mechanism curation" = Ware_Mechansim_curation,
         "gene symbol" = Gene,
         "gene mim" = Gene_MIM,
         "disease name" = Disease,
         "disease accession (OMIM or MONDO)" = Disease_ID,
         "confidence category" = Gene_disease_validity,
         "allelic requirement" = `Allelic requirement`,
         "cross cutting modifier" = cc_mod,
         "mutation consequence" = conseq,
         "mutation consequences flag" = conseq_flag,
         "variant classes" = var_class,
         "phenotypes" = phenotypes,
         "organ specificity list" = G2P_organ_specificity_list,
         "pmids" = mechanism_curated_PMIDs,
         "panel" = G2P_panel,
         "private_comment" = mechanism_curation_notes,
         "other disease names" = Disease_grouping,
         "add after review" = review,
         "public comment" = public_comment,
         "referral indication" = Referral_indication_disease,
         "expert review" = Expert_approved,
         "expert review date" = Expert_date
  ) %>% 
  replace(is.na(.),"") %>% 
  mutate(across(private_comment, ~str_replace(.,"NA","")))



write.xlsx(CG2P_edit_format, "CardiacG2P_format_202202.xlsx",overwrite = T)











