

#### Data I/O and Packages ####

# In this lecture, we are going to write our fake school data to a .csv file
# and then read the data back in to another R object. 

# Lets read in some data (first make sure your working directory is set to the
# folder where the data are stored):
# The easiest way to set your working directory is to go to:
# Session -> Set Working Directory -> Choose Directory... and select the folder
# where you would like to set it.
# This is my working directory:
setwd("c:/Users/E sol Cho/Binghamton/coursework/2022/RCrashCourse_S2022")


# If I wanted to save some data using the save() function, this is where it
# would go:
my_vec <- 1:1000
save(my_vec, file = "my_vec.RData")

# Your working directory is also the place where R goes to look for data when
# you try to load it in. If I were to now clear my environment and then try to
# load in the data, we see that it would work:

# Works!
rm(list = ls())
load("my_vec.RData")


### Working With .csv Files Using Base R ###

# Create some fake data!
student_id <- c(1:10)
grades <- c("A","B","C","A","C","F","D","B","B","A")
class <- c(rep(0,times = 5),rep(1,times = 5))
free_lunch <- rep(TRUE,times = 10)

# Put it in a data.frame
my_data <- data.frame(student_id,
                      grades,
                      class,
                      free_lunch,
                      stringsAsFactors = FALSE)

# Set column names
colnames(my_data) <- c("Student_ID", "Grades","Class","Free_Lunch")

# We make use of the 'write.csv()' function here. Make sure you do not write row
# names, this can really mess things up as it adds an additional column and is
# generally confusing:
write.csv(my_data,
          file = "school_data.csv",
          row.names = FALSE)

# Now we are going to read the data back in from the .csv file we just created.
# You should make sure that you specify the correct separator (the 'write.csv()'
# function defaults to using comma separation). I also always specify
# 'stringsAsFactors = FALSE' to preserve any genuine string variables I read in.
school_data <- read.csv(file = "school_data.csv",
                        stringsAsFactors = FALSE, # Always!!!
                        sep = ",")


## Other Data Formats ##

# We will need to load a package in order to read in excel data. This will
# extend the usefulness of R so that we can now read in .xlsx files among other
# types.

# First we need to download the 'rio' package, we can either do this manually
# or by using the package manager in base R. You can check this package out by
# visiting the development Github page: https://github.com/leeper/rio. You need
# to make sure you select 'dependencies = TRUE' so that you download the other
# packages that your package depends on, otherwise it will not work! Here is the
# manual way of installing an R package:
#install.packages("rio", dependencies = TRUE)

# Now we have to actually load the package so we can use it. We do this using
# the library() command:
library(rio)

# Write our school children data to an .xlsx file:
export(my_data, "school_data.xlsx")

# Now we can read in our data from the excel file:
excel_school_data <- import("school_data.xlsx")

# We can do the same thing for Stata .dta files:

# Write data to a .dta file:
export(my_data, "school_data.dta")

# Then read it back in:
stata_school_data <- import("school_data.dta")


## RData files ##

# Finally we may want to read and write our data to an .RData file that can hold
# everything in our workspace, or just a single variable.

# Save the data:
save(my_data, file = "Object.RData")

# Load the data:
load(file = "Object.RData")



#### Data Visualization ####

# In this example, we are going to create four different types of plots using 
# the ggplot function. Ggplot2 is a R package dedicated to data visualization.
# It can improve both the quality and aesthetics of your graphics. 
# Here's the ggplot2 cheat sheet: 
# https://github.com/rstudio/cheatsheets/blob/main/data-visualization-2.1.pdf

setwd("c:/Users/E sol Cho/Binghamton/coursework/2022/RCrashCourse_S2022")
setwd("/Users/yang/Downloads/drive-download-20220226T181306Z-001")
# First we need to download and load the 'ggplot2' package. 
#install.packages('ggplot2') 
library(ggplot2)

# Import a csv-format file to create plots:
dat <- read.csv("data_ggplot_1.csv", stringsAsFactors = FALSE, header = TRUE) 

# When we read in the data, the first thing we would do is to check whether it 
# is properly imported. To this end, we can either browse a whole dataset by 
# creating a separate window or have a look at the first several rows of it.

# Take a look at the whole dataset by creating a separate window
View(dat)
# One easy way is to go to Environment -> click 'dat' (name of the data imported)

# Take a look at the first 6 rows with a header. If there are a specific number 
# of rows you want to see, then you can plug in the number inside the head().
head(dat)
head(dat,10)

# Variables in the dataset:
# ctryname         Country name
# year
# cowcode          Country numeric code
# illtreatment     Sum of reported illtreatment cases (ITT)
# RstrctAccess     Amnesty reports restricted acess to detainees (ITT)
# wdi_aid          Net aid amounts received (Constant USD)  (WDI)
# wdi_gr           Government Revenue (% of GDP) (WDI)
# wdi_pop          Population (WDI)
# van_index        Vanhanen's indicators of democratization 
# dumAsia 
# dumAfrica
# dumEurope
# dumNAmerica
# dumLAmerica      Regional dummies
# lngdp            Logged GDP (WDI)
# polity2          Political regimes (Autocracy, Anocracy, democracy)
# polity.category  Autocracy, Anocracy, democracy
# illtrmt.category low, middle, high  



### Scatter plots ###

# We create scatter plots when we want to explore the relationship between two 
# variables. I.e., Is there a positive, negative or no relationship b/n x and y?


# In this example, one might expect the more aid countries receive, the more 
# violence that the governments are going to use to their citizens. It is 
# because the states less likely depend on tax monies as they are given more aid.
# As a result, they may no longer need to be nice to their citizens and thus 
# use more violence against them. To examine this, we can create a scatter plot.

# To create a scatter plot, add +geom_point() that allows plotting dots. We will
# display the aid amounts on the x-axis and the number of illtreament cases by 
# governments on the y-axis. NAs will be dropped when the plot is created. 
ggplot(dat, aes(x = log(wdi_aid), y = illtreatment)) + 
  geom_point() 

# Add + geom_smooth(method=lm) to see a relationship between x and y. You can 
# see that there's a slight positive relationship between aid and illtreatment
# as expected:
ggplot(dat, aes(x = log(wdi_aid), y = illtreatment)) + 
  geom_point() + geom_smooth(method=lm) 


### Histograms ###

# We can create histograms when we want to see the distribution of a variable.
# In this example, we want to see the distribution of illtreatment cases made
# in the sample countries in our dataset. As mentioned earlier, the ggplot()
# automatically drops NAs when plotted but you can manually exclude missing 
# observations by using the subset() function. is.na() allows us to verify 
# whether the given observation is NA or not. !is.na() means that we want to 
# include the non-NA values (=non-missing values) only when creating our graph.
# To create a histogram, add +geom_histogram().
ggplot(data=subset(dat, !is.na(illtreatment)), aes(illtreatment)) + 
  geom_histogram()



# One good way to pull out more meaningful information is display distributions 
# by groups. In our dataset, we have a variable named 'polity.category' that 
# captures governments' regime types. We are going to create three histograms of
# the illtreatment variable for democracy, anocracy, and autocracy separately 
# and compare their distributions.  
ggplot(data=subset(dat, !is.na(illtreatment)&!is.na(polity.category)), 
       aes(illtreatment)) +  geom_histogram(aes(group=polity.category)) + 
       facet_wrap(~ polity.category)
# Interestingly, we can see that not only autocracies but also democracies 
# present a large number of governments' illtreatments against their citizens.   
# One possible explanation is higher transparency in democracies that 
# makes more illtreatment cases reported. 


# To make the graph more informative, we can set labels for x and y and a title.   
ggplot(data=subset(dat, !is.na(illtreatment)&!is.na(polity.category)), 
       aes(illtreatment)) +  geom_histogram(aes(group=polity.category)) + 
       facet_wrap(~ polity.category) +
       xlab("Number of Illtreatment Events") + # Create a label for x-axis 
       ylab("Count")+                          # Create a label for y-axis
       ylim(0,200)+    # set a limit for the range of y-axis from 0 to 200 
       ggtitle("The Number of Illtreatment Events by Political Regimes")  
       # Set a title for the plot

        
        
### Bar Charts ###

# We can create bar charts when we want to present the frequency of the values 
# of a categorical variable. In this example, we are going to use the polity.
# category variable, which is composed of three regime categories: 
# democracy, anocracy, and autocracy and check out each category's frequency.
# fill=polity.category: To fill the bar color by category. 
# theme_bw(): To set background color as white.
ggplot(data=subset(dat, !is.na(polity.category)), aes(polity.category)) +
  geom_bar(aes(fill=polity.category), position = 'dodge') + 
  theme_bw()+ labs(x=NULL) # To remove x-label



### Box Plots ###  

# Let's import another dataset in a CSV-format:
dat <- read.csv("data_ggplot_2.csv", stringsAsFactors = FALSE, header = TRUE) 
# To check the first six rows of the data loaded.
head(dat)

# We can create box plots when we want to get a sense of how the variable is
# distributed: e.g., to see the range, mean, median, minimum, and maximum values.
# In this example, we are going to explore the number of civilian deaths inside
# the DR Congo by province. There are 11 provinces in the DR Congo.


# Below, you can see the information on the variables in the dataset.

# Variables in the dataset:
# identifier      A unique identifier 
# province        Province names, DRC
# rebcompetition  A level of competition among rebel groups in a province
# civiliandeaths  The number of civilian deaths by rebel attacks
# totalaid        The amount of aid given to a province


ggplot(subset(dat, !is.na(province)&!is.na(civiliansdeaths)), 
       aes(province, civiliansdeaths), all.outliers=T) + 
  geom_boxplot(notch = F, aes(color=province)) + ylim(0,5000) +
  ggtitle("Civilian Deaths by Province, DRC") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))  +
  labs (colour = NULL, x ="Province", y =  "The Number of Civilian Deaths" ) 

# From the figure, we can find that Katanga, North and South Kivus, and Oriental 
# provinces indicate high civilian attacks by looking at the location of maximum
# Dots indicate outliers, indicating an extremely larger number of attacks.




## Leaflet(): Creating an interactive map to visualize geo-referenced data ##
install.packages("tidyverse")
# Packages to load
library(leaflet)
library(dplyr)
library(tidyverse)

dat <- read.csv("UCDP_georeferenced.csv", stringsAsFactors = FALSE, 
                sep = ",")
head(dat)
dim(dat)

# Let's begin with a simple example!

newmap <- leaflet() %>%
  addTiles() %>%  ##  the default base map
  setView(30, 1.5, zoom = 7) %>% ## The view centered to the lat and lon passed.
  addMarkers(lng=30.24842, lat=1.562500, popup="This is Bunia town in Ituri province. 
            There was an armed conflict between Hema and Lendu in 01/01/2000-01/31/2000. 
            No civilian deaths captured. You can read more about the Ituri conflict 
            <a href='https://en.wikipedia.org/wiki/Ituri_conflict'>HERE</a>.")

newmap


# We are going to differentiate the color of violence dots by region by manually 
# creating a color palette. 
data.frame(table(dat$adm_1))
colorpal <- colorFactor(palette = c("blue", "red", "darkgreen", "darkgrey", 
                                    "purple","yellow","orange", "brown","pink",
                                    "black"), 
                        domain=c("Bas Congo province","Equateur province","Ituri province",
                                 "Kasai Occidental province","Kasai Oriental province",
                                 "Katanga province","Maniema province","Nord Kivu province",
                                 "Orientale province","Sud Kivu province"))


drcmap <- leaflet(dat) %>% 
  addProviderTiles(providers$CartoDB.Positron) %>% ## to specify the basemap
  setView(25, -3, zoom = 5) %>% ## The view centered to the lat and lon passed.
  addCircleMarkers(~longitude, ~latitude, popup=dat$side_a, weight = 3, radius=5, 
                   color=~colorpal(adm_1), stroke = F, fillOpacity = 0.8)  %>%
  addLegend("bottomright",
            colors = c("blue", "red", "darkgreen", "grey", 
                       "purple","yellow","orange", "brown","pink",
                       "black"), 
            labels=c("Bas Congo","Equateur","Ituri","Kasai Occidental",
                     "Kasai Oriental","Katanga","Maniema","Nord Kivu",
                     "Orientale","Sud Kivu"), title="Provinces", opacity=0.8)

drcmap


# To export the figure
# Click on `Export` and then `Save as a Web Page`. Put in a name, but make sure 
# that it ends with .html. Now that file can be loaded on to a server and will
# retain all of its interactive properties online.
install.packages("htmlwidgets") 
library(htmlwidgets)

saveWidget(widget = drcmap,
           file = "drc_violence_map_UCDP.html",
           selfcontained = TRUE)  