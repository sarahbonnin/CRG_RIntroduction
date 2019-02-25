<h2>Input / Output</h2>

We will learn how to:
* Read in a file
* Write out a file
* Save a graph in a file (Module 3)

<h3>On vectors</h3>

* Read a file as a vector with the **scan** function

```{r}
# Read in file
scan(file="file.txt")
# Save in  object
k <- scan(file="file.txt")
```

By default, scans "double" (numeric) elements: it fails if the input contains characters.<br>
If non-numeric, you need to specify the type of data contained in the file: 

```{r}
# specify the type of data to scan
scan(file="file.txt", 
	what="character")
scan(file="~/file.txt", 
	what="character")
```

Regarding paths of files:<br>
If the file is not in the current directory, you can provide a full or relative path. For example, if located in the home directory, read it as:

```{r}
scan(file="~/file.txt", 
	what="character")
```

* Write the content of a vector in a file:

```{r}
# create a vector
mygenes <- c("SMAD4", "DKK1", "ASXL3", "ERG", "CKLF", "TIAM1", "VHL", "BTD", "EMP1", "MALL", "PAX3")
# write in a file
write(x=mygenes, 
	file="gene_list.txt")
```

Regarding paths of files:<br>
When you write a file, you can also specify a full or relative path:

```{r}
# Write to home directory
write(x=mygenes,
        file="~/gene_list.txt")
# Write to one directory up
write(x=mygenes,
        file="../gene_list.txt")
```


<h3>On data frames or matrices</h3>

* Read in a file into a data frame with the **read.table** function:

```{r}
a <- read.table(file="file.txt")
```

You can convert it as a matrix, if needed, with:

```{r}
a <- as.matrix(read.table(file="file.txt"))
```


Useful arguments:

<a href="https://sbcrg.github.io/CRG_RIntroduction/images/readtable.png"><img src="images/readtable.png" width="5500/"></a>

* Write a data frame or matrix to a file:

```{r}
write.table(x=a,
	file="file.txt")
```

Useful arguments:

<a href="https://sbcrg.github.io/CRG_RIntroduction/images/readtable.png"><img src="images/writetable.png" width="550/"></a>


> Go to [Exercise 6](https://sbcrg.github.io/CRG_RIntroduction/exercise6): Input and Output !
<br>
> [back to home page](https://sbcrg.github.io/CRG_RIntroduction)

