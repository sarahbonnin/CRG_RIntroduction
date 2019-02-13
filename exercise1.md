## Exercice 1. Basics in R

# Create the script "exercise1.R" (in R Studio: File -> New File) 
# and save it to the "Rintro/day1" directory: 
# you will save all the commands of exercise 1 in that  script.
# Remember you can comment the code using #.

#From the console:
1. Go to Rintro/day1.
First check where you currently are with getwd(); 
then go to Rintro/day1 with setwd()
<details><summary>correction</summary>
<p>
```{r}
getwd()
setwd("Rintro/day1")
setwd("/users/bi/sbonnin/Rintro/day1")
```
</p>
</details>
# 2. Using R as a calculator, calculate the square root of 654.
sqrt(654)

# 3. Using R as a calculator, calculate the percentage 
# of males and females currently present in the classroom.
(14/18) * 100
(4/18) * 100

# 4. Create a new object myobject with value 60.
# Show myobject in the console.
myobject <- 60
myobject

# 5. Reassign myobject with value 87.
myobject <- 87

# 6. Subtract 1 to myobject. Reassign.
myobject <- myobject - 1

# 7. Create a new object mysqrt that will store 
# the square root of myobject.
mysqrt <- sqrt(myobject)

# 8. Create a new object mydiv that will store 
# the result of myobject divided by mysqrt.
mydiv <- myobject / mysqrt


