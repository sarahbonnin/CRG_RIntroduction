## Exercice 1. Getting started.

Create the script "exercise1.R" (in R Studio: File -> New File) and save it to the "Rcourse/Module11" directory: you will save all the commands of exercise 1 in that  script.
Remember you can comment the code using #.

1. From the terminal, go to Rintro/day1.
First check where you currently are with getwd(); 
then go to Rintro/day1 with setwd()

<details>

```{r}
getwd()
setwd("Rcourse/Module1")
setwd("/users/bi/sbonnin/Rcourse/Module1")
```

</details>



<details><summary>CLICK ME</summary>
<p>

#### yes, even hidden code blocks!

```python
print("hello world!")
```

</p>
</details>




2. Using R as a calculator, calculate the square root of 654.
```{r}
sqrt(654)
```

3. Using R as a calculator, calculate the percentage of males and females currently present in the classroom.
```{r}
(14/18) * 100
(4/18) * 100
```

4. Create a new object myobject with value 60.
Show myobject in the console.
```{r}
myobject <- 60
myobject
```

5. Reassign myobject with value 87.
```{r}
myobject <- 87
```

6. Subtract 1 to myobject. Reassign.
```{r}
myobject <- myobject - 1
```
7. Create a new object mysqrt that will store the square root of myobject.
```{r}
mysqrt <- sqrt(myobject)
```

8. Create a new object mydiv that will store the result of myobject divided by mysqrt.
```{r}
mydiv <- myobject / mysqrt
```

