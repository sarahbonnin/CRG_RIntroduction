<h2>Paths and directories</h2>

* The path of a file/directory is its **location/address** in the file system.

* Your home directory is the one that hosts your personal folder:
	+ for CRG users: **/nfs/users/[yourgroup]/[yourusername]**

<h2>Tree of directories</h2>

<a href="https://sbcrg.github.io/CRG_RIntroduction/images/tree_directories.png"><img src="images/tree_directories.png" alt="rstudio logo" width="1000"/></a>
<br>
<font size="12"> <b>~</b></font>: shortcut to the home directory
<br>
<font size="12"> <b>.</b></font>: current directory
<br>
<font size="12"> <b>..</b></font>: one directory up the tree


<h2>Navigate the tree of directory with the R terminal</h2>

* Get the path of the current directory (know where you are working at the moment) with <b>getwd</b> (get working directory):
```{r}	
getwd()
```

* Change working directory with **setwd** (set working directory)<br>
Go to a directory giving the absolute path: 
```{r}
setwd("~/Rcourse")
```
Go to a directory giving the relative path:
```{r}
setwd("Module1")
```
You are now in: "~/Rcourse/Module1"
<br>
Move one directory "up" the tree:
```{r} 
setwd("..")
```
You are now in: "~/Rcourse"

 > Go to [R basics](https://sbcrg.github.io/CRG_RIntroduction/Rbasics)
<br>
> [back to home page](https://sbcrg.github.io/CRG_RIntroduction)


