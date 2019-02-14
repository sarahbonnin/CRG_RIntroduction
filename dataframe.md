<h2>Data frames</h2>

A data frame is a 2-dimensional structure.
<br> It is more general than a matrix.
<br>
All columns in a matrix:
 + can be of different **types** (numeric, character or logical)
 + must havethe same **length**

* Create a data frame with the **data.frame** function:

```{r}

d <- data.frame(c("Maria", "Juan", "Alba"), 
	c(23, 25, 31),
	c(TRUE, TRUE, FALSE),
	stringsAsFactors = FALSE)
```

* Data frame manipulation:
<br>
Very similar to matrix manipulation.

<img src="df_fetch.png" width="450"/>


> Go to [2-dimension objects manipulation](https://sbcrg.github.io/CRG_RIntroduction/2d_manip)
<br>

> [back to home page](https://sbcrg.github.io/CRG_RIntroduction)

