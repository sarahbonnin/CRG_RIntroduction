<h2>Conditional statement</h2>

<h3>"if" statement</h3>

Structure of the **if statement**:

```{r}
if(condition){
    action_command
}
```

If the **condition** is TRUE, then proceeds to the **action_command**; if it is FALSE, nothing happens.
<br>

```{r}
k <- 10
# print if value is > 3
if(k > 3){
  print(k)
}
# print if value is < 3
if(k < 3){
  print(k)
}
```

<h4>With **else**</h4>

```{r}
if(condition){
    action_command1
}else{
    action_command2
}
```

If the **condition** is TRUE, then proceeds to the **action_command1**; if the **condition** is FALSE, proceed to **action_command2**.

```{r}
k <- 3
if(k > 3){
  print("greater than 3")
}else{
  print("less than 3")
}
```


<h4>With **else if**</h4>

```{r}
if(condition1){
    action_command1
}else if(condition2){
    action_command2
}else{
    action_command3
}
```

If the **condition1** is TRUE, then proceeds to the **action_command1**; if the **condition1** is FALSE, test for **condition2**: if the **condition2** is TRUE, proceed to the **action_command2**; if neither **condition1** nor **condition2** are TRUE, then proceed to the **action_command3**.
<br>
*Note that you can add up as many **else if** statements as you want.**

* Example without **else**

```{r}
k <- -2
# Test whether k is positive or negative or equal to 0
if(k < 0){
	print("negative")
}else if(k > 0){
	print("positive")
}else if(k == 0){
	print("is 0")
}
```

* Example with **else**

```{r}
k <- 10
# print if value is <= 3
if(k <= 3){
  print("less than or equal to 3")
}else if(k > 8){
  print("greater than or equal to 8")
}else{
  print("greater than 3 and less than 8")
}
```

* **For loop** and **if statement**:

```{r}
# Matrix
mymat <- matrix(rnorm(800), 
        nrow=50)
# Loop over rows of mymat and print row if the median is > 0
for(i in 1:nrow(mymat)){
	# extract the current row
	rowi <- mymat[i,]
	# if median of row is > 0, print row
	if(median(rowi) > 0){
		print(rowi)
	}
}
```


Go to [Exercise 10](https://sbcrg.github.io/CRG_RIntroduction/exercise10): "If" statement.
<br>

> [back to home page](https://sbcrg.github.io/CRG_RIntroduction)
