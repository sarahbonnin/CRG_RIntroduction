<h2>Missing values</h2>

* NA (not available) is a recognized element in R.

 * Find missing values in a vector:

```{r}
x <- c(4, 2, 7, NA, 6)
is.na(x)
```
 
 * Remove missing values:

```{r}
na.omit(x)
x[ !is.na(x) ]
```

 * When applying logical operators to the vector, NAs will be ignored:

```{r}
x < 3
```

 * Some functions deal by default with the NAs, or contain arguments to deal with them:

```{r}
x <- c(4, 2, 7, NA, 6)
# will not work:
mean(x)
# will work:
mean(x, na.rm+TRUE)
```

<br>
Check this [R blogger post on missing/null values](https://www.r-bloggers.com/r-null-values-null-na-nan-inf/)
<br>
> [back to home page](https://sbcrg.github.io/CRG_RIntroduction)

