<h2>Arithmetic operators</h2>

| Operator  | Function      |
|:--------: |:-------------:|
|     +     | addition      |
|     -     | subtraction   |
|     /     | division      |
|     *     | multiplication|
|  ^ or **  | exponential   |

```{r}
10 - 2
```
Type **Enter** for R to interpret the command.

<h3>Simple calculaion</h3>

Given the following table:

| type of RNA | Total   |
| :---------: |:-------:|
| mRNA        | 329     |
| miRNA       | 45      |
| snoRNA      | 12      |
| lncRNA      | 28      |


Calculate the total number of RNAs reported in the table:
```{r}
329 + 45 + 12 + 28
```
What is the percentage of miRNA?
```{r}
( 45 / 414 ) * 100
```

<h2>Objects in R</h2>

<img src="objects_box.png" alt="rstudio logo" width="300"/>

<h2>R syntax</h2>
<img src="rsyntax1.png" alt="rstudio logo" width="350"/>

<h3>Assignment operators</h3>
+ **<-** or **=**
+ Essentially the same but, to avoid confusions:
  + Use **<-** for assignments
  + Keep **=** for arguments

<h3>Assigning data to an object</h3>

* Assigning a value to the object **B**:
B <- 10

* Reassigning: modifying the content of an object:
```{r}
B + 10
```
<span style="color:red">some **B unchanged !!** text</span><br>
```{r}
B <- B + 10<br>
```
<span style="color:red">some **B changed !!** text</span><br>


