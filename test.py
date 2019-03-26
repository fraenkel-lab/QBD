from pybedtools import BedTool

genes = BedTool('./data/gencode.v29.chr_patch_hapl_scaff.annotation.gtf.gz')
snps = BedTool('./data/CGND-HDA-01332.haplotypeCalls.er.raw.vcf.gz')

exonic_snps = genes.intersect(snps)
