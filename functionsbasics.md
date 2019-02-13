<h2>Functions</h2>

In programming, a function is a section of a program that performs a specific task.

For example function getwd is used as:
```{r}
getwd()
```
and has the task of outputting the current working directory.

You can recognize a function with the **round brackets**:<br>

**function()**
<br>
  |_______|
 
<img src="func_arg1.png"  width="350"/>

An function can also take *arguments/parameters*
```{r}
setwd(dir="Rcourse")
```
setwd changes the current working directory. 

* Assign output of a function to an object

<img src="func_arg2.png"  width="350"/>

* Getting help

+ From the terminal:

```{r}
help(getwd)
?getwd
```

+ From the RStudio bottom-right panel:
<img src="help.png"  width="400"/>

* The help pages show:
+ required/optional argument(s), if any.
+ default values for each argument(s), if any.
+ examples.
+ detailed description.

* Example of a function
```{r}
example(mean)
```

