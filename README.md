# Gene2Phenotype Cardiac Gene Panel

The Cardiac Gene2Phenotype webpage is hosted in
https://imperialcardiogenetics.github.io/G2P-Cardiac-Panel/

## Overview
CardiacG2P is an evidence-based dataset for inherited cardiac condition gene disease pairs. Each entry annotates a disease-associated gene with information about the gene-disease relationship, including the inheritance mode and allelic requirement, information pertaining to disease mechanism (represented as a disease-associated variant consequence), and known disease-relevant variant classes at a defined locus.
This dataset is also available through G2P https://www.ebi.ac.uk/gene2phenotype

## Files in this repo
 - Cardiac_G2P.csv ~ Contains all raw cardiac data and genes with narrative summaries in a csv file format.
 - Cardiac_G2P.Rmd ~ R markdown document to read the raw data in the CardiacG2P.csv file and generate the reports.

## Terminology
Inheritance, allelic requirement, and disease-associated variant consequences (as a proxy for disease mechanism), are described using previously agreed standardised terms developed by the GenCC.
More information is available at https://clinicalgenome.org/, https://thegencc.org/ and https://www.medrxiv.org/content/10.1101/2023.03.30.23287948v1

## Predicted functional consequence

Using the framework produced by Roberts et al<sup>1</sup> (see Tables 2 and 3), it is possible to infer which novel variant classes may be relevant given the high-level disease associated variant consequence term(s) assigned to a gene-disease pair.

For example, if most known pathogenic variants for disease A were 'stop_gained' which has a likelihood score of '*5:almost always*' for 'decreased gene product level' and 'absent gene product', we could then infer that a novel variant of a class that also has a high likelihood (*4:probable* or *5:almost always*) for 'decreased gene product level' or 'absent gene product' (e.g. frameshift_variant_NMD_triggering), could reasonably be included in filters for relevant variants.

Variant classes with a likelihood score of '*3:possible*', '*4:probable*' and '*5:almost always*' for the different disease associated variant consequences are given below 


*<sup>1</sup>Roberts AM, DiStefano MT, Riggs ER, Josephs KS, Alkuraya FS, Amberger J, Amin M, Berg JS, Cunningham F, Eilbeck K, Firth HV, Foreman J, Hamosh A, Hay E, Leigh S, Martin CL, McDonagh EM, Perrett D, Ramos EM, Robinson PN, Rath A, Sant DW, Stark Z, Whiffin N, Rehm HL, Ware JS. Toward robust clinical genome interpretation: Developing a consistent terminology to characterize Mendelian disease-gene relationships-allelic requirement, inheritance modes, and disease mechanisms. Genet Med. 2024 Feb;26(2):101029.* <https://doi.org/10.1016/j.gim.2023.101029>

## License
The data provided here is available under the ODC Open Database License (ODbL) : you are free to share and modify the data provided here as long as you attribute any public use of the database, or works produced from the database; keep the resulting data-sets open; and offer your shared or adapted version of the dataset under the same ODbL license.

## Citation
*Josephs, K.S., Roberts, A.M., Theotokis, P. et al. Beyond gene-disease validity: capturing structured data on inheritance, allelic requirement, disease-relevant variant classes, and disease mechanism for inherited cardiac conditions. Genome Med 15, 86 (2023).* <https://doi.org/10.1186/s13073-023-01246-8>
