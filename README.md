# G2P-Cardiac-Panel
Gene2Phenotype Cardiac Gene Panel

Files in this repo:
 - Generate_G2P_document.Rmd ~ R markdown document to process the raw cardiac data and generate the rendered report for publication.
 - CardiacG2P_Additional_File4.xlsx ~ Contains all raw cardiac data and genes with Naratives.
 - Generate_G2P_document.html ~ The rendered report in html format.
 - Generate_G2P_document.md ~ The rendered report in md format.



## Terminology

### G2P confidence
Category ~ Description
 - Definitive ~ The role of this gene in this particular disease has been repeatedly demonstrated in both the research and clinical diagnostic settings and has been repeatedly demonstrated in both the research and clinical diagnostic settings, and has been upheld over time (at least 2 independent publication over 3 years' time). No convincing evidence has emerged that contradicts the role of the gene in the specified disease. (previously labelled as confirmed).
 - Strong ~ The role of this gene as a monogenic cause of disease has been repeatedly and independently demonstrated providing very strong convincing evidence in humans and no conflicting evidence for this gene's role in this disease. (previously labelled as probable)
 - Moderate ~ There is moderate evidence in humans to support a casual role for this gene in this disease with no contradictory eveidence. The body of evidence is not large (e.g possibly only one key paper) but appears convincing enough that the gene-disease pair is likely to be validated with additional evidence in the near future.
 - Limited ~ Little human evidence exists to support a casual role for this gene in this disease, but not all evidence has been refuted. For example, there may be a collection of rare missense variants in humans but without convincing functional impact, segegration data that could either arise by chance (e.g across one or two meioses) or does not implicate a single gene, or functional data without direct recapitulation of the phenotype. Overall, the body of evidence does not meet contemporary criteria for claiming a valid association with disease. The majority are probably false associations. (previously labelled as possible).

### Confidence value flag
 - requires clinical review	~ A flag added to confidence value to suggest further review by clinicians is required.

### Allelic requirement
Category ~ Description
 - monoallelic_autosomal ~ Plausible disease-causing mutations on an autosomal chromsome identified on one allele in all or the vast majority of with specific disorder.
 - monoallelic_X_hem ~ Plausible disease-causing mutations identified on the X chromosome in a male as a cause of a specific disease, the disorder being predominantly recessive in female carriers.
 - monoallelic_Y_hem ~ Plausible disease-causing mutations identified in an allele found in the Y chromosome. The Y chromsome is passed from father to son as this mutation may affect only males.
 - monoallelic_X_het ~ Plausible disease-causing mutations identified in one copy of the X chromosome in females as a cause of a specific disease, include disorders where heterozygous females and hemizygous males are similarly affected e.g SMC1A mutations.
 - monoallelic_PAR ~ Plausible disease-causing mutations identified in an allele found in the pseudoautosomal regions. Inheritance is not strictly sex-linked.
 - mitochondrial ~ Plausible disease-causing mutations identified on mitochondial DNA where homoplasmy or heteroplasmy are associated with a specific disorder.
 - biallelic_autosomal ~ Plausible disease-causing homozygous or compound heterozygous mutations identified on both alleles in the autosomal chromsome.
 - biallelic_PAR ~ Plausible disease-causing homozygous or compound heterozygous mutations identified on both alleles found in the pseudoautosomal regions Inheritance is not strictly sex-linked.

### Cross cutting modifier
Category ~ Description
 - requires heterozygosity ~ Different variation of the same gene is required. The different mutations are inherited from both parents.
 - typically de novo ~ Plausible disease causing mutations that occur post zygotically (formation of gametes).
 - typically mosaic ~ Plausible disease causing mutations identified on one allele in a proportion of cells with the others being wild-type.
 - typified by age related penetrance ~ Plausible disease causing mutation identified but the expression of the disease may be changed by age.
 - typified by reduced penetrance ~ Plausible disease-causing mutation identified but not all carriers express the related disease phenotype. Also called incomplete penetrance.
 - imprinted ~ Plausible disease-causing mutations identified in one allele in which the allele's parental origin determines the disease/phenotype exhibited.
 - potential IF ~ Plausible disease-causing mutations within, affecting or encompassing the coding region of a single gene identified in multiple (>3) unrelated cases/families with both the relevant disease (RD) and an incidental disorder.

### Mutation consequence
Category ~ Description
 - 5_prime or 3_prime UTR mutation ~ mutations located in the untranslated regions. These regions may change regulatory mechanisms which in turn modify cellular processes and molecular pathways increasing disease risk.
 - altered gene product structure ~ mutations that alter the structure of the gene, changes the expression of the gene causing it to be activated or expressed at higher levels. It also modifies the gene product function.
 - absent gene product ~ Nonsense, frame-shifting indel, essential splice site mutation, whole gene deletion or any other mutation where functional analysis demonstrates clear reduction or loss of function.
 - increased gene product level ~ Mutation that increases the functional dosage of a gene. Increases the expression of the gene.
 - cis-regulatory or promotor mutation ~ Mutation in cis-regulatory elements that lies outwith the known transcription unit and promotor of the controlled gene.
 - decreased gene product level ~ Mutation that decreases the level of transcription of a gene
 - uncertain ~ Where the exact nature of the mutation is unclear or not recorded.

### Mutation consequences flag
Category ~ Description
 - likely to escape nonsense mediated decay ~ A mutation is said to be likely to escape nonsense mediated decay if it follows the following rules
    - Location falls in the last exon of the transcript.
    - Location is in the 50bp towards the end of the second to the last exon.
    - Found in an intronless transcript.
    - Location is in the first 100 base pairs of the coding sequence.
 - part of contiguous gene duplication ~ creates extra copies of gene which may results in different copy numbers of a gene thereby altering gene dosage.
 - part of contiguous genomic interval deletion ~ Changes the DNA sequences depending on the size and location of the deleted sequence in the genome.
 - restricted repertoire of mutations ~ restricted mutation set.
 - activating ~ Mutation usually missense that results in a constituative functional activation of the gene product.
 - dominant negative ~ Mutation within one allele of a gene that creates a significantly greater deleterious effect on gene product function than a monoallelic loss of function mutation.

### Variant consequence

The specific variant classes previously reported as pathogenic in the literature.
More information about these terms can be found on the Sequence ontology website.

- splice_region_variant
- splice_acceptor_variant
- splice_donor_variant
- start_lost
- frameshift_variant
- stop_gained
- stop_lost
- missense_variant
- inframe_deletion
- 5_prime_UTR_variant
- 3_prime_UTR_variant
- synonymous_variant
- intron_variant
- regulatory_region_variant
- intergenic_variant
- inframe_insertion
- NMD_triggering
- NMD_escaping
- stop_gained_NMD_triggering
- stop_gained_NMD_escaping
- splice_donor_variant_NMD_triggering
- frameshift_variant_NMD_triggering
- splice_acceptor_variant_NMD_escaping
- splice_acceptor_variant_NMD_triggering
- splice_donor_variant_NMD_escaping
- frameshift_variant_NMD_escaping
- gain_of_function_variant
- loss_of_function_variant
