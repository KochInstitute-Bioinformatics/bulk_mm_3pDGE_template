#!/bin/bash
#SBATCH -N 1                      # Number of nodes. You must always set -N 1 unless you receive special instruction from the system admin
#SBATCH -n 1                      # Number of CPUs. Equivalent to the -pe whole_nodes 1 option in SGE
#SBATCH --mail-type=END           # Type of email notification- BEGIN,END,FAIL,ALL. Equivalent to the -m option in SGE 
#SBATCH --mail-user=charliew@mit.edu  # Email to which notifications will be sent.

module add miniconda3/v4
source /home/software/conda/miniconda3/bin/condainit
conda activate nf-core_v25
module add singularity/3.10.4

nextflow run nf-core/rnaseq -r 3.21.0 -c nextflow.config -profile slurm,singularity \
--input 250430Yil-3pDGE.csv \
--custom_config_base false \
--fasta /net/ostrom/data/bcc/charliew/Genomes/mm39_ens113/Mus_musculus.GRCm39.dna.primary_assembly.fa \
--gtf /net/ostrom/data/bcc/charliew/Genomes/mm39_ens113/Mus_musculus.GRCm39.113.gtf \
--star_index '/net/ostrom/data/bcc/charliew/Genomes/nfcore_rnaseq/mm39_ens113/genome/index/star' \
--salmon_index '/net/ostrom/data/bcc/charliew/Genomes/nfcore_rnaseq/mm39_ens113/genome/index/salmon' \
--rsem_index '/net/ostrom/data/bcc/charliew/Genomes/nfcore_rnaseq/mm39_ens113/genome/rsem' \
--with_umi \
--skip_umi_extract \
--umitools_umi_separator ":" \
--extra_star_align_args "--alignIntronMax 1000000 --alignIntronMin 20 --alignMatesGapMax 1000000 --alignSJoverhangMin 8 --outFilterMismatchNmax 999 --outFilterMultimapNmax 20 --outFilterType BySJout --outFilterMismatchNoverLmax 0.1 --clip3pAdapterSeq AAAAAAAA" \
--multiqc_title 250430Yil \
--aligner 'star_salmon' \
--save_align_intermeds \
--pseudo_aligner 'salmon' \
--skip_stringtie \
--outdir 250430Yil
