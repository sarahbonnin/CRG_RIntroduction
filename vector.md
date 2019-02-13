<h2>Vectors</h2>

A vector is a sequence of data elements from the **same type**.

| 329 | 45 | 12 | 28 |


<h3>Creating a vector</h3>

* Values are assigned to a vector using the **c** command (**c**ombining elements).

```{r}
a <- c(329, 45, 12, 28)
```

* Create a sequence of consecutive numbers:

```{r}
a <- 1:6
# same as:
a <- c(1, 2, 3, 4, 5, 6)
# both ends (1 and 6) are included
```

* Character vectors

 + Each element is between (single or double) quotes.

| mRNA | miRNA | snoRNA | lncRNA |

```{r}
b <- c("mRNA", "miRNA", "snoRNA", "lncRNA")
```

<h3>Vector manipulation</h3>

* A vector can be named: each element of the vector can be assigned a name (number or character)

```{r}
names(a) <- c("mRNA", "miRNA", "snoRNA", "lncRNA")
# use an object which already contains a vector
names(a) <- b
```

* Get the length (number of elements) of a vector

```{r}
length(a)
```

* Extracting elements from vector **a**

 + extract elements using their position (index) in the vector:

<img src="vector_indices.png" width="500">

```{r}
a <- 1:6
a[1]
a[c(1,3)]
a[2:4]
```

 + extract elements using their names:

<img src="vector_indices_names.png" width="500">

```{r}
a["mRNA"]
a[c("miRNA", "lncRNA")]            
```

* Replacing a vector's value

```{r}
a[2] <- 31
a["miRNA"] <- 31
```

* Removing a vector's element

```{r}
a <- a[-3]
```

* __Show__ versus __change__

x[-2] <img src="red_triangle.jpg" width="40"> x <span style="color:red">unchanged</span> !

x <- x[-2] <img src="red_triangle.jpg" width="40"> x <span style="color:red">reassigned</span> !

<h3>Numeric vector manipulation</h3>

* Adding 2 to a vector adds 2 to **each element** of the vector

<img src="vector_addition.png" width="350">

> Same goes for subtractions, multiplications and divisions...

* Which elements of a are equal to 2?




