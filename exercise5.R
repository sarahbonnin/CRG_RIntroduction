## Exercise 5. Data frame manipulation.

# Create the script "exercise5.R" (in R Studio: File -> ) 
# and save it to the "Rintro/day2" directory: 
# you will save all the commands of exercise 5 in that  script.
# Remember you can comment the code using #.

# 1. Create the following data frame df:
# Row names are John, Jessica, Steve, Rachel.
# Column names are Age, Height, Sex.
df <- data.frame(Age=c(43, 34, 22, 27), 
                 Height=c(181, 172, 189, 167),
                 Sex=c("M", "F", "M", "F"),
                 row.names = c("John", "Jessica", "Steve", "Rachel"))

# 2. Check the structure of df with str().
str(df)

# 3. What are the average age and height in this table?
# Try different approaches:
  # - Calculate the average for each column separately.
mean(df$Age); mean(df$Height)
  # - Calculate the average of both columns simultaneously using the apply() function.
apply(df[,-3], 2, mean)
apply(df[,1:2], 2, mean)
apply(df[,-grep("Sex", colnames(df))], 2, mean)

# 4. Add one entry to df2: Georges who is 53 years old and 168 tall.
df <- rbind(df, Georges=c(53, 168, "M"))

# 5. Change the row names of df so the data becomes anonymous: 
# use Patient1, Patient2, etc. 
rownames(df) <- c("Patient1", "Patient2", "Patient3", "Patient4", "Patient5")
rownames(df) <- paste("Patient", 1:5, sep="")

# 6. Create the data frame df2 that is a subset of df:
# it will contain only the female entries.
df2 <- df[df$Sex=="F",]
  
# 7. Create the data frame df3 that is a subset of df: 
# it will contain only entries of males taller than 170.
df3 <- df[df$Sex=="M" & df$Height > 170,]


## Exercise 5b - OPTIONAL

# 1. Create two data frames mydf1 and mydf2. 
# Column names are respectively ???id???, ???age??? and ???id???, ???name???
mydf1 <- data.frame(id=1:4, age=c(14,12,15,10))
mydf2 <- data.frame(id=1:5, name=c("paul", "helen", "emily", "john", "mark"))

# 2. Merge mydf1 and mydf2 by their ???id??? column.
merge(x=mydf1, y=mydf2, by.x="id", by.y="id")
mydf3 <- merge(x=mydf1, y=mydf2, by="id")

# 3. Order mydf3 by decreasing age.
mydf3[order(mydf3$age, decreasing = TRUE), ]

## Exercise 5c ??? OPTIONAL

# 1. Copy file ???/nfs/users/bi/sbonnin/genes_dataframe.RData??? 
# in your current directory with the file.copy() function.
file.copy("/nfs/users/bi/sbonnin/genes_dataframe.RData", ".")

# 2. The function dir() lists the files and directories present in the 
# current directory: check if ???genes_dataframe.RData??? was copied.
dir()

#3. Load the ???genes_dataframe.RData??? in your environment:
load("genes_dataframe.RData")

# 4. ???genes_dataframe.RData??? contains the df_genes object: 
# is it now present in your environment?
ls()

# 5. Check some characteristics of df_genes and see what it contains: 
str(df_genes); head(df_genes); dim(df_genes); colnames(df_genes)

# 6. Select rows for which pvalue_KOvsWT < 0.05 AND
# log2FoldChange_KOvsWT is > 0.5. Store in the up object.
up <- df_genes[df_genes$pvalue_KOvsWT < 0.05 & 
                 df_genes$log2FoldChange_KOvsWT > 0.5,]
# How many rows (genes) were selected?
nrow(up)

# 7. Select from the up object the ???Zinc finger protein??? coding genes 
# (i.e. the gene symbol starts with Zfp). Use the grep() function.
up[grep("Zf", up$gene_symbol), ]

# 8. Select rows for which pvalue_KOvsWT < 0.05 AND 
# log2FoldChange_KOvsWT is > 0.5 OR < -0.5. 
# What about giving the abs() function a try? 
# Store in the diff_genes object.
diff_genes <- df_genes[df_genes$pvalue_KOvsWT < 0.05 & 
                 abs(df_genes$log2FoldChange_KOvsWT) > 0.5,]
# How many rows (genes) were selected?
