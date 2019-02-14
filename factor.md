<h2>Factors</h2>

* Factors are 1-dimensional objects which you can create like:

```{r}
e <- factor(c("high", "low", "medium", "low"))
```

* They are used for:
  + statistical modeling (mainly)
  + graphing

* Factors are similar to vectors but with levels/categories.
<br>

Levels can be **ordered**:

```{r}
e <- factor(e, levels=c("low", "medium", "high"), ordered=TRUE)
```

Then, operations as for a numeric vector can be applied:

```{r}
min(e)
max(e)
e >= "medium"
``` 

* Example of a character vector versus a factor

```{r}
e <- factor(c("high", "low", "medium", "low"))
e2 <- c("high", "low", "medium", "low")
# Check the structure
str(e)
str(e2)
```

> Go to [Matrix](https://sbcrg.github.io/CRG_RIntroduction/matrix)
<br>
> [back to home page](https://sbcrg.github.io/CRG_RIntroduction)


