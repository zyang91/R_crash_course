setwd("/Users/yang/Downloads/drive-download-20220226T181306Z-001")

#### Getting to Know Your Data ####

# In this lecture, we are going to do some basic data analysis using the World
# Bank data and make statistical inference from data. This dataset includes 
# variables as below:
# year
# country
# cowc          Country code
# gdp           GDP (Gross Domestic Product)
# gdppc         GDP per capita (= GDP/Population)
# gdppc.growth  GDP per capita growth


# Let's read in some data (first make sure your working directory is set to the
# folder where the data are stored):
# The easiest way to set your working directory is to go to:
# Session -> Set Working Directory -> Choose Directory... and select the folder
# where you would like to set it.
# This is my working directory:
setwd("c:/Users/E sol Cho/Binghamton/coursework/2022/RCrashCourse_S2022")

# We import the WB dataset and use the head() function to return the first 
# several rows to see whether the dataset is properly imported. 
dat <- read.csv("data_analysis.csv", stringsAsFactors = FALSE, header = TRUE) 
head(dat)

# We can find the length of the data we imported: the dimension function returns
# the lengths of rows and columns of the dataset.
dim(dat) # It has 12591 observations with 8 variables. 

# We can choose to drop NAs in the dataset.
dat <- na.omit(dat)
# Now the dataset has 6792 observations.
dim(dat)



# To figure out what data tells us, the first thing we do as we read in the data
# is to obtain descriptive statistics of it. Summary statistics include mean, 
# median, standard deviation, variance, minimum, maximum, range, and quantile.

# The psych package allows us to obtain such central tendency information, so we
# install and load the package as below:
#install.packages("psych")
library(psych)
# The describeBy() returns the descriptive statistics of the dataset.
describeBy(dat)

# From the output, we can see that the year ranges from 1961 to 2016 by looking at 
# min and max. However, the country, cowc, and region variables are characters, 
# not numbers. We can also find the frequency of the values of string variables 
# by using the table() function.
table(dat$country) # or, ftable
data.frame(table(dat$country)) # Check the number of rows: We have 162 countries.

# We could also obtain the summary statistics by 'group'. In this example, we 
# find this information for each country by plugging in the country variable.  
describeBy(dat, dat$country)


# Another package to use to obtain the summary statistics.

#install.packages("modelsummary")
library(modelsummary)
#datasummary(): Flexible function to create custom tables using 2-sided formulae.
#datasummary_balance(): Group characteristics (e.g., control vs. treatment)
#datasummary_correlation(): Table of correlations.
#datasummary_skim(): Quick summary of a dataset.
#datasummary_df(): Create a table from any dataframe.
#datasummary_crosstab(): Cross tabulations of categorical variables.

datasummary_skim(dat)
datasummary_skim(dat, type="categorical")


# We can also obtain the summary statistics of a specific variable using $. In
# this example, we focus on the GDP per capita.
summary(dat$gdppc) # Summary() returns min, quantile, median, mean, max.


# We also create a histogram to see the distribution of the variable. In the 
# last lecture, we generated the graphic by using the ggplot() function but the
# easiest way to do that is to use the built-in function: hist().
hist(dat$gdppc) 

# The figure shows that the distribution of GDP per capita is heavily skewed. 
# Most observations are clustered around zero and a few observations are sparsely
# distributed around the right tail of the graph which makes it longer than the
# left tail. This suggests that a large number of individuals in the world are 
# in extreme poverty. However, a few extremely rich individuals pull up the mean 
# to the right. It's the reason why in the summary statistics for GDP per capita, 
# mean is greater than median.

# One thing we can do further is to subset the data by region. In this example, 
# we compare the GDP per capita between Southern Africa and Northern Europe.
# The subset() returns a sub-sample by the condition we make.
dat.sa <- subset(dat, dat$region=="Southern Africa") 
dat.ne <- subset(dat, dat$region=="Northern Europe")


# What does the summary information of each region tell us?
summary(dat.sa$gdppc)  
summary(dat.ne$gdppc)
# First, the mean of NE's GDP per capita is 10 times greater than that of SA.
# Also, the maximum GDP per capita in SA is below the median and average of NA.

# However, if we focus on the GDP per capita of SA across years, we can see that
# the values per se have increased over time. What do you think?
barplot(height=dat.sa$gdppc, names=dat.sa$year) # Returns a bar chart.

# Lastly, we can use the tapply() function to obtain a specified summary statistic
# of a specific variable by group. 
tapply(dat$gdppc, dat$country, median, na.rm=TRUE) # Returns the mean gdppc by country




