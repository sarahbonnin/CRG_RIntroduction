<h2>Matrices</h2>

* A matrix is a **2 dimensional** vector.

* All columns in a matrix must have:
	+ the same **type** (numeric, character or logical)
	+ the same **length**

<h3>Creating a matrix</h3>

* From vectors with the **rbind** function:

```{r}
x <- c(1, 44)
y <- c(0, 12)
z <- c(34, 4)
# rbind: bind rows
b <- rbind(x, y, z)
```

* From vectors with the **cbind** function:

```{r}
i <- c(1, 0, 34)
j <- c(44, 12, 4)
# rbind: bind rows
b <- cbind(i, j)
```

* From scratch with the *matrix* function:

```{r}
# nrow: number of rows
# ncol: number of columns
b <- matrix(c(1, 0, 34, 44, 12, 4), 
	nrow=3,
	ncol=2)
```

<h3>Two-dimensional object</h3>

Vectors have one index per element (1-dimension).<br>
Matrices have **two indices (2-dimensions)** per element, corresponding to the row and the column:

<img src="images/matrix_indices.png" alt="rstudio logo" width="200"/>

* Fetching elements of a matrix:

The "coordinates" of an element in a 2-dimensional object will be first the row (on the left of the comma), then the column (on the right of the comma):

<img src="images/matrix_rc.png" alt="rstudio logo" width="200"/>

<h3>Matrix manipulation</h3>

* Add 1 to all elements of a matrix

```{r}
b <- b + 1
```

* Multiply by 3 all elements of a matrix

```{r}
b <- b * 3
```

* Subtract 2 to each element of **the first row** of a matrix

```{r}
b[1, ] <- b[1, ] - 2
```

* Replace elements that comply a condition:

```{r}
# Replace all elements that are greater than 3 with NA
b[ b>3 ] <- NA
```

> Go to [Data frames](https://sbcrg.github.io/CRG_RIntroduction/dataframe)
<br>
> [back to home page](https://sbcrg.github.io/CRG_RIntroduction)


