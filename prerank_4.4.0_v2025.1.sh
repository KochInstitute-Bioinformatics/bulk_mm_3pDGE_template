#!/bin/bash
#SBATCH -N 1                      # Number of nodes. You must always set -N 1 unless you receive special instruction from the system admin
#SBATCH -n 1                      # Number of CPUs. Equivalent to the -pe whole_nodes 1 option in SGE 
#SBATCH --mail-type=END           # Type of email notification- BEGIN,END,FAIL,ALL. Equivalent to the -m option in SGE
#SBATCH --mail-user=charliew@mit.edu  # Email to which notifications will be sent

## Hallmark collection

for i in *.rnk
do
sh /net/bmc-lab3/data/bcc/charliew/gsea_4/GSEA_Linux_4.4.0/gsea-cli.sh GSEAPreranked -rnk $i \
-gmx /net/bmc-lab3/data/bcc/charliew/annotationFiles/v2025/mh.all.v2025.1.Mm.symbols.gmt \
-set_min 5 -set_max 250 \
-rpt_label $i.mh -plot_top_x 40 -nperm 1000
done

## Canonical pathways

for i in *.rnk
do
sh /net/bmc-lab3/data/bcc/charliew/gsea_4/GSEA_Linux_4.4.0/gsea-cli.sh GSEAPreranked -rnk $i \
-gmx /net/bmc-lab3/data/bcc/charliew/annotationFiles/v2025/m2.cp.v2025.1.Mm.symbols.gmt \
-set_min 5 -set_max 250 \
-rpt_label $i.m2cp -plot_top_x 40 -nperm 1000
done

## GO biological process                                                                                                                                                                                 

for i in *.rnk
do
sh /net/bmc-lab3/data/bcc/charliew/gsea_4/GSEA_Linux_4.4.0/gsea-cli.sh GSEAPreranked -rnk $i \
-gmx /net/bmc-lab3/data/bcc/charliew/annotationFiles/v2025/m5.go.bp.v2025.1.Mm.symbols.gmt \
-set_min 5 -set_max 250 \
-rpt_label $i.m5bp -plot_top_x 40 -nperm 1000
done

## Immune collection

# for i in *.rnk
# do
# sh /net/bmc-lab3/data/bcc/charliew/gsea_4/GSEA_Linux_4.4.0/gsea-cli.sh GSEAPreranked -rnk $i \
# -gmx /net/bmc-lab3/data/bcc/charliew/annotationFiles/v2025/m7.all.v2025.1.Mm.symbols.gmt \
# -set_min 5 -set_max 250 \
# -rpt_label $i.m7 -plot_top_x 40 -nperm 1000
# done
