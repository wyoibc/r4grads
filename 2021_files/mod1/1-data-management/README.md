---
title: Module 1 - Data Management and Reproducibility
---

## 1. Download and install a text editor

- If you are on a Mac, get [Macvim](https://github.com/macvim-dev/macvim/releases/tag/snapshot-169)

- If you are on Windows, get [Notepad++](https://notepad-plus-plus.org/downloads/)

<br><br>

## 2. You are working on a project: example_data

- The files you have generated during the course of this project are here:
  [Example Data](Example_Data.zip) (Right click and download to your computer).

- Unzip the archive and take a look inside:

```bash

ls -lh

-rw-------@ 1 vikram  staff   256K Feb 17 07:35 0292.jpg
-rw-------@ 1 vikram  staff   1.1M Feb 17 07:35 SpiGra_K2.png
-rw-------@ 1 vikram  staff    96K Feb 17 07:35 SpiGra_Map.png
-rw-r--r--@ 1 vikram  staff   636B Feb 17 07:47 code.txt
-rw-------@ 1 vikram  staff    89K Feb 17 07:38 trimmed_numreads.png
-rw-r--r--@ 1 vikram  staff   1.3K Feb 17 07:37 trimmed_numreads.txt


```


## 3. Your goal? Write a nicely formatted report to share with your advisor

Here are the steps you will take:

- Open Finder/Windows Explorer and go to the location where the
  ``example_data`` folder is located.

- Rename this folder to ``Skunks_YOUR-FIRST-NAME``

- Create a new file inside this newly renamed folder called: ``README.md``

- Open this file in the text editor
	
	- Notepad++ for Windows
	- Macvim for Mac

- Create content inside this file as follows.


1. Each document needs a preamble, which is simply title of the document,
author's name and date.

```text
---
title: Genomics of Western Spotted Skunks
author: Vikram E. Chhatre
date: February 17, 2021
---
```

2. We will now add a section, which will have some text information, link to a
file and a figure showing results from the analysis.


```text

## 1. Sequencing Quality Control

- Quality control information can be accessed in [this
  file](trimmed_numreads.txt)

<center>
<img src="trimmed_numreads.png" width=500px></img>
</center>


````

3. That's it for now.  After you are done generating the content, save and
close the file. Next we will be uploading this entire folder
(``skunks_YOUR-FIRST-NAME``) to GitHub.



## 3. Git and GitHub

- Git is a program on your computer that keeps track of any changes you make to
 files or folders.  Imagine a project folder like ``skunks_`` that were just
working on.  It may contain a variety of files, such as text files,
spreadsheets, figures, PDF documents etc. When Git is told to start tracking
this project folder, it creates a ``.git`` hidden subdirectory where it stores
all the data on incremental changes you will have made to the project over
time.  

- The strength of this meticulous record keeping is that you can always revert
  to an earlier version of your project should you decide to discard some of
the recently made changes.

- It goes without saying that this also serves as an excellent backup system.


### 3.1 Create New GitHub Repository

- In the following steps, we are going to interact with Git. But before we get
  to that, first [login to your GitHub account](https://github.com) and create
a new repository named after the ``skunks_`` folder you created above. 

- In your GitHub account, there is a ``+`` button at the top right corner.
  Click on it and choose ``New repository``. Your screen should look like this:


<center>
<img src="github1.png" width=700 />
</center>

- After your have filled out the information and made appropriate choices as
  shown, click on ``Create repository``. On the next page, GitHub will provide
you with instructions on how to push your local folder to this newly generated
GitHub repository.


### 3.2 Working with Git

- Navigate in your terminal to the ``skunks_`` folder.  Make sure you are
  actually there using the ``pwd`` command (print working directory).

```bash

cd /Users/vikram/Dropbox/skunks_vikram

pwd

/Users/vikram/Dropbox/skunks_vikram
```

- Check contents of the folder. Your newly created README.md file should be
  there in addition to all the other files.

```bash
ls -l

-rw-------@ 1 vikram  staff   262029 Feb 17 07:35 0292.jpg
-rw-------@ 1 vikram  staff  1201484 Feb 17 07:35 SpiGra_K2.png
-rw-------@ 1 vikram  staff    98341 Feb 17 07:35 SpiGra_Map.png
-rw-r--r--@ 1 vikram  staff      636 Feb 17 07:47 code.txt
-rw-------@ 1 vikram  staff    90778 Feb 17 07:38 trimmed_numreads.png
-rw-r--r--@ 1 vikram  staff     1336 Feb 17 07:37 trimmed_numreads.txt
-rw-r--r--@ 1 vikram  staff	1024 Feb 17 07:45 README.md
```

- Initiate a new git repository inside this folder


```bash
git init

Initialized empty Git repository in /Users/vikram/Drpopbox/skunks_vikram
```

- Ask Git for the status of its record keeping

```bash
git status

On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	0292.jpg
	README.md
	SpiGra_K2.png
	SpiGra_Map.png
	code.txt
	trimmed_numreads.png
	trimmed_numreads.txt
```

- Here Git is telling us that it knows these files exist, but it has not yet
  started keeping track of them.  Let's ask it to do that.

```bash
git add .

git status

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
	new file:   0292.jpg
	new file:   README.md
	new file:   SpiGra_K2.png
	new file:   SpiGra_Map.png
	new file:   code.txt
	new file:   trimmed_numreads.png
	new file:   trimmed_numreads.txt
```


- You will have noticed that the color of the filenames changed from red to
  green after Git was asked to track these files.

- Next, we need to tell git about our newly generated GitHub repository. We
  also need to tell it our GitHub credentials.

```bash
git config user.name "wyoibc"
git config user.email "wyoinbre@gmail.com"
git remote add origin https://github.com/wyoibc/skunks_vikram.git
```

- Make sure Git correctly recorded the above information.

```bash
git config --list

user.name=wyoibc
user.email=wyoinbre@gmail.com
```

```bash
git remote -v

origin	https://github.com/wyoibc/skunks_vikram.git (fetch)
origin	https://github.com/wyoibc/skunks_vikram.git (push)
```


- Finally, we are ready to commit our project for pushing to the GitHub
  repository.

```bash
git commit -m "My first commit"

 7 files changed, 110 insertions(+)
 create mode 100644 0292.jpg
 create mode 100644 README.md
 create mode 100644 SpiGra_K2.png
 create mode 100644 SpiGra_Map.png
 create mode 100644 code.txt
 create mode 100644 trimmed_numreads.png
 create mode 100644 trimmed_numreads.txt
```

```bash
git push -u origin master
```

- After your last command, GitHub should send you a login prompt. Enter your
  username and password (cursor won't move when you are entering the password).
If all goes well, your repository on GitHub should now be populated with all
the files.



