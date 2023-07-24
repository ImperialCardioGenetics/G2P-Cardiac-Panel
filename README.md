# G2P-Cardiac-Panel
Gene2Phenotype Cardiac Gene Panel

Files in this repo:
 - CardiacG2P_Additional_File4.csv ~ Contains all raw cardiac data and genes with Naratives in a csv file format.
 - CardiacG2P_Additional_File4.xlsx ~ Contains all raw cardiac data and genes with Naratives in an excel file format.

 - Cardiac_G2P_curations.Rmd ~ R markdown document to process the raw cardiac data in the CardiacG2P_Additional_File4.csv file and generate the rendered report for publication.
 - Cardiac_G2P_curations.html ~ The rendered report in a html file format.
 - Cardiac_G2P_curations.md ~ The rendered report in a markdown file format.



## Terminology

### Gene disease validity (ClinGen)
Category ~ Description
 - DEFINITIVE ~ The role of this gene in this particular disease has been repeatedly demonstrated in both the research and clinical diagnostic settings and has been repeatedly demonstrated in both the research and clinical diagnostic settings, and has been upheld over time (at least 2 independent publication over 3 years' time). No convincing evidence has emerged that contradicts the role of the gene in the specified disease. (previously labelled as confirmed).
 - STRONG ~ The role of this gene as a monogenic cause of disease has been repeatedly and independently demonstrated providing very strong convincing evidence in humans and no conflicting evidence for this gene's role in this disease. (previously labelled as probable)
 - MODERATE ~ There is moderate evidence in humans to support a casual role for this gene in this disease with no contradictory eveidence. The body of evidence is not large (e.g possibly only one key paper) but appears convincing enough that the gene-disease pair is likely to be validated with additional evidence in the near future.
 - LIMITED ~ Little human evidence exists to support a casual role for this gene in this disease, but not all evidence has been refuted. For example, there may be a collection of rare missense variants in humans but without convincing functional impact, segegration data that could either arise by chance (e.g across one or two meioses) or does not implicate a single gene, or functional data without direct recapitulation of the phenotype. Overall, the body of evidence does not meet contemporary criteria for claiming a valid association with disease. The majority are probably false associations. (previously labelled as possible).

### Allelic requirement
Category 
 - Autosomal dominant ~ Monoallelic autosomal
 - Autosomal recessive ~ "Biallelic autosomal
 - Autosomal dominant; Autosomal recessive ~ Monoallelic autosomal; Biallelic autosomal
 - Autosomal recessive; Autosomal dominant ~ Biallelic autosomal; monoallelic autosomal
 - X-linked recessive ~ "Monoallelic X hemizygous
 - X-linked dominant ~ "Monoallelic X heterozygous


### Disease-associated variant consequence
 - "Decreased gene product level; altered gene product sequence"
 - "Altered gene product sequence"
 - "Absent gene product level; altered gene product sequence"
 - "Decreased gene product level; Altered gene product sequence"
 - "Absent gene product level"  


### Variant classes reported with evidence of pathogenicity

The specific variant classes previously reported in the literature.
More information about these terms can be found on the Sequence ontology website.
http://www.sequenceontology.org/

 - splice_region_variant
 - splice_acceptor_variant
 - splice_donor_variant
 - frameshift_variant_NMD_triggering
 - stop_gained_NMD_triggering
 - missense_variant
 - inframe_insertion
 - inframe_deletion
 - missense_variant
 - exon_loss_variant
 - splice_donor_variant_NMD_triggering
 - splice_acceptor_variant_NMD_triggering
 - splice_donor_variant_NMD_triggering
 - frameshift_variant_NMD_triggering
 - splice_acceptor_variant
 - frameshift_variant
 - stop_gained
 - tandem_duplication
 - duplication
 - complex_structural_alteration
 - inframe_deletion,stop_gained_NMD_escaping
 - stop_gained_NMD_escaping
 - splice_donor_variant
 - deletion
 - frameshift_variant_NMD_escaping,missense_variant,inframe_deletion
 - transcript_ablation
 - splice_acceptor_variant_NMD_escaping
 - stop_gained_NMD_triggering
 - frameshift_variantvariant
 - splice_donor_variant_NMD_escaping
 - stop_gained
 - splice_acceptor_variant_NMD_escaping
 - frameshift_variant_NMD_escaping
 - stop_lost
 - stop_gained_NMD_escaping
 - start_lost
 - copy_number_variation
 - frameshift_variant_NMD_escaping
 - trinucleotide_repeat_expansion
