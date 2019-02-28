<h2>ggplot2 package</h2>

* Graphing package inspired by the **G**rammar of **G**raphics work of Leland Wilkinson.

* A tool that enables to concisely describe the components of a graphic.

* Why ggplot2 ?
	+ Flexible
	+ Customizable
	+ Pretty !
	+ Well documented

* All ggplots start with a **base layer** with the **ggplot()** function:

```{r}
ggplot(data=dataframe, aes=(x=column1, y=column2))
```

*The base layer is setting the grounds but NOT plotting anything*

* Add a layer (with the **+** sign) that describes what kind of plot you want:

```{r}
# Example of a scatter plot: add the geom_point() layer
ggplot(data=dataframe, aes(x=column1, y=column2)) + geom_point()
```

* Example of a simple scatter plot:

```{r}
# Create a data frame
df1 <- data.frame(sample1=rnorm(200), sample2=rnorm(200))

# Plot !
ggplot(data= df1 , aes(x=sample1, y=sample2)) + geom_point()
```

<img src="images/plots/scatter1_gg.png" width="350"/>


* Add **layers** to that object to customize the plot:
	* **ggtitle** to add a title
	* **geom_vline** to add a vertical line
	* etc.
```{r}
ggplot(data= df1 , aes(x=sample1, y=sample2)) + geom_point() +
	ggtitle("my first ggplot") +
	geom_vline(xintercept=0)
```

Bookmark that [ggplot2 reference](https://ggplot2.tidyverse.org/reference/) and that good [cheatsheet](https://www.rstudio.com/wp-content/uploads/2016/11/ggplot2-cheatsheet-2.1.pdf) for some of the ggplot2 options.

* You can save the plot in an object **at any time** and add layers to that object:

```{r}
# Save in an object
p <- ggplot(data= df1 , aes(x=sample1, y=sample2))
# Add layers to that object
p + ggtitle("my first ggplot")
```

<img src="images/plots/scatter2_gg.png" width="350"/>

* What is inside the **aes** (aesthetics)function ?
        * **Anything that varies** !
                * Actual columns of to be plotted.
                * Columns with which you want to, for example, color the points.

Color the points according to another column in the data frame:

```{r}
# Build a data frame from df1: add a column with "yes" and "no"
df2 <- data.frame(df1, grouping=rep(c("yes", "no"), c(80, 120)))
# Plot and add the color parameter in the aes():
ggplot(data=df2, aes(x=sample1, y=sample2, color=grouping)) + geom_point()
```

<img src="images/plots/scatter3_gg.png" width="350"/>

<h3>Box plots</h3>

<h3>Bar plots</h3>

<h3>Histograms<h3>




<h3>Scatter plots</h3>


> [back to home page](https://sbcrg.github.io/CRG_RIntroduction)

