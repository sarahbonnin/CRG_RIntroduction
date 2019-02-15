<h2>Paths and directories</h2>

* The path of a file/directory is its location/address in the file system.

* Your home directory is the one that hosts your personal folder:
	+ for CRG users: /nfs/users/[yourgroup]/[yourlogin]

* The shortcut to your home directory is <font size="20"> <b>~</b></font>

<h2>Tree of directories</h2>

<a href="https://sbcrg.github.io/CRG_RIntroduction/images/tree_directories.png"><img src="images/tree_directories.png" alt="rstudio logo" width="1000"/></a>


<h2>Navigate with R terminal</h2>

* Path of the current directory (know where you are working at the moment):
<b>getwd</b>: get working directory
```{r}	
getwd()
```

* Change working directory
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
Move one directory "up" the tree with:
```{r} 
setwd("..")
```
You are now in: "~/Rcourse"

 > Go to [R basics](https://sbcrg.github.io/CRG_RIntroduction/Rbasics)
<br>
> [back to home page](https://sbcrg.github.io/CRG_RIntroduction)


