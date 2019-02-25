## Exercise 10: If statement

Create the script "exercise10.R" and save it to the "Rcourse/Module2" directory: you will save all the commands of exercise 10 in that script.
<br>Remember you can comment the code using #.


<details>
<summary>
correction
</summary>

```{r}
getwd()
setwd("~/Rcourse/Module2")
```

</details>


**1- Create vector as:**


```{r}
vec2 <- c("kiwi", "apple", "pear", "grape")
```

* Use an if statement and the %in% function to check whether "apple" is present in vec2 (print that there is an apple!)

<details>
<summary>
correction
</summary>

```{r}
if("apple" %in% vec2){
	print("there is an apple there")
}
```

</details>

* Use an if statement and the %in% function to check whether "grapefruit" is present in vec2: if "grapefruit" is not found, test for a second condition (using **else if**) that checks if "pear" is found.

<details>
<summary>
correction
</summary>

```{r}
if("grapefruit" %in% vec2){
        print("there is a grapefruit there")
}else if("pear" %in% vec2){
	print("there is no grapefruit but there is a pear")
}
```

</details>

* Add an **else** section in case neither grapefruit nor pear is found in vec2.

<details>
<summary>
correction
</summary>

```{r}
if("grapefruit" %in% vec2){
        print("there is a grapefruit there")
}else if("pear" %in% vec2){
        print("there is no grapefruit but there is a pear")
}else{
	print("there is neither grapefruit nor pear")
}
```

</details>

**2- If statement in for loop**

Create the following matrix:

```{r}
mat4 <- matrix(c(2, 34, 1, NA, 89, 7, 12, NA, 0, 38),
	nrow=5)
```

Loop over rows with **for** of mat4 and print row number and entire row **if** you find an NA.


<details>
<summary>
correction
</summary>

```{r}
for(k in 1:nrow(mat4)){
	# extract row
	rowk <- mat4[k,]
	if(any(is.na(rowk))){
		print(k)
		print(rowk)
	}
}
```

</details>


> Go to [Lists](https://sbcrg.github.io/CRG_RIntroduction/list).

> [back to home page](https://sbcrg.github.io/CRG_RIntroduction)
