# QBD

QBD is a system to **Q**uery **B**y **D**ata.


[Requirements for the system](https://nbviewer.jupyter.org/github/fraenkel-lab/QBD/blob/master/Requirements.ipynb)


### Datasets:
- genomics vcf
- transcriptomics counts
- proteomics counts
- epigenomics peaks



### Use Cases:

1. Find all patients  with mutations in a set of genes {X}.

    Annotate the variants based on their frequency in a control population, likely impact on function, etc.

    Return the list of patients and iPSC lines

    (I imagine this would be a search box on the website, and expect it would be very valuable for people looking for iPSC lines -- it's related to your example I.3)

2. Run all the coding mutations through some or all of the following tools:
    - SIFT
    - PolyPhen
    - GERP++
    - Condel
    - CADD
    - fathmm
    - MutationTaster
    - MutationAssessor
    - GESPA
    - REVEL

    (This list was stolen from a review: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5433009/ )

    Generate a table of the results suitable for further processing

3.
    a. Find all non-coding variants in each patient that overlap with that patient's ATAC-Seq peaks

    b. Generate a consensus set of ATAC-Seq peaks and find the non-coding variants for all patients.

4.
    a. Use output from filters like those in cases 2 and 3 to generate a table of patients vs. variants.

    b. Cluster patients by similarity in variants

    c. Run dimensionality reduction algorithms on this table

