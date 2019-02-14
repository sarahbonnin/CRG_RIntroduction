<h2>Two-dimensional structures manipulation</h2>

<h3>Dimensions</h3>

* Get the number of rows and the number of columns:

```{r}
# Create a data frame
d <- data.frame(c("Maria", "Juan", "Alba"),
	c(23, 25, 31),
	c(TRUE, TRUE, FALSE),
	stringsAsFactors = FALSE)
# number of rows
nrow(d)
# number of columns
ncol(d)
```

* Check the dimensions of the object: both number of rows and number of columns:

```{r}
# first element: number of rows
# second element: number of columns
dim(d)
```

* Dimension names

Column and/or row names can be added to matrices and data frames

```{r}
colnames(d) <- c("Name", "Age", "Vegetarian")
rownames(d) <- c("Patient1", "Patient2", "Patient3")
```

Column and/or row names can be used to retrieve elements or sets of elements from a 2-dimensional object:

<img src="df_names.png" width="300"/>


```{r}
d[,"Name"]
# same as:
d[,1]

d["Patient3", "Age"]
# same as:
d[3,2]

# for data frames only, the $ sign can be used to retrieve columns:
d$Name== d[,1] is d[, "Name"]

```

* Create objects already with names

 * Matrix:

```{r}
m <- matrix(1:4, ncol=2, 
	dimnames=list(c("row1", "row2"), c("col1", "col2")))
```

 * Data frame:

```{r}
df <- data.frame(col1=1:2, col2=1:2, 
	row.names=c("row1", "row2"))
```

<h3>Manipulation</h3>
> [back to home page](https://sbcrg.github.io/CRG_RIntroduction)

