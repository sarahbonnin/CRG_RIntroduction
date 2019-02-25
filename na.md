<h2>Missing values</h2>

**NA** (Not Available) is a recognized element in R.

* Finding missing values in a vector

```{r}
# Create vector
x <- c(4, 2, 7, NA)

# Find missing values in vector:
is.na(x)

# Remove missing values
na.omit(x)
x[ !is.na(x) ]
```

* Some functions can deal with NAs, either by default, or with specific arguments:

```{r}
x <- c(4, 2, 7, NA)

# default arguments
mean(x)

# set na.rm=TRUE
mean(x, na.rm=TRUE)
```

* In a matrix or a data frame, keep only rows where there are no NA values:

```{r}
# Create matrix with some NA values
mydata <- matrix(c(1:10, NA, 12:2, NA, 15:20, NA), ncol=3)

# Keep only rows without NAs
mydata[complete.cases(mydata), ]
# or
na.omit(mydata)
```

<br>
Check this [R blogger post on missing/null values](https://www.r-bloggers.com/r-null-values-null-na-nan-inf/)

> Go to [Input/Output](https://sbcrg.github.io/CRG_RIntroduction/inout)
<br>

> [back to home page](https://sbcrg.github.io/CRG_RIntroduction)


