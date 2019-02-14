## Exercice 4. Matrix manipulation.

# Create the script "exercise4.R" 
# and save it to the "Rintro/day2" directory: 
# you will save all the commands of exercise 4 in that  script.
# Remember you can comment the code using #.

# 1. Create three numeric vectors x, y, z, 
# each of 4 elements of your choice.
x <- 2:5
y <- 6:9
z <- 7:4
# Use rbind() to combine the three vectors to become the matrix mat 
# (3 rows and 4 columns) where each row represents a vector. 
mat <- rbind(x, y, z)

# 2. Create the same matrix with a different approach: 
# the matrix() function.
mat <- matrix(data=c(x, y, z), nrow=3, ncol=4, byrow=TRUE)

# 3. Change the column names of mat to ???a???, ???b???, ???c???, ???d???.
colnames(mat) <- c("a", "b", "c", "d")

# 4. Calculate the sum of each row, and the sum of each column.
rowSums(mat); colSums(mat)

# 5. Create the matrix mat2:
# What does function seq() do?
mat2 <- matrix(c(seq(from=1, to=10, by=2), 5:1, rep(x=2017, times=5)), ncol=3)

# 6. What are the dimensions of mat2 (number of rows and number of columns)?
dim(mat2); nrow(mat2); ncol(mat2)

# 7. Change the column names of mat2 to "day", "month" and "year".
colnames(mat2) <- c("day", "month", "year")

# 8. Change the row names of mat2 from ???A??? to ???E???.
rownames(mat2) <- LETTERS[1:5]

# 9. Shows rows of mat2 if the month column is superior or equal to 3.
mat2[mat2[,"month"] > 3,]

# 10. Replace all elements of mat2 that are equal to 2017 with 2018.
mat2[mat2==2017] <- 2018

# 11. Multiply all elements of the 2d column of mat2 by 7. Reassign.
mat2[,2] <- mat2[,2] * 2

# 12. Add one column "time" to mat2 that contains values 8, 12, 11, 10, 8.
# Save in the new object mat3.
mat3 <- cbind(mat2, time=c(8, 12, 11, 10, 8))

# 13. Replace all elements of mat3 that are inferior to 3 by NA.
mat3[mat3 < 3] <- NA

# 14. Remove rows from mat3 if a NA is present. Save in mat 4.
mat4 <- na.omit(mat3)

# 15. Retrieve the minimum value of each column of mat4.
# Try different approaches:
# - Retrieve the minimum for each column separately.
min(mat4[,"day"]); min(mat4[,"month"]); min(mat4[,"year"]); min(mat4[,"time"])
# - Retrieve the minimum of all columns simultaneously using the apply() function.
apply(mat4, 2, min)



