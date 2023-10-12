# Gene2Phenotype Cardiac Gene Panel

[![DOI](https://zenodo.org/badge/259775533.svg)](https://zenodo.org/badge/latestdoi/259775533)

## Overview
- CardiacG2P is an evidence-based dataset for inherited cardiac condition gene disease pairs. Each dataset entry annotates a disease with an allelic requirement, information pertaining to disease mechanism (represented as a disease-associated variant consequence), and known disease-relevant variant classes at a defined locus. This dataset is compatible with the existing G2P Ensembl Variant Effect Predictor plugin to support automated filtering of genomic variants accounting for inheritance pattern and mutational consequence. 
- This dataset is also available through G2P https://www.ebi.ac.uk/gene2phenotype

## Files in this repo
 - CardiacG2P.csv ~ Contains all raw cardiac data and genes with narrative summaries in a csv file format.
 - Cardiac_G2P_curations.Rmd ~ R markdown document to read the raw data in the CardiacG2P.csv file and generate the reports.
 - Cardiac_G2P_curations.html ~ The rendered report in a html file format.
 - Cardiac_G2P_curations.md ~ The rendered report in a markdown file format.

## How to use
The easiest way to regenerate the html or the markdown reports locally would be to clone the repository and simply knit the `Cardiac_G2P_curations.Rmd` file in Rstudio  

## Terminology
Inheritance, allelic requirement, and disease-associated variant consequences (as a proxy for disease mechanism), are described using previously agreed standardised terms developed by the GenCC.
More information is available at https://clinicalgenome.org/, https://thegencc.org/ and https://www.medrxiv.org/content/10.1101/2023.03.30.23287948v1

## License
The data provided here is available under the ODC Open Database License (ODbL) : you are free to share and modify the data provided here as long as you attribute any public use of the database, or works produced from the database; keep the resulting data-sets open; and offer your shared or adapted version of the dataset under the same ODbL license.

## Citation
https://www.medrxiv.org/content/10.1101/2023.04.03.23287612v1
