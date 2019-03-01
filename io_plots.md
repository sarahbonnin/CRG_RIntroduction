<h2>How to save plots</h2>

<h3>With R Studio</h3>

<img src="images/rstudio_plotsave.png" width="450"/>

<h3>With the console</h3>

```{r}
# Open the file that will contain your plot
pdf("myplot.pdf")

# execute the plot
plot(1:10)

# Close the file that will contain the plot
dev.off()
```

<h4>Formats</h4>

R supports saving figures in pdf, png, jpeg, tiff, bmp, svg.<br>
They all come with their own function:

```{r}
# TIFF
tiff("myfile.tiff")
plot(1:10)
dev.off()

# JPEG
jpeg("myfile.jpeg")
plot(1:10)
dev.off()

# etc.

```

The size of the output file can be changed:

```{r}
# Defaults 7 inches (both width and height) for svg, pdf.
svg("myfile.svg", width=8, height=12)
plot(1:10)
dev.off()

# Defaults 480 pixels (both width and height) for jpeg, tiff, png, bmp.
png("myfile.png", width=500, height=600)
plot(1:10)
dev.off()
```

*Note that pdf is the only format that supports several pages*:

```{r}
pdf("myfile_pages.pdf")
plot(1:10)
plot(2:20)
dev.off()
```

<h4>Plot several figures in one page</h4>

```{r}
jpeg("myfile_multi.jpeg")

# organize the plot in 1 row and 2 columns:
par(mfrow=c(1,2))

plot(1:10)
plot(2:20)

dev.off()
```

<img src="images/plots/myfile_multi.jpeg" width="350/" >

> Go to [Exercise 11](https://sbcrg.github.io/CRG_RIntroduction/exercise11): Base plots !
<br>
> [back to home page](https://sbcrg.github.io/CRG_RIntroduction)

