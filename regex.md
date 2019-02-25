<h2>Regular expressions</h2>

Regular expressions are tools to **describe patterns in strings**.

<h3>Find simple matches with grep</h3>

* Find a pattern anywhere in the string (outputs the index of the element):

```{r}
# By default, outputs the index of the element matching the pattern
grep(pattern="Gen", 
	x="Genomics")
```

* Show actual element where the pattern is found (instead of the index only):

```{r}
# Set value=TRUE
grep(pattern="Gen", 
        x="Genomics",
	value=TRUE)
```

* Non case-sensitive search:

```{r}
# Enter the pattern in lower-case, but case is ignores with ignore.case=TRUE
grep(pattern="gen",
        x="Genomics",
        value=TRUE,
	ignore.case=TRUE)
```

<h3>Special characters used for pattern recognition:</h3>

| $ | Find pattern at the end of the string |
| ^ | Find pattern at the beginning of the string |
| {n} | The previous pattern should be found exactly n times |
| {n,m} | The previous pattern should be found between n and m times|
| + | The previous pattern should be found at least 1 time |
| * | One or more allowed, but optional |
| ? | One allowed, but optional |


* Match anything contained between brackets at least once: here, match any element that contains either "g" or "t":

```{r}
grep(pattern="[gt]+", 
	x=c("genomics", "proteomics", "transcriptomics"), 
	value=TRUE)
```

* Match anything contained between brackets at least once AND at the start of the element:

```{r}
grep(pattern="^[gt]+",
        x=c("genomics", "proteomics", "transcriptomics"),
        value=TRUE)
```

* Create a vector of email addresses:

```{r}
vec_ad <- c("marie.curie@yahoo.es", "albert.einstein01@hotmail.com", 
	"charles.darwin1809@gmail.com", "rosalind.franklin@aol.it")
```

* Keep only email addresses finishing with "es":

```{r}
grep(pattern="es$",
        x=vec_ad,
        value=TRUE)
```

<h3>Substitute or remove matching patterns with gsub</h3>

From the same vector of email addresses:

* Remove the "@" symbol and the email provider from each address

```{r}
gsub(pattern="@[a-z.]+",
        replacement="",
        x=vec_ad)
```

* Substitute the "@" symbol with "_at_"

```{r}
gsub(pattern="@",
        replacement="_at_",
        x=vec_ad)
```


<h3>Predefined variables to use in regular expressions:</h3>

| [:lower:] | Lower-case letters |
| [:upper:] | Upper-case letters |
| [:alpha:] | Alphabetic characters: [:lower:] and [:upper:] |
| [:digit:] | Digits: 0 1 2 3 4 5 6 7 8 9 |
| [:alnum:] | Alphanumeric characters: [:alpha:] and [:digit:] |
| [:print:] | Printable characters: [:alnum:], [:punct:] and space. |
| [:punct:] | Punctuation characters: ! " # $ % & ' ( ) * + , - . / : ; < = > ? @ [ \ ] ^ _ ` { &#124; } ~ |
| [:blank:] | Blank characters: space and tab |


* Take the previous character vector containing email addresses:
	* Remove the @ and the email provider from each address
```{r}
gsub(pattern="@[[:lower:][:punct:]]+", 
	replacement="", 
	x=vec_ad)
```
	* Same thing but remove additionally any number BEFORE the @
```{r}
gsub(pattern="[[:digit:]]*@[[:lower:][:punct:]]+",
        replacement="",
        x=vec_ad)
```
	* Same but simplified
```{r}
gsub(pattern="[[:digit:]]*@[[:print:]]+",
        replacement="",
        x=vec_ad)
```

<h3>Use grep and regular expressions to retrieve columns by their names</h3>

Example of a data frame:

```{r}
# Build data frame
df_regex <- data.frame(expression1=1:4, 
	expression2=2:5, 
	expression3=4:7, 
	annotation=LETTERS[1:4], 
	expression4=6:3, 
	average_expression=c(3.25, 3.75, 4.25, 4.75),
	stringsAsFactors=FALSE)

# Select column names that start with "expression"
grep(pattern="^expression", colnames(df_regex))

# Select columns from df_regex if their names start with "expression"
df_regex[, grep(pattern="^expression", colnames(df_regex))]
```

Go to [Exercise 8](https://sbcrg.github.io/CRG_RIntroduction/exercise8): Regular expressions.
<br>

> [back to home page](https://sbcrg.github.io/CRG_RIntroduction)
