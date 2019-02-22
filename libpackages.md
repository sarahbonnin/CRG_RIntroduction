<h2>Library and packages</h2>

* **Packages** are collections of R functions, data, and compiled code in a well-defined format.

* The directory where packages are stored is called the **library**.

*Source of definitions: http://www.statmethods.net/interface/packages.html*

<h3>R base</h3>

A set a standard packages which are supplied with R by default.<br>
Example: package base (write, table, rownames functions), package utils (read.table, str functions), package stats (var, na.omit, median functions).

<h3>R contrib</h3>

All other packages:

* [CRAN](https://cran.r-project.org): Comprehensive R Archive Network
	+ 13735<sup>*</sup> packages available
	+ find packages in https://cran.r-project.org/web/packages/
	<img src="images/cran_packages.png" width="550"/>
* [Bioconductor](https://www.bioconductor.org/):
	+ 1649<sup>*</sup> packages available
	+ find packages in https://bioconductor.org/packages
	<img src="images/bioc_packages.png" width="550"/>

*<sup>*</sup>As of February 2019*

<h4>Bioconductor</h4>

Set of R packages specialized in the analysis of bioinformatics data.<br>

Bioconductor supports most types of genomics and NGS data (e.g. limma, DESeq2, BayesPeak) and integrates:
* Specific data classes (e.g. Granges from GenomicRanges)
* Integrates command line tools (e.g Rsamtools)
* Annotation tools (e.g. biomaRt)

There are different types of Bioconductor packages:
* Software: set of functions
	+ e.g. DESeq2 (NGS data analysis)
* Annotation: annotation of specific arrays, organisms, events, etc.
	+ e.g. BSgenome.Hsapiens.UCSC.hg38
* Experiment: data that can be loaded and used
	+ e.g. ALL (acute lymphoblastic leukemia dataset)

<h3>Install a package</h3>

* With RStudio:
<img src="images/bioc_install.png" width="550"/>

* From the console:
```{r}
install.packages(pkgs="ggplot2")
```

* Install a bioconductor package:
	+ For R version >= 3.5.0
```{r}
# Install Bioconductor package manager
install.packages(pkgs="BiocManager")
# Install Bioconductor package
BiocManager::install("DESeq2")
```
	+ For older R versions
```{r}
# Source (load into environment) script containing biocLite function
source("http://www.bioconductor.org/biocLite.R")
# Use biocLite function to install Bioconductor package
biocLite("DESeq2")
```

<h3>Load a package</h3>

* With RStudio:
<img src="images/bioc_load.png" width="450"/>

* From the console:
```{r}
library("ggplot2")
```

<h3>Check what packages are currently loaded</h3>

```{r}
sessionInfo()
```

<h3>List functions from a package</h3>

* With RStudio <br>

<img src="images/rstudio_ggplot2.png" width="450"/>

* From the console
```{r}
ls("package:ggplot2")
```

<h3>RStudio server at CRG</h3>

If you can't install packages (permission issues), you first need to specify a writeable directory to install the packages into.<br>

Follow the steps below:

```{r}
# Go to your home directory
setwd("~")
# Create a directory where to store the packages
dir.create("R_packages")
# Add directory location to the library path
.libPaths("~/R_packages/")
```

> Go to [Exercise 7](https://sbcrg.github.io/CRG_RIntroduction/exercise7): Library and packages.

> [back to home page](https://sbcrg.github.io/CRG_RIntroduction)

