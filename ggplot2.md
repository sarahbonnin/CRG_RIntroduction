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

```{r}
# Simple boxplot
ggplot(data=df2, aes(x=grouping, y=sample1)) + geom_boxplot()
```

<img src="images/plots/boxplot1_gg.png" width="350"/>

What if you want to plot both sample1 and sample2 ?<br>
*Need to convert into a **long** format*

<img src="images/plots/wide2long.png" width="350"/>

Plotting both sample1 and sample2:

```{r}
# load package reshape2
library(reshape2)

# convert to long format
df_long <- melt(df2)
	# all numeric values are organized into only one column: value
# plot:
ggplot(data=df_long, aes(x=variable, y=value)) + geom_boxplot()
```

<img src="images/plots/boxplot2_gg.png" width="350"/>

What if now you also want to see the distribution of "yes" and "no" in both sample1 and sample2 ?<br>
* Integrate a parameter to the **aes()***

```{r}
# Either color
ggplot(data=df_long, aes(x=variable, y=value, color=grouping)) + geom_boxplot()
```

<img src="images/plots/boxplot3_gg.png" width="350"/>

```{r}
# Or fill
ggplot(data=df_long, aes(x=variable, y=value, fill=grouping)) + geom_boxplot()
```

<img src="images/plots/boxplot4_gg.png" width="350"/>

Do you want to change the default colors?<br>
* Integrate either the **scale_color_manual()** or **scale_fill_manual** layers*

```{r}
ggplot(data=df_long, aes(x=variable, y=value, fill=grouping)) + 
	geom_boxplot() +
	scale_fill_manual(values=c("slateblue2", "chocolate"))
```

<img src="images/plots/boxplot5_gg.png" width="350"/>


<h3>Bar plots</h3>

```{r}
# A simple bar plot
ggplot(data=df2, aes(x=grouping)) + geom_bar()
```

<img src="images/plots/barplot1_gg.png" width="350"/>

Customize a bit:

```{r}
# Save the plot in the object "p"
p <- ggplot(data=df2, aes(x=grouping, fill=grouping)) + geom_bar()

# Change x axis label with scale_x_discrete:
p2 <- p + scale_x_discrete(name="counts of yes / no")

# Swapping x and y axis with coord_flip():
p3 <- p2 + coord_flip()

# Change fill
p4 <- p3 + scale_fill_manual(values=c("yellow", "cyan"))

# Show intermediary and final plots
p
p2
p3
```

<img src="images/plots/barplot2_gg.png" width="500"/>


<h3>Histograms<h3>

```{r}
# Simple histogram
ggplot(data=df_long, aes(x=value)) + geom_histogram()

```

<img src="images/plots/histogram1_gg.png" width="350"/>

Split by sample ("variable" column)

```{r}
ggplot(df_long, aes(x=value, fill=variable)) + geom_histogram()
```

<img src="images/plots/histogram2_gg.png" width="350"/>

By default, the histograms are **stacked**: change to position **dodge**:

```{r}
ggplot(df_long, aes(x=value, fill=variable)) + 
	geom_histogram(position='dodge')
```

<img src="images/plots/histogram3_gg.png" width="350"/>

<h3>About themes</h3>

You can change the default **theme** (background color, grid lines etc):

```{r}
# go back to a previous plot
p <- ggplot(data=df_long, aes(x=value)) + geom_histogram()

# Try different themes
p + theme_bw()
p + theme_minimal()
p + theme_void()
p + theme_grey()
p + theme_dark()
p + theme_light() 
```

<img src="images/plots/themes_gg.png" width="500"/>

<h3>About saving plots in files</h3>

<h4>The same as for regular plots applies</h4>

```{r}
png("myggplot.png")
p
dev.off()
```

You can also used the ggplot2 **ggsave** function:

```{r}
# By default, save the last plot that was produced
ggsave("lastplot.png")

# You can pick which plot you want to save:
ggsave("myplot.png", plot=p)

# You can save in many different formats: "eps", "ps", "tex", "pdf", "jpeg", "tiff", "png", "bmp", "svg", "wmf"
ggsave("myplot.ps", plot=p, device="ps")

# Change the height and width (and units of width and height):
ggsave("myplot.pdf", width = 20, height = 20, units = "cm")
```

<h3>Specific scatter plots</h3>

<h4>Volcano plot</h4>



> [back to home page](https://sbcrg.github.io/CRG_RIntroduction)

