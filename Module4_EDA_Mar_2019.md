---
title: "MODULE II. Introduction to Exploratory Data Analysis & Descriptive Statistics."
author: "Julia Ponomarenko, CRG Bioinformatics core facility."
date: "October 4, 2017"
output:
  html_document:
    toc: true
    toc_depth: 4
    theme: readable
---
<br/>

"In statistics, **exploratory data analysis (EDA)** is an approach to analyzing data sets to summarize their main characteristics, often with visual methods. A statistical model can be used or not, but primarily EDA is for seeing what the data can tell us beyond the formal modeling or hypothesis testing task." (Wikipedia)

<br/>
"**Descriptive statistics** aim to summarize **a sample**, rather than use the data to learn about **the population** that the sample of data is thought to represent. This generally means that **descriptive statistics**, unlike **inferential statistics**, are not developed on the basis of probability theory." (Wikipedia)

<br/>
<br/>

### Exploratory Data Analysis

We will use the package "car". For details on this package, see https://cran.r-project.org/web/packages/car/car.pdf

```{r, results="hide", warning = F}
# install.packages("car") - run this code if you do not have car" package installed
library(car) 
```

<br/>
Let's explore the dataset "Davis" from the car package. It is called "Self-Reports of Height and Weight Description".
The Davis data frame has 200 rows and 5 columns. The subjects were men and women engaged in regular exercise. There are some missing data. This data frame contains the following columns:
<br/>sex    - A factor with levels: F, female; M, male. 
<br/>weight - Measured weight in kg.
<br/>height - Measured height in cm.
<br/>repwt  - Reported weight in kg.
<br/>repht  - Reported height in cm.

```{r, results="hide"}
data <- Davis
```
<br/>

#### Data dimentionality
```{r, results="hide"}
dim(data) # first thing to do to see how many rows and columns
names(data) # columns names

class(data)  # should be "data.frame""
sapply(data[1,], class)  # to see types of variables in each column

str(data) # gives all the above in one command !!!

head(data)
tail(data)

summary(data)  # shows quantiles for each column and how many NA !!!!
```
<br/>

#### Missing (NA) values in data
```{r, results="hide"}
#How many rows contain missing values (i.e., at least one 'NA')
sum(!complete.cases(data)) 
data[!complete.cases(data), ] # here they are
```

<br/>

#### Exploring a specific column
```{r, results="hide"}
length(data$repwt)
summary(data$repwt)
sum(is.na(data$repwt)) # count NA
table(is.na(data$repwt))  # how many complete data (FALSE) and how many missing (TRUE) for data$repwt

min(data$repwt) 
min(data$repwt, na.rm = TRUE) # this as many other functions have to be excplicitly told to ignore NA
max(data$repwt, na.rm = TRUE)
median(data$repwt, na.rm = TRUE)
quantile(data$repwt, na.rm = TRUE)  # shows quantiles for values in a specific column, ignoring 'NA'
quantile(data$repwt, na.rm = TRUE, probs = c(0, 0.25, 0.5, 0.75, 1)) # standard quantiles (or quartiles)

quantile(data$repwt, na.rm = TRUE, probs = c(0.1, 0.9)) # any other quantiles

unique(data$repwt) # shows unique values for a specified column (NA is considered)
length(unique(data$repwt))

unique(na.omit(data$repwt)) # shows unique values for a specified column (NA is omitted)
length(unique(na.omit(data$repwt)))

table(data$repwt) # how many data with the same repwt
as.data.frame(table(data$repwt)) # same as above shown as a data frame     

table(data$repwt, useNA = "ifany") # by default table() doesn't show missing values
as.data.frame(table(data$repwt, useNA = "ifany"))
```

<br/>

#### Exploring relationship between variables
```{r, results="hide"}
table(data$sex) # table() builds a contingency table of the counts at each combination of factor levels
table(data$sex, data$weight)  # shows relationships between variables
table(data$sex, data$weight < 80) # gives the 2x2 contingency table
m <- table(data$sex, data$weight < 80) # save it is a matrix
colnames(m) <- c("weight >= 80","weight < 80") # add names to columns
rownames(m) <- c("Female","Male") # add names to rows
m # check it out

intervals <- cut(data$weight, quantile(data$weight)) # cut() assigns to each value a quantile - shows intervals in the order of data$weight
table(intervals, data$sex) # contigency table of sex by intervals (weight quantiles)

# contigency table of quantiles of weight versus repwt
x <- data$weight
y <- data$repwt
table(cut(x, quantile(x)), cut(y, quantile(y, na.rm = TRUE))) 
```
<br/>


#### Looking at subset of data
```{r, results="hide"}
d <- data[data$weight < 60,] # rows with weight below 60 kg
str(d)
summary(d)

d <- subset(data, weight < 60) # same as the above !!!

data[data$weight < 60 & data$repwt >= 60,] # the results looks strange !!!
data[which(data$weight < 60 & data$repwt >= 60),] # use which() to exclude NA values
subset(data, weight < 60 & repwt >= 60) # same as the above
subset(data, weight < 60 & repwt >= 60, select = c(sex, weight, repwt)) # same as the above but allows to select at the same time variables
subset(data, weight < 60 & repwt >= 60, select = c(-height, -repht)) # gives the same result as above !!! 
```
<br/>
<br/>

### Descriptive Statistics 
Basic R functions: mean, sd, var, min, max, median, range, IQR, and quantile. All these function require special treatment for missing values, using parameter na.rm = TRUE. While summary(data) does not.

Let's look at the row with the maximum weight.
```{r}
max_weight <- max(data$weight)
data[which(data$weight == max_weight), ] # full info (row) on a person with the max_weight
```

<br/>

#### Outliers
Can be defined (by the Tuley's test) as values in the sample that differ from the Q1 (25% quantile) or Q3 (75% quantile) by more than 1.5*IQR (where IQR = Q3 - Q1). <br/>However, there is no formal definition of outliers; they need to be treated subjectively.

```{r, results="hide"}
quantile(data$weight)
q <- unname(quantile(data$weight)) # unname() removes names and gives the vector of quantile values that we can use below

iqr <- q[4] - q[2] # or use IQR(data$weight) instead
upper_limit <- q[4] + 1.5 * iqr # values above this limit are outliers
upper_limit
max_weight > upper_limit # Is the maximum weight an outlier? TRUE or FALSE?
```

<br/>

How many "formal" outliers by weight in the dataset?
```{r}
data[which(data$weight > upper_limit), ] # or use subset(data, weight > upper_limit)
```

<br/>

#### How statistics change if to remove outliers 
```{r, results="hide"}
# We can remove all "formal" outliers
d <- data[which(!data$weight > upper_limit), ] 

# While it is better to remove only those that have no sense
d <- data[which(data$weight != max_weight), ] # d is our data frame without outliers; we will use it further in this practicum

# Did mean change?
mean(d$weight)
mean(data$weight)

# Did median change?
median(data$weight)
median(d$weight)

# Did SD change?
sd(data$weight)
sd(d$weight)
```

<br/>

### Plots
#### Box-plot
```{r}
boxplot(data$weight) # we can clearly see three outliers as individual dots
data[which(data$weight > upper_limit), ] # here they are
```

<br/>
**How to plot box-plots side-by-side on one graph**
```{r}
boxplot(data$weight ~ data$sex)
boxplot(data$weight ~ data$sex, outline = FALSE) # boxplot has a parameter "outline" not to show outliers! (But it doesn't change your data)
```

<br/>
**Bonus: How to plot together data from two or more vectors of different lengths?**
```{r, results="hide", warning = FALSE}
#install.packages("reshape2")
library(reshape2) # for melt() to use below for transforming a data frame from the wide to the long format
```

<br/>
```{r, results="hide", warning = F}
male <- d[which(d$sex == "M"),] # we use data with outliers removed
female <- d[which(d$sex == "F"),]
m <- male$weight
f <- female$weight
length(m)
length(f)

# to make a data frame from these vectors, we first need to make them of the same length; that is, fill missing values in a smaller vector with 'NA'
len = max(length(m), length(f))
Female = c(f, rep(NA, len - length(f)))
Male = c(m, rep(NA, len - length(m)))
df <- structure(data.frame(Male, Female)) 
meltdf <- melt(df) # uses reshape2 package; transfors a data frame from the wide to the long format
# "No id variables; using all as measure variables" is a message that can be ignored
boxplot(data = meltdf, value ~ variable)
```

<br/>

**Bonus: Now to make the above plot more informative and look "publication-ready"?**
```{r, results="hide"}
# Define the plot parameters
y_limits <- c(30, 130)
colors <- c("blue", "red")
ylab <- "Weight, kg"
title <- "Distribution of weight by sex"

boxplot(data = meltdf, value ~ variable, outline = FALSE,
        #pars = list(boxwex = .4),
        ylab = ylab,
        cex.lab = 1.5, #to change (multiply) the font size of the axes legends
        cex.axis = 1.2, #to change (multiply) the font size of the axes
        ylim = y_limits,
        border = colors, #color the boxplot borders
        boxwex = 0.6,
        staplewex = 0.4,
        frame.plot = FALSE, #this removes upper and right borders on the plot area
        outwex = 0.5,
        cex.main = 1.5, #to change (multiply) the size of the title
        main = title # the title of the graph
        )

stripchart(data = meltdf, value ~ variable,
           col = colors,
           method = "jitter", jitter = .2,
           pch = c(16, 15), cex = c(1.0, 1.0), #different points and of different size can be used
           vertical = TRUE, add = TRUE)

# let's show the (yet unknown) significance level on the plot
text <- "p-value < ???"

y <- 120 # y position of the horizontal line
offset <- 5 # length of vertical segments
x <- 1

segments(x, y, x + 1, y)
segments(x, y - offset, x, y)
segments(x + 1, y - offset, x + 1, y)
text(x + 0.5, y + offset, paste(text), cex = 1) #cex defines the font size of the text

# you can also plot the means as sick (lwd = 3) horizontal black lines
y <- mean(Male, na.rm = T)
segments(x - 0.35, y, x + 0.35, y, lwd = 3)

y <- mean(Female, na.rm = T)
segments(x + 1 - 0.35, y, x + 1 + 0.35, y, lwd = 3)

```
<br/>

#### Histogram
```{r, results="hide"}
hist(data$weight)
hist(d$weight)
```
<br/>

**You can control for the size of bins!**
```{r}
bin_size <- 5
start <- 30
end <- 120
bins <- seq(start, end, by = bin_size)
hist(d$weight, breaks = bins, col = "blue")
```

<br/>

**Bonus: Two overlaying histograms on one graph**
```{r, results="hide"}
male <- d[which(d$sex == "M"),] # we use data with outliers removed
female <- d[which(d$sex == "F"),]

xlim = c(start, end)
title <- "Distribution of weights for males and females"
colors <- c("red", rgb(0, 0, 1, 0.7)) # the last number in rgb() is for the transparency of the second color

hist(female$weight, col = colors[1], xlim = xlim, xlab = "Weight, kg", main = title)
hist(male$weight, add = TRUE, col = colors[2], xlim = xlim)
legend("topright", legend = c("Females", "Males"), fill = colors, bty = "n", border = NA)
```
<br/>

**Bonus: The same graph as above with bins of size 2 and using colors <- c(rgb(1, 0, 1, 0.7), rgb(0, 0, 1, 0.5))**
```{r, results = "hide"}
male <- d[which(d$sex == "M"),] # we use data with outliers removed
female <- d[which(d$sex == "F"),]
m <- male$weight
f <- female$weight

bin_size <- 2
start <- min(min(m), min(f)) - 3*bin_size
end <- max(max(m), max(f)) + 3*bin_size
bins <- seq(start, end, by = bin_size)

xlim = c(start, end)
title <- "Distribution of weights for males and females"
colors <- c(rgb(1, 0, 1, 0.7), rgb(0, 0, 1, 0.5)) # the last number in rgb() is for transparency

hist(female$weight, breaks = bins, col = colors[1], xlim = xlim, xlab = "Weight, kg", main = title)
hist(male$weight, breaks = bins, add = TRUE, col = colors[2], xlim = xlim)
legend("topright", legend = c("Females", "Males"), fill = colors, bty = "n", border = NA)
```


<br/>

#### Scatterplot
```{r, results="hide"}
plot(d$weight, d$repwt, pch = 20) # Just a simple plot of reported weights against measured weights

plot(d$weight, d$repwt, pch = 20, col = d$sex) # it can be colored by sex, for example
legend("topleft",legend = c("Females", "Males"), col = 1:2, pch = 20)
```

<br/>

Colors are taken in the order from the currently setup **palette()** . 
```{r}
palette()
```

<br/>


Palette's colors can be changed and then reset back to default, using palette("default").
```{r, results="hide"}
palette(c(rgb(1, 0, 1, 0.7), "blue")) # changing palette()

plot(d$weight, d$repwt, col = d$sex, pch = 20, xlab = "Measured weight, kg", ylab = "Reported weight, kg", main = "Reported versus measured weights by sex") 
legend("bottomright",legend = c("Females", "Males"), col = 1:2, pch = 20, bty = "n")
palette("default") # reset back to the default
```

<br/>

#### Empirical cumulative distribution functions (eCDFs)
**eCDF(x) = the proportion of observations which values are <= x**
```{r, results="hide"}
weight.ecdf = ecdf(d$weight) # obtain empirical CDF values

plot(weight.ecdf, xlab = "Quantiles of weight, kg", main = "Empirical cumulative distribution of weights")
```

<br/>

Let's draw the vertical lines depicting median, Q1, and Q2, using function abline(v = ...).
```{r}
plot(weight.ecdf, xlab = "Quantiles of weight, kg", main = "Empirical cumulative distribution of weights")
summary(d$weight)
x <- unname(summary(d$weight)) # a vector of 6 elements {min, Q1, median, mean, Q3, max}

abline(v = median(d$weight), lwd = 2) # vertical line for median
abline(v = x[2], col = "blue", lwd = 2) # vertical line for Q1
abline(v = x[5], col = "red", lwd = 2) # vertical line for Q3
```

<br/>


Let's draw the horizontal lines for quantiles 0.5, 0.25, 0.75, and 0.1 and 0.9 using function abline(h = ...).
```{r, results="hide"}
plot(weight.ecdf, xlab = "Quantiles of weight, kg", main = "Empirical cumulative distribution of weights")
x <- unname(summary(d$weight)) # a vector of 6 elements {min, Q1, median, mean, Q3, max}
abline(v = median(d$weight), lwd = 2) # vertical line for median
abline(v = x[2], col = "blue", lwd = 2) # vertical line for Q1
abline(v = x[5], col = "red", lwd = 2) # vertical line for Q3

abline(h = 0.5) # median
abline(h = 0.25, col = "blue")
abline(h = 0.75, col = "red")
```
<br/>


It can be seen that the CDF graph allows to identify the weight in kg for any quantile. For example, the lowest 10% of observations (CDF < 0.1) have weight below ~50 kg. Likewise, the top 10% of heavest people (CDF > 0.9) have weight above ~82 kg.

<br/>


#### Combining plots
Refer to http://www.statmethods.net/advgraphs/layout.html for using layout() function.
