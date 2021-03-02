---
title: Module 2 - Working with Data Part 1
author: Vikram Chhatre & Braveen Joseph
date: February 24, 2021
---


## 1. Generating Data Within R

Last time, we saw several examples of creating some trivial examples of data
creation in R, such as month series, numbers from 1 through 12 etc. We can do
much more within R using an array of advanced functions that R provides. Below,
let's try out some of these functions.


### 1.1 Generating sequence of numbers using ``seq``


- Generate a sequence of 100 consecutive numbers

```r
seq(100)

  [1]   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18
 [19]  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34  35  36
 [37]  37  38  39  40  41  42  43  44  45  46  47  48  49  50  51  52  53  54
 [55]  55  56  57  58  59  60  61  62  63  64  65  66  67  68  69  70  71  72
 [73]  73  74  75  76  77  78  79  80  81  82  83  84  85  86  87  88  89  90
 [91]  91  92  93  94  95  96  97  98  99 100

```

```r
seq(1001, 1050)

 [1] 1001 1002 1003 1004 1005 1006 1007 1008 1009 1010 1011 1012 1013 1014 1015
[16] 1016 1017 1018 1019 1020 1021 1022 1023 1024 1025 1026 1027 1028 1029 1030
[31] 1031 1032 1033 1034 1035 1036 1037 1038 1039 1040 1041 1042 1043 1044 1045
[46] 1046 1047 1048 1049 1050
```

- You can also save these numbers to an object within R's memory.

```r
seq5000 <- seq(1,5000)

length(seq5000)
[1] 5000
```

- The sequence generated does not have to be consecutive. It can be stepped.
  For example, you can generate a sequence that skips one intervening number
(step of 2).

```r
seq(1,10, by=2)

[1] 1 3 5 7 9
```

- Generate a sequence between 0 and 1 in increments of 0.01

```r
seq(0,1,0.01)

  [1] 0.00 0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.10 0.11 0.12 0.13 0.14
 [16] 0.15 0.16 0.17 0.18 0.19 0.20 0.21 0.22 0.23 0.24 0.25 0.26 0.27 0.28 0.29
 [31] 0.30 0.31 0.32 0.33 0.34 0.35 0.36 0.37 0.38 0.39 0.40 0.41 0.42 0.43 0.44
 [46] 0.45 0.46 0.47 0.48 0.49 0.50 0.51 0.52 0.53 0.54 0.55 0.56 0.57 0.58 0.59
 [61] 0.60 0.61 0.62 0.63 0.64 0.65 0.66 0.67 0.68 0.69 0.70 0.71 0.72 0.73 0.74
 [76] 0.75 0.76 0.77 0.78 0.79 0.80 0.81 0.82 0.83 0.84 0.85 0.86 0.87 0.88 0.89
 [91] 0.90 0.91 0.92 0.93 0.94 0.95 0.96 0.97 0.98 0.99 1.00
```

- How long is this vector?

```r
length(seq(0, 1, 0.01))

[1] 101
```

- It seems then that the ``seq`` function has more abilities than we have
  visited here.  How would you learn more about this function?  Use the help
menu.

```r
?seq()
```


### 1.1.1 Exercise

- Generate a sequence of length 100 between -5 and +5.


<br><br><br>

### 1.2 Sampling 

Sampling allows you to draw a sample from a distribution, completely randomly.
For example imagine you are studying bacterial colonies on a petri dish. There
are a thousand colonies and you want to randomly sample 100 of them.

```r
colonies <- c(1:1000)

sample(colonies, 100)

  [1]   60  580 1000  925  666  742  658  121  862  837  240  345  507  559  922
 [16]  285  130  269  523  515  340  841  530   42  606  220  254  786  461  927
 [31]  518  419  221  198  457  160  315  744  704  175  955  931  309  397  405
 [46]  491  592  349  157  844  630  648  542  858   78  241  468  926   97  169
 [61]  579  961  413  146  351  317  547  381  216  919  596   67  443  479  846
 [76]  232  952  483  300  573  190  179  425  788  500  395  954  806  453  835
 [91]  757  296  280  793   84   46  312  633  945  831
```

- Try running this command multiple times and compare answers.  You won't get
  the same result twice. 

- What happens if you try to sample more colonies than there are available?
  Try:

```r
sample(colonies, 1002)

Error in sample.int(length(x), size, replace, prob) : 
  cannot take a sample larger than the population when 'replace = FALSE'
```

- R is complaining that there aren't enough colonies to pick.  But sampling
  allows you to sample with replacement.  What is replacement? Is is the action
of putting your previous selection back in the pot. For example, every time you
sample a colony, you put it back on the petri dish again (not literally).

```r
sample(colonies, 1005, replace=TRUE)

   [1] 320 515 956  58 114 832 460 656 282 952 218 492  36 338 378 925 621 671
  [19]  13 860 427 413 360 698 591 637 741 149 132 436 210  85 180 161 157 512
 ... 
 [991] 461 581 514 503 663 304 576 816 339 102 493 972 677 555   6

```

- Because we are sampling with replacement, we are allowing R to sample the
  same colony more than once. Want to know which colonies are sampled 2x or
more?


```r
sampcol <- sample(colonies, 1005, replace=TRUE)

table(sampcol)

sampcol
   3    4    6    9   10   11   12   13   14   15   16   17   18   20   21   22 
   2    1    3    1    1    2    1    1    2    1    2    2    2    2    3    2 
```

- As you may have guessed, the ``table()`` function counts the number of times
  each element appears in a vector or a matrix.  The first row are the
colonies, the second row represent the number of times that particular colony
appears in our sample.

- You might be wondering how this sampling function can be useful? In
  scientific studies, it is often necessary to ascertain the probability and
confidence intervals of a given outcome from an experiment.  The sampling
function can help you bootstrap your data analysis experiment to test its
statistical reproducibility.

### 1.2.1 Exercise

- Create an R object that is a character vector consisting of one male and one
  female.
- Use the ``sample()`` function to randomly sample (with replacement) a
  population of 5000 zebrafish.
- Store this sample in a separate R object called ``zfish``.
- Count the number of animals belonging to each sex.
- Total time allowed: 3 minutes


<br><br><Br>

### 1.3 ``replicate``, a frequent companion of ``sample``

- As the name suggests, this function allows you to expand an expression.
  Let's try the following examples:

```r
replicate(5, pi) 

[1] 3.141593 3.141593 3.141593 3.141593 3.141593
```

- Here we provided replicate with 2 arguments:

	- ``5``, which is the number of times we want to expand something
	- ``pi``, which is a mathematical constant 


- Of course, the ``pi`` can be replaced with anything, even a character.

```r
replicate(10, "replicate_me")

 [1] "replicate_me" "replicate_me" "replicate_me" "replicate_me" "replicate_me"
 [6] "replicate_me" "replicate_me" "replicate_me" "replicate_me" "replicate_me"
```

- The real strength of replicate comes from its ability to create denovo data
  frames.

- Consider a simulation experiment where you have access to two genotypes:

	- ``wt`` is wild type
	- ``mut`` has a mutation 

- You want to generate 20 populations of 100 individuals each with random
  distribution of wt and mut genotypes.

- First, do the sampling for one population:

```r
gt <- c("wt", "mut")

sample(gt, 100, replace=TRUE)

  [1] "wt"  "wt"  "wt"  "wt"  "mut" "mut" "mut" "wt"  "wt"  "wt"  "wt"  "wt" 
...
 [97] "wt"  "mut" "mut" "mut"
```

- Then use replicate to generate 20 such populations

```r
replicate(20, sample(gt, 100, replace=TRUE))
```

- This is not a small data frame, it has 20 columns each with 100 rows. You had
  better save it to an R object.

```r
pops20 <-  replicate(20, sample(gt, 100, replace=TRUE))
```

- Check the dimensions of the data frame to make sure it is what you expect:

```r
dim(pops20)

[1] 100  20
```

- In the output of ``dim()`` function, the first number is always for rows, and
  second number is for columns. So we are good here.

- What if you wanted to set the names of each populations going from ``pop1``
  to ``pop20``?


```r
colnames(pops20) <- paste("pop", 1:20, sep="")
```

- How about we calculate the total numbers of the two types of genotypes in the
  entire data frame?

```r
table(pops20)

 mut   wt 
 979 1021 
```

- Your answer above will be different because recall that we drew genotypes
  randomly.

- What if you wanted this table function applied to each population separately?
  We can do this using a very simple ``for()`` loop.  A loop iterates over the
conditions set therein and produces the results you want.  

```r
for (i in 1:20){
	print(colnames(pops20)[i])
	print(table(pops20[,i]))
	cat("\n")
}
```

- The output

```r
[1] "pop1"

mut  wt 
 53  47 

[1] "pop2"

mut  wt 
 42  58 


[1] "pop20"

mut  wt 
 50  50 
```

- Finally, you can write this file to the disk


```r
write.table(pops20, "pops20.txt", row.names=F, col.names=T, quote=F, sep='\t')
```



<br><br><br><br>


