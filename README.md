# G2P-Cardiac-Panel
Gene2Phenotype Cardiac Gene Panel

Files in this repo:
 - The CardiacG2P_master.csv which contains all cardiac genes. Confidential/Unfiltered. Cannot be shared
 - A script to filter the master file to only completed genes that can be shared
 - The CardiacG2P.csv which is the curated/filtered/formated file to be used in the VEP G2P plugin


```
CVS export:
One gene-disease pair can have multiple annotations of allelic requirement and mutation
consequence pairs. We export one row for each pair of allelic requirement and mutation
consequence. The header fields are:  
  - gene symbol:                  HGNC gene symbol 
  - gene mim:                     OMIM number for a gene entry
  - disease name:                 Name provided by the curator
  - disease mim:                  OMIM number for a disease entry
  - disease confidence:           One value from the list of possible categories: both DD and IF, confirmed, possible, probable
  - allelic requirement:          comma-separated list of allelic requirement attributes. Possible values are: biallelic, monoallelic (Y),
                                  imprinted, uncertain, monoallelic, hemizygous, x-linked dominant, x-linked over-dominance, mosaic,
                                  mitochondrial, digenic 
  - mutation consequence:         One value from the list of possible consequences: 5_prime or 3_prime UTR mutation, activating,
                                  all missense/in frame, cis-regulatory or promotor mutation, dominant negative, increased gene dosage,
                                  loss of function, part of contiguous gene duplication, part of contiguous genomic interval deletion, uncertain
  - phenotypes:                   semicolon-separated list of HPO (http://www.human-phenotype-ontology.org/) IDs
  - organ specificity list:       semicolon-separated list of organs
  - pmids:                        semicolon-separated list of PMIDs 
  - panel:                        G2P panel: Cancer, Cardiac, DD, Ear, Eye or Skin
  - prev symbols:                 Symbols previously approved by the HGNC for this gene
  - hgnc id:                      HGNC identifier
  - gene disease pair entry date: Entry date for the gene disease pair into the database
  
  ```
