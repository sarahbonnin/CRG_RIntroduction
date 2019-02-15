## Exercise 6a. Input / output

Create the script "exercise6.R" and save it to the "Rcourse/Module2" directory: you will save all the commands of exercise 6 in that script.
<br>Remember you can comment the code using #.


<details>
<summary>
correction
</summary>

```{r}
getwd()
setwd("Rcourse/Module2")
setwd("~/Rcourse/Module2")
```

</details>

**1- Download folder "i_o_files" in your current directory with:** 

```{r}
# system invokes the OS command specified by command.
system("svn export https://github.com/sbcrg/CRG_RIntroduction/trunk/i_o_files")
```

All files that will be used for exercise 6 are found in the **i_o_files** folder ! 

**2- Read in the content of ex6a_input.txt using the scan command; save in object z**

How many elements are in z?

<details>
<summary>
correction
</summary>

```{r}
# scan content of the file
z <- scan("i_o_files/ex6a_input.txt")
# number of elements (length of vector)
length(z)
```

</details>

**3- Sort z and save the sorted vector in zsorted.**

<details>
<summary>
correction
</summary>

```{r}
zsorted <- sort(z)
```

</details>

**4- Write zsorted content into file ex6a_output.txt.**

<details>
<summary>
correction
</summary>

```{r}
write(zsorted, "ex6a_output.txt")
```

</details>

**5- Check the output. Save the content of zsorted again but this time setting the argument "ncolumns" to 1: how is it different?**

<details>
<summary>
correction
</summary>

```{r}
write(zsorted, "ex6a_output.txt", ncolumns=1)
```

</details>

## Exercise 6b - I/O on data frame: play with the arguments of read.table
  
**1- field separator**

* Read ex6b_IO_commas_noheader.txt in object fs.
What are the dimensions of fs?

<details>
<summary>
correction
</summary>

```{r}
# read in file with default parameters
fs <- read.table("i_o_files/ex6b_IO_commas_noheader.txt")
dim(fs)
```

</details>

* Fields/columns are separated by commas: change the default value of the "sep" argument and read in the file again.
What are now the dimensions of fs?

<details>
<summary>
correction
</summary>

```{r}
# change field separator to ","
fs <- read.table("i_o_files/ex6b_IO_commas_noheader.txt", sep=",")
dim(fs)
```

</details>

**2- field separator + header**

* Read ex6b_IO_commas_header.txt in object fs_c.
What are the dimensions of fs_c ?

<details>
<summary>
correction
</summary>

```{r} 
fs_c <- read.table("i_o_files/ex6b_IO_commas_header.txt")
dim(fs_c)
```

</details>

* Change the default field separator.

<details>
<summary>
correction
</summary>

```{r}
fs_c <- read.table("i_o_files/ex6b_IO_commas_header.txt", 
                   sep=",")
```

</details>

* The first row should to be the header (column names): change the default value of the header parameter and read in the file again.
What are now the dimensions of fs_c ?

<details>
<summary>          
correction
</summary>

```{r}
fs_c <- read.table("i_o_files/ex6b_IO_commas_header.txt", 
                   sep=",", 
                   header=TRUE)
```

</details>

**3- skipping lines**

* Read ex6b_IO_skip.txt in object sk.


<details>
<summary>          
correction
</summary>

```{r}
sk <- read.table("i_o_files/ex6b_IO_skip.txt")
```

</details>

Is R complaining ?<br>
 
Check "manually" the file (in the R Studio file browser).<br>

* The skip argument allows you to ignore one or more line(s) before reading in a file. Introduce this argument and read the file again.
What are now the dimensions of sk?

<details>
<summary>
correction
</summary>

```{r}
sk <- read.table("i_o_files/ex6b_IO_skip.txt",
                 skip=2)
dim(sk)
```

</details>

* Change the default field separator.
What are now the dimensions of sk?

<details>
<summary>
correction
</summary>

```{r}
sk <- read.table("i_o_files/ex6b_IO_skip.txt",
                 skip=2,
                 sep=",",
                 header=T)
```

</details>

**4- Comment lines**

* Read ex6b_IO_comment.txt in object cl.

<details>
<summary>        
correction       
</summary>       

```{r}
cl <- read.table("i_o_files/ex6b_IO_comment.txt")
```

</details>

Is R complaining again ? Check manually the file and try to find out what is wrong.<br>

Adjust the comment.char argument and read the file again.

<details>
<summary>        
correction       
</summary>        

```{r}
cl <- read.table("i_o_files/ex6b_IO_comment.txt",
                 comment.char = "*")
```

</details>

* Adjust also the header and sep arguments to read in the file correctly.
What are now the dimensions of cl?

<details>
<summary>        
correction       
</summary>        

```{r}
cl <- read.table("i_o_files/ex6b_IO_comment.txt",
                 comment.char = "*",
                 sep=",",
                 header=TRUE)
dim(cl)
```

</details>

**4- final**

* Read ex6b_IO_final.txt in object fin.

<details>
<summary>
correction
</summary>

```{r}
fin <- read.table("i_o_files/ex6b_IO_final.txt")
```

</details>

* Adjust the appropriate parameters to obtain the data frame "fin" of dimensions 167 x 4.

<details>
<summary>
correction
</summary>

```{r}
fin <- read.table("i_o_files/ex6b_IO_final.txt",
                  sep=",",
                  header=TRUE,
                  skip=3,
                  comment.char="&"
                  )
```

</details>

## Exercice 6c - I/O on a data frame

**1- Read in file ex6c_input.txt in ex6 object**

Warning: the file has a header !
<br>
Check the structure of ex6 (remember the **str** command).

<details>
<summary>         
correction        
</summary>

```{r}
ex6 <- read.table("i_o_files/ex6c_input.txt", 
                  header=TRUE)
str(ex6)
```

</details>


**2- Now read in the same file but, this time, set the argument as.is to TRUE.**

Check again the structure: what has changed ?

<details>
<summary>         
correction        
</summary>

```{r}
ex6 <- read.table("i_o_files/ex6c_input.txt", 
                  header=TRUE,
                  as.is=TRUE)
str(ex6)
```

</details>

**3- What are the column names of ex6 ?**

<details>
<summary>         
correction        
</summary>

```{r}
colnames(ex6)
```

</details>

**4- Name the first column of ex6 "Country".**

<details>
<summary>
correction
</summary>

```{r}
# extract all column names of ex6
colnames(ex6)
# extract the name of the first column only
colnames(ex6)[1]
# reassign name of the first column only
colnames(ex6)[1] <- "Country"
```

</details>

**5- How many countries are in the Eurozone, according to ex6 ?**

<details>
<summary>
correction
</summary>

```{r}
table(ex6$Eurozone)
```

</details>

**6- In the Eurozone column: change "TRUE" with "yes" and "FALSE" with "no".**

<details>
<summary>
correction
</summary>

```{r}
# select the Eurozone column
ex6$Eurozone
# elements of the Eurozone column that are exactly TRUE
ex6$Eurozone==TRUE
# extract actual values that are TRUE
ex6$Eurozone[ex6$Eurozone==TRUE
# reassign all elements that are TRUE with "yes"
ex6$Eurozone[ex6$Eurozone==TRUE] <- "yes"
# same with FALSE
ex6$Eurozone[ex6$Eurozone==FALSE] <- "no"
```

</details>

**7- In the column Country: how many country names from the list contain the letter "c" ?**

Remember the grep function. Check the help page.

<details>
<summary>
correction
</summary>

```{r}
grep("c", ex6$Country, ignore.case = TRUE)
grep("c", ex6$Country, value=TRUE, ignore.case = TRUE)
```

</details>

**8- How many people live, according to that table:**

+ in the European union (whole table) ?
+ in the Eurozone ?

<details> 
<summary> 
correction
</summary>
  
```{r}
# sum the whole population column
sum(ex6$Population)
# select elements of ex6 where Eurozone is "yes"
ex6$Eurozone == "yes"
# select only elements in Population for which the corresponding Eurozone elements are "yes"
ex6$Population[ex6$Eurozone == "yes"]
# sum that selection
sum(ex6$Population[ex6$Eurozone == "yes"])
```

</details>

**9- Write ex6 into file ex6c_output.txt**

*After each of the following steps, check the output file in RStudio*

* Try with the default arguments.

<details>
<summary>
correction
</summary>

```{r}
write.table(ex6, file="ex6c_output.txt")
```

</details>

* Add the argument "row.names" set to FALSE.

<details>
<summary>
correction
</summary>

```{r}
write.table(ex6, "ex6c_output.txt", 
            row.names = FALSE)
```

</details>

* Add the argument "quote" set to FALSE.

<details>
<summary>
correction
</summary>

```{r}
write.table(ex6, "ex6c_output.txt", 
            row.names = FALSE,
            quote = FALSE)
```

</details>

* Add the argument "sep" set to "\t" or to ","

<details>
<summary>
correction
</summary>

```{r}
write.table(ex6, "ex6c_output.txt", 
            row.names = FALSE,
            quote = FALSE,
            sep="\t")
```

</details>

<details>
<summary>
correction
</summary>

```{r}
write.table(ex6, "ex6c_output.txt", 
            row.names = FALSE,
            quote = FALSE,
            sep=",")
```

</details>

<br>
> [back to home page](https://sbcrg.github.io/CRG_RIntroduction)

