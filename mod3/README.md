---
title: Transcriptome Analysis in R
---


This week we will work with a RNA sequencing data set to analyze patterns of
differential expression of genes from human X chromosome.  This data sets is
described in this publication: [Pertea et al (2016)](data/Pertea_rnaseq_2016.pdf).

The data set itself can be downloaded here (**but you do not need to**):
[chrX_data.tar.gz](ftp://ftp.ccb.jhu.edu/pub/RNAseq_protocol/chrX_data.tar.gz)


<br><br>

## Table of Contents

- [1. Typical RNAseq Analysis Pipeline](#typical-rnaseq-analysis-pipeline)

- [2. Data Access](#data-access)

- [3. Data Cleanup](#data-cleanup)




<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>


## 1. Typical RNAseq Analysis Pipeline

Transcriptomic data from short-read sequencing technologies (e.g. Illumina
HiSeq) is analyzed in the following manner:

1. Obtain sequencing reads from service provider

2. Perform quality control to remove low quality sequencing reads

3. Obtain sequence data for a reference genome

4. Index the reference genome (so it can be efficiently searched for
homologies)

5. Align post-QC sequencing reads to the indexed reference genome

6. Identify transcripts/genes based on their homologies and locations in the
reference genome.

7. Calculate the transcript abundances in each sample under study and prepare a
table of gene and transcript counts.

8. Use regression analysis to determine which genes/transcripts are up and down
regulated.

9. Form hypotheses and test them using the differential expression results.

Because this is a R tutorial, we will not get into analysis steps 1 through 7.
Please consult the publication linked above for the details of those analyses.

We will begin with step #8 above.


## 2. Data Access

In any RNA sequencing experiment, there are two main types of data: genomic and
phenotypic.  The former comes from sequencing and counting transcripts/genes,
and the latter is trait data that will be used to make meaningful inferences
from the results.

### 2.1 Phenotypic Data

<center>
<img src="data/phenotypes.png" width=400>
</center>

The data above can't be copy pasted.  It is an image.  We will need to create
this data frame in R manually.

<br><br>

1. First create 3 vectors

```r
sampid <- c("ERR188245", "ERR188428", "ERR188337", "ERR188401", "ERR188257",
"ERR188383", "ERR204916", "ERR188234", "ERR188273", "ERR188454", "ERR188104",
"ERR188044")


sex <- c(replicate(3, "Female"), replicate(3, "Male"), replicate(3, "Female"),
replicate(3, "Male"))

pop <- c(replicate(6, "GBR"), replicate(6, "YRI"))

```

<br><br>

2. Check to make sure all vectors are of same length

```r
length(sampid)
length(sex)
length(pop)
```


<br><br>

3. Creat a data frame by combining the three vectors as columns:

```r
pheno <- data.frame(sampid, sex, pop)

pheno

      sampid    sex pop
1  ERR188245 Female GBR
2  ERR188428 Female GBR
3  ERR188337 Female GBR
4  ERR188401   Male GBR
5  ERR188257   Male GBR
6  ERR188383   Male GBR
7  ERR204916 Female YRI
8  ERR188234 Female YRI
9  ERR188273 Female YRI
10 ERR188454   Male YRI
11 ERR188104   Male YRI
12 ERR188044   Male YRI
```

<br><br>

### 2.2 Gene Count Data

1. The gene count data for each sample can be downloaded here:
[gene_count_matrix.csv](data/gene_count_matrix.csv).  Once downloaded, import
the data into R:


```r
gc <- read.csv("gene_count_matrix.csv", header=TRUE)
```

2. What are the dimensions of this data frame?

```r
dim(gc)

[1] 2082   13
```

3. Check sample names to make sure they match the ``sampid`` from the ``pheno``
data you created above.

```r
names(gc)

 [1] "gene_id"   "ERR188044" "ERR188104" "ERR188234" "ERR188245" "ERR188257"
 [7] "ERR188273" "ERR188337" "ERR188383" "ERR188401" "ERR188428" "ERR188454"
[13] "ERR204916"

```

- Did you notice that the sample names are not in the same order in ``gc``
  compared to ``pheno``.  This is problematic. The analytical software we are
going to use requires that both files should have the same order for sample
names.  How do we fix this?

- We can either change the order in one or the other file.  In the pheno file,
  the order is appropriate for the analysis, which clearly shows replicates for
each experimental condition.  So we will keep that file as is and change ``gc``
instead.

```r
gc2 <- gc[,c("gene_id", sampid)]
```

- Note what did above.  We already have the correct order of samples in the
  vector ``sampid`` we created earlier.  So we simply substituted it and simply
pre-pended ``gene_id`` to that list.  Check to make sure that the new data
frame shows the data correctly:

```r
head(gc)

               gene_id ERR188044 ERR188104 ERR188234 ERR188245 ERR188257 ERR188273 ERR188337 ERR188383 ERR188401 ERR188428 ERR188454 ERR204916
1  NM_001177465|MAMLD1         0         0         0         0         0         0         0         0         0         0         0         0
2      NR_029427|WDR13         0         0        54       211       204        47       177       165       177       112       169       191
3   NM_001242640|BRCC3       401       495       574       520       614        83       737       304       737       313       358       312
4   NM_001303516|PDZD4         0         0         0         0         0         0         0         0         0         0         0         0
5 NM_001170757|FAM122B       865       470       462         0       271        94       342       295       342       306       403       127
6    NM_001185081|FMR1         0        95         0         0       346         0        82       294        82         0         0         0


head(gc2)

               gene_id ERR188245 ERR188428 ERR188337 ERR188401 ERR188257 ERR188383 ERR204916 ERR188234 ERR188273 ERR188454 ERR188104 ERR188044
1  NM_001177465|MAMLD1         0         0         0         0         0         0         0         0         0         0         0         0
2      NR_029427|WDR13       211       112       177       177       204       165       191        54        47       169         0         0
3   NM_001242640|BRCC3       520       313       737       737       614       304       312       574        83       358       495       401
4   NM_001303516|PDZD4         0         0         0         0         0         0         0         0         0         0         0         0
5 NM_001170757|FAM122B         0       306       342       342       271       295       127       462        94       403       470       865
6    NM_001185081|FMR1         0         0        82        82       346       294         0         0         0         0        95         0
```


- At this point our data sets should be ready for further steps.

<br><br>

## 3. Data Cleanup

- One thing you may have noticed is that we seem to have many genes where there
  is no data for any of the 12 samples.  These are the genes which read ``0``
in each of the 12 columns.  There is essentially no data here, so we need to
get rid of those rows.

```r
gc3 <- gc2[apply(gc2[c(2:13)], 1, function(x) !any(x == 0)),]

dim(gc3)

[1] 656  13

head(gc3)

              gene_id ERR188245 ERR188428 ERR188337 ERR188401 ERR188257 ERR188383 ERR204916 ERR188234 ERR188273 ERR188454 ERR188104 ERR188044
3  NM_001242640|BRCC3       520       313       737       737       614       304       312       574        83       358       495       401
7     NM_001356|DDX3X       203       336       312       312       239        37       129       432        44        32       879       102
13     NM_000489|ATRX      1260      3278      3919      3919      4098      3632      4259      1946      1692      2501      5921      4909
22      NM_000116|TAZ       207       282       562       562       286       389       468       598       130       263       430       432
23    NM_016024|RBMX2      1072      1164      1849      1849      1356      1752      1430      1453       765      1292      1843      1626
28   NR_029635|MIR221         1         2         8         8         5         2         3         3         2         2        10         6
```

- What we did above is to remove rows containing only 0s for columns 2 through
  14 in the data set. But instead of saving it in the same data frame, we sent
output to a new frame called ``gc3``.  We now have 656 rows of data, which
means 1426 rows had no data, so we discarded them.




































<br><br><br><br>
<br><br><br><br>
<br><br><br><br>
<br><br><br><br>
