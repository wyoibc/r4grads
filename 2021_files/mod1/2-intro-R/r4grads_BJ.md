---
title: 1. Introduction to R Environment
author: Braveen B. Joseph and Vikram Chhatre
date: February 17, 2021
---
<br>

# 1. What is R?

R is an open source, statistical data analysis and visualization program.  It is also a computer programming language. There are many proprietary software programs that can be used for statistical data analysis, such as, ``Minitab``,``SPSS``, ``SAS`` and ``MATLAB``.  Most such programs cost money, even though it may or may not go out of your own pocket.  These programs are also closed-source meaning that the computer code that is needed to make these programs work is usually a closely held secret and the end users are not privy to it.  This stifles innovation.

In contrast, the entire R programming language is open source. Scientists and programmers believe that this allows for and encourages further innovation.  Because the code is freely available to anyone, it is constantly being modified and improved.  Examples include adding new functionality and removing bugs.  You may not do the same with closed source programs.

When you install the R distribution on your computer, it comes with a range of basic functions, enough to perform basic but wide ranging statistical analyses (think ANOVA, T-test etc.) and then visualize the results (think histograms, scatterplots, barplots etc.).  This suite of functions is together called the base-R distribution.  The latest version of R is 4.0.4.  Each version also gets a name.  Version 4.0.4 is named ``Lost Library Book``. ``R`` was developed by the ``R Foundation for Statistical Computing`` located at [https://r-project.org](https://r-project.org), which provides a great deal of information related to R. 

<hr>


# 2. What is R-Studio?

In it's most simplistic form, R can be run through a terminal which provides the command line interface.  Simply type ``r`` on either Linux, Macintosh or Windows inside a terminal (``CMD`` program in Windows) and R will launch. 

<br>
<center>
<img src="rterminal.png" alt="R inside Terminal" width="600"/>
</center>
<br>

However, not everyone is fond of command line interfaces.  R-Studio exists as a interface bridge between R and you. But that's not the only thing it does.  It is an extremely feature rich GUI program that brings you enhanced functionality to use R.  

If you think of R as the backbone then R-Studio provides a graphical user interface to interact with that backbone. When you launch R-Studio, it automatically detects the R software installed on your computer and interfaces with it.  Let's take a look at the R interface to become familiar with it.

<br>
<center>
<img src="rstudio.png" alt="R Studio Interface" width="800"/>
</center>
<br>



Much of the work you will do will do will happen in the two left panes of R-Studio.  These are 


- ``SOURCE`` which is where you will write your R commands before executing them and 


- ``CONSOLE`` where the execution happens.  The console is the same thing as running R in terminal.


Right panes also can be useful at certain situations.


- ``Environment/History`` shows objects created and commands used in the current R session.


- `` Files/Plots/Packages/Help`` displays plots, packages installed, contains file and help systems


You can always type commands directly in the console without writing them in the source first.  This allows you to test commands out.  When your workflow begins to get more complex, the source comes in handy.

You will get the hang of R-Studio once we start working through it.  The author will explain more features as they become relevant for the task at hand.

<hr>


# 3. Getting Started

We will start with very simple tasks and build on that so that by the end of the day you will have a better idea of what R is capable of.

<br>

### 3.1 Use R as a Calculator

At a very basic level, R can be used as a calculator, both simple and scientific. When performing calculations, basic rules of Maths apply i.e. PEMDAS

- Products before Exponents
- Then Exponents
- Multiply and divide before you add or subtract


Let's try some exercises:

```r
1 + 3

9965/5.33

pi*3^2

(32*8) + (1000/5.2)

log2(7)

exp(log10(2))

sqrt(302500)

sqrt(36)*((51-6)/9)
```


The outcomes are as follows:

```r
1 + 3
[1] 4

9965/5.33
[1] 1869.606

pi*3^2
[1] 28.27433

(32*8) + (1000/5.2)
[1] 448.3077

log2(7)
[1] 2.807355

exp(log10(2))
[1] 1.35125

sqrt(302500)
[1] 550

sqrt(36)*((51-6)/9)
[1] 30
```

- Try out any other combinations you would like.



<br>

### 3.2  Objects in R 

Much of the work in this environment is done by manipulating Objects that are stored in R's memory. You could create you own objects in the R environment or import into the environment from outside. There are many different types of objects that you can store in R's memory. 

There are many different types of objects that you can store in R's memory. The objects can be either singular storing a single number (numeric, or character) or vectors (multiple numbers and/or characters) or large matrices consisting of multiple rows and columns. Here are some simple examples.

**1.Variables**


**2.Vectors**


3.Matrices


There are also some sophisticated data structures, which can make data representation, manipulation and analysis easy.

1.Factors


**2.Data Frames**


3.Lists


4.Array


In this class, we will only focus on objects that are **BOLD**. These are the objects used predominantly in Bio-medical research.

<br>

#### 3.2.1 Variables

To create a variable you use the assignment operator  ``<-`` or ``=``.  Both are interchangeable.  By far in my experience, most people use the first symbol, though nothing says you have to use one of the other.  They are fully equivalent. 

**I would recommend using** ``<-`` **operator to avoid confusion with mathematical equality, and as a good programming practice.**

Think of variable as a folder with a name in front. You can put a anything into it, look at it, manipulate it, and even replace it with something else.

- Let's begin by creating a variable in R through simple assignments:


```r
a <- 8
```

- This stores the number ``8`` into an variable ``a``.  Here is another example:


```r
b <- 22
```

- You can check for any objects that now exist in R's memory with the following:

```r
ls()

[1] "a" "b"
```

- As you can see, both objects are now in R's memory along with their values.

- Note: ``ls`` is a command for listing objects in the working space.  The ``()`` you see after that is part of R syntax.  Every command in R must end with the parentheses.  Although it's not being implemented here, usually one passes various arguments or options to the command inside those parentheses.

- To check their values, simply type their name at their prompt:


```r
a
[1] 8

b
[1] 22
```

-Let's replace the ``a`` variable with another value 

-The expression on the right hand side is evaluated first, then value is assigned to the variable on the right.

```
a <- a+2
```

<br>

#### 3.2.2 Vectors

A Vector is an indexed list of variables. Imagine a vector as a folder with dividers. The folder has a name outside and within it are dividers labeled 1,2,3... so on.Each divider is a simple variable, and its' name is made of, name of the vector and the number of the divider.

For example, the name of the n-th element (n-th divider, in our example of the vector ``x`` is ``x[n]``.


- Now let's create a **Vector**:

- To create a vector greater than a length of 1, we use **function** called **concatenate**.

- The concatanate function is denoted as ``c()``.

- Like mathematical functions, in R functions takes arguments (inputs) and produces outputs.

- There are number of built-in R functions, the name of it is written first, followed by coma separated arguments (inputs) within parentheses.

```r
months <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)

months

 [1]  1  2  3  4  5  6  7  8  9 10 11 12
```

- You could have created this exact same vector another way e.g.


```r
months2 <- 1:12

months2

 [1]  1  2  3  4  5  6  7  8  9 10 11 12
```

- As you can see, there are multiple methods for performing same operations.  The second one took less effort and is smarter.  It also omits the usage of the concatenate function.

- Let's make a **character vector**.


```r
monthsC <- c("January", "February", "March", "April", "May", "June", 
		"July", "August", "September", "October", "November", "December")

monthsC

 [1] "January"   "February"  "March"     "April"     "May"       "June"     
 [7] "July"      "August"    "September" "October"   "November"  "December" 
```

- Pls note that the individual elements in a character vector must be protected by **quotes**. 

<br>

#### 3.2.3 Data Frames

Data frames are 2D objects. A data frame can be created by combining two vectors of equal length.

```r
year <- data.frame(months, monthsC)

year

   months   monthsC
1       1   January
2       2  February
3       3     March
4       4     April
5       5       May
6       6      June
7       7      July
8       8    August
9       9 September
10     10   October
11     11  November
12     12  December
```

You will notice that R nicely formats the objects when printing them to the screen. This is quite useful when you are looking at larger data frames.
<br>

**An overview of R Data structures**

<br>
<center>
<img src="R_ds.jpg" alt="R Data Structures" width="800"/img>
</center>
<br>  
<hr>
<br>

### 3.3 Creating Data Frames

In our last example, we created a data frame that is a combination of character and numeric vector.  But data frames can also be completely numeric, as in the following example:

- Following plot shows the average low and high temperatures (celcius) in Laramie, Wyoming; data obtained from www.weather-us.com.

- Let's create two numerical vectors containing both high and low temps.

<br>
<center>
<img src="laramie.png" alt="laramie_temp" width="800"/img>
</center>
<br>  

```r
larahighC <- c(0.7, 1.8, 6.1, 10.6, 16.4, 22.5, 26.7, 25.5, 20.3, 13.2, 5.2, 0.1)

laralowC <- c(-12.2, -11.2, -7.4, -4.1, 0.9, 5.5, 8.9, 8.2, 3.3, -2.2, -8.1, -12.2)
```

- Now let's make a numeric data frame called ``laratemp`` using these vectors:

```r
laratemp <- data.frame(larahighC, larahighC)

laratemp 

   laralowC larahighC
1     -12.2       0.7
2     -11.2       1.8
3      -7.4       6.1
4      -4.1      10.6
5       0.9      16.4
6       5.5      22.5
7       8.9      26.7
8       8.2      25.5
9       3.3      20.3
10     -2.2      13.2
11     -8.1       5.2
12    -12.2       0.1
```

- Now, let's combine two data frames ``year`` and ``laratemp``with equal number of rows, to make a new one. 

- Note that we are overwriting the ``laratemp`` data frame.


```r
laratemp <- data.frame(year, laratemp)

laratemp

    months   monthsC laralowC larahighC
1        1   January    -12.2       0.7
2        2  February    -11.2       1.8
3        3     March     -7.4       6.1
4        4     April     -4.1      10.6
5        5       May      0.9      16.4
6        6      June      5.5      22.5
7        7      July      8.9      26.7
8        8    August      8.2      25.5
9        9 September      3.3      20.3
10      10   October     -2.2      13.2
11      11  November     -8.1       5.2
12      12  December    -12.2       0.1
```

- The columns ``larahighC`` and ``laralowC`` can one by one as columns.

- Create a new column called ``larahighC`` within the data frame ``year``

```r
year$larahighC <- c(0.7, 1.8, 6.1, 10.6, 16.4, 22.5, 26.7, 25.5, 20.3, 13.2, 5.2, 0.1)
 
year 

    months   monthsC larahighC
1        1   January       0.7
2        2  February       1.8
3        3     March       6.1
4        4     April      10.6
5        5       May      16.4
6        6      June      22.5
7        7      July      26.7
8        8    August      25.5
9        9 September      20.3
10      10   October      13.2
11      11  November       5.2
12      12  December       0.1
```


**Tasks:**

(1) Add a new column called ``laralowC`` in the data frame ``year``.

(2) Create a numeric vector (called ``numdays``) containing number of days in each month (assume leap-year). Addthis vector into the data frame ``year``

(3) Add two new columns called ``larahighF`` and ``laralowF``, by converting **celcius to fahrenheit** in the data frame ``year``.

    - Hint : To do this, multiply the temperature in celcius by ``9/5``, then add the resulting number to 32.  For example, if you were converting 4C to fahrenheit, you would do this:

```r
(4*9/5)+32
```

(4) Reorder the column names in the data frame ``year``, and name the reordered data frame as ``laramieTemp``.

 - Reorder in this order : "months","monthsC","numdays","laralowC","larahighC","laralowF","larahighF"

<br>
<hr>
<br>

### 3.4 Working with Data Frames 


In Bio-medical research most of the data generated and analyzed are in the format of data frames. It will contain both characters and number. ``counts.csv`` is an example data set we will be working from now on. This file contains the number of RNA-Seq reads for each gene, of three *Caenorhabdidits elegans* strains, at 16 hours after hatching. These strains are namely Wild Type (WT), *nekl-2(fd90)* and *nekl-3(gk506)*.

**NOTE :** 
  
  - We are NOT going to analyze this RNA-Seq data. 

  - This file contains only one set of data - No Repeats!!!
           
  - However, we are going to practice some base R functions using this.

R provides functions for reading delimited flat text files i.e. ``.csv`` (comma separated) and ``.txt`` (tab separated).

Let's import the ``counts.csv`` file

```r
counts<- read.csv("counts.csv")
```

- Notice the use of assignment operator i.e. ``<-`` to send information obtained from ``counts.csv``, and then storing it inside the object called ``counts``.  This object name is completely arbitrary.  You could use any name you wish, so long as the name is not the same as one of the R functions and the other stipulation is that it may not begin with a number.

- A quick method for checking what the data in an object looks like is to run the ``head()`` function on it.  For example,

```r
head(counts)

    wormbase_ID  WT nekl.2.fd90. nekl.3.gk506.
1 WBGene00000001 423          515           597
2 WBGene00000002 436          516           541
3 WBGene00000003 214          129           153
4 WBGene00000004 803          924          1158
5 WBGene00000005 159           63            39
6 WBGene00000006 951         1117          1335
```
This function will always display the first six rows of the data set.  

- Header names/ Column names in this data frame is long and can be confusing.

- I would recommend renaming them to make rest of our work less confusing and easy.

Let's rename the header. For this, we will use the function ``names``.

- Enter the new column names within the ``concatanate`` function, and each name between quotes ``""``.

- Look at the ``head()`` again. 

```r
names(counts) <- c("id","wt","nekl2","nekl3")

head(counts)
              id  wt nekl2 nekl3
1 WBGene00000001 423   515   597
2 WBGene00000002 436   516   541
3 WBGene00000003 214   129   153
4 WBGene00000004 803   924  1158
5 WBGene00000005 159    63    39
6 WBGene00000006 951  1117  1335
```

Similarly, you can check the last six rows with the ``tail()`` function.

```r
tail(counts)
                  id wt nekl2 nekl3
46898 WBGene00304202  0     0     1
46899 WBGene00304203  7    17    11
46900 WBGene00304215  3     2     2
46901 WBGene00304219  0     0     0
46902 WBGene00304220  0     2     0
46903 WBGene00304237  5     8    10
```

- Notice how R always formats the data nicely such that the columns are perfectly aligned.  It also always shows the header line, even when you are looking at the bottom of the file only.  

- You might want to check the dimensions of this data frame (i.e. number of columns and rows).

```r
dim(counts)

[1] 46903     4
```

- The first number is for rows and second for columns.  There are 46903 rows and 4 columns in this data.

- If you wanted to check data in other columns and rows that are between those shown by ``head()`` and ``tail()`` functions, R provides multiple ways to do so.  R provides a coordinate system as follows:

	- ``obj[ROW,COL]``

	- For example, let's say you need to view the number of reads in ``wt``,``nekl2`` and ``nekl3`` at the 40th row, then you would type this:

	- ``counts[40,2:4]``

	- In fact, when asking for all columns in a given row, the column call is unnecessary. Instead try this:

	- ``counts[40,]`` which will all the information (including the ``id``) in the 40-th row.

```r
counts[40,]
               id    wt nekl2 nekl3
40 WBGene00000041 10027 15298 18473
```

Let's plot the number of reads for each gene in the Wilde Type strain.

```r
plot(counts$wt)
```
<center>
<img src="wt_reads.png" alt="wt_reads" width="800"/img>
</center>
<br>   

We could also make histograms.

Let's make a histogram of counts from the Wilde Type strain.

```r
hist(count$wt)
```

<br>
<center>
<img src="hist.png" alt="hist" width="800"/img>
</center>
<br>  




We will focus on making advanced plots in the next class

Let's find the highest number of read count in each strain. We will use the function ``max()``
For example, ``nekl2``

```r
max(counts$nekl2)
[1] 220552
```

What is the ``id`` of the gene with highest number of read count in ``nekl2``. For this we will use the function ``subset()``.

```r
subset(counts,nekl2 == 220552) 
                id     wt  nekl2  nekl3
951 WBGene00001168 213336 220552 237027
```

**Tasks:**

1. Create dot plot for ``nekl2`` vs. ``nekl3`` read counts.

  - Change arguments of the ``plot()``, to rename the x,y axis labels and add a title. More info about ``plot()`` function can be found [here](https://www.rdocumentation.org/packages/graphics/versions/3.6.2/topics/plot).


2. Make a histogram of ``nekl3`` read counts, using only the counts from the rows 10000 to 10115.

  - Change arguments of the ``hist()`` function. More info about ``hist()`` function can be found [here](https://www.rdocumentation.org/packages/graphics/versions/3.6.2/topics/hist).
   
3. Find the highest number of read count in each strain. And what is the WormBase_ID that has the highest number of reads?
  
4. How many genes have a read count more than 5000 in each strain?
  - Hint : Use the function ``sum()``.

5. Create a new object called ``nekl2subset``, which will contain only the read counts between 100 and 300 in ``nekl2``.

  - Make a histogram for the read counts in ``nekl2subset``.
  
  - Repeat the same for ``wt`` and ``nekl3``.

6. Worm genes *mlt-10* and *nas-37* are known to be down-regulated in the *nekl-2* and *nekl-3* mutant strains, compared to the Wild Type. Find the read counts for *mlt-10* and *nas-37* in each strain.

    - Hint : WormBase_ID of *mlt-10* : WBGene00015646; WormBase_ID of *nas-37* : WBGene00003553 

<hr>

## 4. Maintaining Your R Installation

There are a few housekeeping tasks you will need to do maintain your R installation on a regular basis.  This involves keeping your base-R version, R-Studio installation as well as various additional packages updated.  Installing a new version of R often breaks existing packages, which would then have to be updated as well.  Updating the R installation is as simple as going to [r-project.org](https://r-project.org) and downloading/installing the latest version.  

<br>


## 5. Getting Help from Fellow R Users

R has become extremely popular as a powerful statistical analysis program in all sectors e.g. academics, industry, government and NGOs.  Consequently, there are a number of websites, forums and mailing lists that are available to you.  When you run into a problem with your code and any R function, chances are that someone has already asked a question about it which has been answered.  Below is a list of resources that you might find helpful.

- [R-Help Mailing List](https://stat.ethz.ch/mailman/listinfo/r-help)

- [Topic Specific Mailing Lists](https://www.r-project.org/mail.html)

- [StackOverFlow.com](https://stackoverflow.com)

- [R-Studio Community](https://community.rstudio.com)

- [Bioconductor Support Forum](https://support.bioconductor.com)

- [Freenode ##r Channel on IRC](https://freenode.net)



<br> <br>


