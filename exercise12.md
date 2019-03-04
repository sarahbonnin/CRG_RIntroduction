## Exercise 12: ggplot2

Create the script "exercise12.R" and save it to the "Rcourse/Module3" directory: you will save all the commands of exercise 12 in that script.
<br>Remember you can comment the code using #.


<details>
<summary>
correction
</summary>

```{r}	
getwd()
setwd("~/Rcourse/Module3")
```

</details>

### 12a- 

**1- Load ggplot2 package

<details>
<summary>
correction
</summary>

```{r}	
library(ggplot2)
```

</details>

**2- Download the data we will use for plotting:

```{r}
download.file("https://raw.githubusercontent.com/sbcrg/CRG_RIntroduction/master/ex12_normalized_intensities.csv", "ex12_normalized_intensities.csv", method="curl")
```



# 2. Using the "de" object from Exercise 9, create a simple scatter plot for plotting gene expression of sample 1 and sample 2.
# Note: remember the structure:
ggplot(data=de, aes(x=sample1, y=sample2)) + 
  geom_point()

# 3. Color points according to the updown column. Save in object p.
# Note: remember the structure:
p <- ggplot(data=de, aes(x=sample1, y=sample2, color=updown)) + 
  geom_point()
p

# 4. Change colors of the points to blue, grey and red. Save to p2.
p2 <- p + scale_color_manual(values=c("blue", "grey", "red"))
p2

# 5. Save p2 into a jpeg file.
# a. Try with RStudio Plots window (Export)
# b. Try  in the console:
jpeg("myscatterggplot.jpg")
  plot(p2)
dev.off()

# Exercise 9b ??? box plot

# 1. Convert de from a wide format to a long format, save in de_long.
# Note: remember melt function from reshape2 package.
library(reshape2)
de_long <- melt(de)

# 2. Produce a boxplot of the expression of sample 1 and sample 2 (each sample should be represented by a box)
ggplot(data=de_long, aes(x=variable, y=value)) + 
  geom_boxplot()

# 3. Modify the previous boxplot so as to obtain 3 ???sub???-boxplots per sample, each representing the expression of either UP, DOWN or NONE genes.
ggplot(data=de_long, aes(x=variable, y=value, color=updown)) + 
  geom_boxplot()

# Exercise 9c ??? bar plot

# 1. Produce a bar plot of how many UP/DOWN/NONE genes are in de.
ggplot(data=de, aes(x=updown)) + 
  geom_bar()

# 2. Add an horizontal line at counts 1000 (y-axis).
p <- ggplot(data=de, aes(x=updown)) + 
  geom_bar() + 
  geom_hline(yintercept=1000)

# 3. Swap x and y axis.
p <- p + coord_flip()
  
# 4. Add a title to the graph.
p <- p + ggtitle("barplot")

# Exercise 9d ??? histogram

# 1. Create a simple histogram using de_long (using the column "value").
ggplot(data=de_long, aes(x=value)) + 
  geom_histogram()

# 2. Notice that you get the following warning message ???stat_bin()` using `bins = 30`. Pick better value with `binwidth`.???
# Change bins parameter of geom_histogram() to 50.
ggplot(data=de_long, aes(x=value)) + 
  geom_histogram(bins=50)

# 3. This histogram plots expression values for both sample1 and sample2.
# Change the plot so as to obtain 2 histograms on the same plot: one corresponding to sample1, one corresponding to sample2.
ggplot(data=de_long, aes(x=value, fill=variable)) + 
  geom_histogram()

# 4. By default, geom_histogram produces a stacked histogram.
# Change the position of the bars to dodge.
p <- ggplot(data=de_long, aes(x=value, fill=variable)) + 
  geom_histogram(position="dodge")
  
# 5. Change the colors of the bars to colors of your choice.
# Note: Try the rainbow() function for coloring
p <- p + scale_fill_manual(values=rainbow(2))

# 6. Zoom in the plot: reduce the x-axis to values from 7 to 12.
# xlim() layer.
p <- p + xlim(7, 12)



Go back to [ggplot2](https://sbcrg.github.io/CRG_RIntroduction/ggplot2)

> [back to home page](https://sbcrg.github.io/CRG_RIntroduction)
