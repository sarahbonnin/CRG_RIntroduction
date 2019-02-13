<h2>Vectors</h2>

A vector is a sequence of data elements from the **same type**.

| :-: | :-: | :-: | :-: |
| 329 | 45 | 12 | 28 |

| | | | |
|-|-|-|-|
| 329 | 45 | 12 | 28 |

<table style="width: 60%">
    <colgroup>
       <col span="1" style="width: 33%;">
       <col span="1" style="width: 33%;">
       <col span="1" style="width: 33%;">
    </colgroup>
  <tr>
    <th>Firstname</th>
    <th>Lastname</th>
    <th>Age</th>
  </tr>
</table>


<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Field</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td markdown="span">First column **fields**</td>
<td markdown="span">Some descriptive text.</td>
<td markdown="span">test</td>
</tr>
<tr>
<td markdown="span">Second column</td>
<td markdown="span">Some more descriptive text.</td>
<td markdown="span">test</td>
</tr>
</tbody>
</table>


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


