

#### Basic R Programming ####


### Part 1: Variables, Comments, and Math ###


## Commenting ##

# Commenting: wherever you insert a '#', everything that comes after it will be
# ignored when entered into the R console. This means you can leave notes to
# yourself about what each line of code does, or 'comment out' lines of code you
# are no longer using. I make extensive use of comments in all of my code. You
# should too!


## Removing Variables, Setting Working Directory ##

# Clearing your workspace: this removes all data and variables current in your
# 'R Environment'. As you will see, when you create variables they will continue
# to be available to you for the rest of your R session once you have made them,
# unless you remove them from memory. The line of code below will remove
# everything from memory. This can be useful if you want to rerun several
# different scripts without closing R after using each one.
rm(list = ls())

# Set your working directory -- This is where R goes to look for files and save
# stuff by default. You will need to do this for each computer you run your
# script file on. 
# In RStudio, you can go to 'Session' -> 'Set Working Directory'
# -> 'Choose Directory', and select a folder from a drop down menu. For me, this
# looks like:
setwd("c:/Users/E sol Cho/Binghamton/coursework/2022/RCrashCourse_S2022")
getwd()


## Basic Math ##

# Addition:
123 + 4567

# Subtraction:
23693 - 4536

# Multiplication:
23 * 45

# Division:
51/3

# Exponents:
2^4

# Logarithms (base e):
log(100)
log10(100)


## Creating Variables ##

# Assign a value to a variable (remember to use no spaces or symbols other than
# . or _ in your variable name):
my_value <- 24

# Create a vector using the concatenation operator 'c()'. This is our first
# example of a variable that can hold multiple values:
my_vector <- c(5,34,76,13)

# Entering the variable into your console shows you its contents:
my_vector

# We can also us the ':' operator to give us all numbers in a range (in this
# case between 1 and 10):
my_vector <- 35:50

# We can use the repeat or sequence function to create a vector. 
my_vector <- rep(0, times = 5) # Repeat 0 four times
my_vector <- seq(from=1, to=10, by=2) # in a range from 1 to 10, Increase by 2


# We can technically also use the '=' operator to assign values to variables,
# but this is typically considered bad form, because it is easy to confuse with
# the '==' operator. For now, lets stick to using '<-':
my_vector = 1:10

# We can index (get) elements of a vector by giving the position (as a positive
# integer) of the element in the vector. Note that all indexing in R starts from
# 1 and not zero, as in some other programming languages.
my_vector[5]


### Part 2: Comparison Operators ###

## The Basic Operators ##

5 < 6 # 5 is less than 6: returns TRUE
5 > 6 # 5 is not greater than 6: returns FALSE
5 == 5 # 5 is equal to 5: returns TRUE
5 != 6 # 5 is not equal to 6: returns TRUE
5 <= 5 # 5 is less than or equal to 5: returns TRUE


###################################
# Basic Arithmetic Operators in R #
###################################
# + To add 
# - To subtract 
# * To multiply 
# / To divides 
# < Less than
# > Greater than
# <= Less than or equal to
# >= Greater than or equal to
# == Exactly equal to
# != Not equal to
################################


## Comparisons with Variables ##

# R will also do its best to make two quantities comparable, even if one is a
# string and the other is a number:
5345 == "5345"


# However if we assign a value to a variable, then it will compare the value
# in the variable, not the name of the variable. This is also the first time
# we have seen variables. They have have any name composed of letters, '.' and,
# '_'. Variables can store lots of stuff --as we will see in future tutorials.
# In this example, we are assigning the number 5 to the variable 'i' using the
# assignment operator '<-':
i <- 5

i == "i" # 5 is not equal to "i": returns FALSE

# Now we assign a string ("i") to the variable 'i':
i <- "i"

i == "i" # "i" is equal to "i": returns TRUE



### Part 3: Printing ###

## The print() Function ##

x <- 5
y <- 6
z <- x + y  
z

print(z)

# The print function as a logical operator
print(z > 10) # z is greater than 10: returns TRUE

## The print() and cat() Functions ##

## cat() vs. print() ##

# The 'cat()' function will print things without "" marks around them, which
# often looks nicer, but it also does not skip to a new line if you call it
# multiple times inside of a function, or a loop. Lets try out both:
print("Hello World")
cat("Hello World")

# Now we can try them inside brackets to see how 'cat()' does not break lines:
{
  cat("Hello")
  cat("World")
}

{
  print("Hello")
  print("World")
}

# So we have to manually break lines with 'cat()' using the "\n" (newline)
# symbol:
{
  cat("Hello\n")
  cat("World")
}


## The 'paste()' Function, and Generating Informative Messages ##

# The 'paste()' function takes as many string, number or variable arguments as
# you want and sticks them all together using a user specified separator:

# Lets define a variable to hold the number of fingers we have:
fingers <- 10

# Now lets print out how many fingers we have:
print(paste("Hello,", "I have", fingers, "fingers", sep = " "))

# However, with 'cat()', we can just skip the paste part and it will print the
# stuff directly:
cat("Hello,", "I have", fingers, "Fingers", sep = " ")

# If we want 'cat()' to break lines while it is printing, we can also include
# the "\n" symbol at the end (or anywhere, for that matter):
cat("My Grocery List:", "\n", "1 dozen eggs\n",
    "1 loaf of bread\n 1 bottle of orange juice\n",
    "1 pint mass mocha", sep = " ")


### Using the help() Function ###

help(print)
help(sum)
?length


# Lets try out length() and sum():
my_vector <- c(1,2,3,4,5)
length(my_vector)
sum(my_vector)



#### Five Basic R Data Structures ####
rm(list = ls())

### Values and Vectors ###

# Assign a value to a variable (remember to use no spaces or symbols other than
# . or _ in your variable name):
my_value <- 24 # number
my_value <- "dog" # character

# Create a vector using the concatenation operator 'c()'. This is our first
# example of a variable that can hold multiple values:
my_vector <- c(5,34,76,13)
my_vector <- c("Sophie","Cali","Maisy")


# Entering the variable into your console shows you its contents:
my_vector

# We can also us the ':' operator to give us all numbers in a range (in this
# case between 1 and 10):
my_vector <- 1:10

# another useful tool is the rep() function, which allows us to repeat a
# specified value a given number of times in a vector:
repeated_values <- rep(23, times = 50)

# We can index (get) elements of a vector by giving the position (as a positive
# integer) of the element in the vector. Note that all indexing in R starts from
# 1 and not zero, as in some other programming languages.
my_vector[5]

# Another very useful function, 'length()' tells us the number of elements in a
# vector or list object (don't worry, we haven't gotten to lists yet):
length(my_vector)



### Matrices ###

# We can also create a matrix (can only hold one kind of data -- usually
# numbers) by using the 'matrix()' function:
my_matrix <- matrix(data = 1:10, # what gets stored in the matrix
                    ncol = 5, # the number of columns
                    nrow = 20, # the number of rows
                    byrow = TRUE) # how the input should be added to the matrix.
my_matrix

# We can also specify the input that we'd add to the matrix.
my_matrix2 <- matrix(data = c(0, 28, 1, 1, 11, 1, 0, 45, 1, 1, 20, 1), 
                     nrow=4,
                     ncol=3,
                     byrow= TRUE)
my_matrix2

# We can index the elements of matrices in a variety of ways:
my_matrix[1,] # rows come before the comma [row, column]
my_matrix[,5] # columns come after
my_matrix[3,3] # element in the 3rd row, 3rd column

# We can also mutate specific elements of the matrices.
my_matrix[2,3] <- 3
my_matrix

# There are some helpful functions we can use to learn more about a particular
# matrix:
sum(my_matrix) # the sum of the elements in the matrix.
nrow(my_matrix) # the number of rows in the matrix
ncol(my_matrix) # the number of columns in the matrix



### Data Frames ###

# Lets make some fake data!
student_id <- c(1:10)
grades <- c("A","B","C","A","C","F","D","B","B","A")
class <- c(rep(0,times = 5),rep(1,times = 5))
free_lunch <- rep(TRUE,times = 10)

# Now we can put the vectors we created above together to make a 'data.frame',
# one of the most commonly used data types in R. Data frames very useful because
# they can hold multiple types of values (e.g. text and numbers), and because
# columns are easy to index by name using the '$' operator (see below). They
# are also the most common input for most statistical packages and methods in R.
# Make sure to use the 'stringsAsFactors = FALSE' argument so that we do not
# turn our letter grades into factor variables (a kind of categorical variable
# that R likes). 
my_data <- data.frame(student_id,
                      grades,
                      class,
                      free_lunch,
                      stringsAsFactors = FALSE)
my_data

# we can also add columns to the data using the $ operator:
my_data$names <- c('susan','ted','bill','amy','matt','john','xyz','abc','w',
                   'jimbob')

my_data


# We can set column names if we like:
colnames(my_data) <- c("Student_ID", "Grades","Class","Free_Lunch", "Names")
my_data


# Indexing works the same as for matrices, but with a twist:
my_data[,1]
my_data[2,4]
my_data$Class # $ indexing for columns
my_data$Grades[3] # Treating $ indexed columns as vectors


### List Data Structures ###

# We can also create a list from objects. Note that we can name each entry in a
# list just as we would with a data.frame:
my_list <- list(num = 10,
                animal = "dog",
                vec = c(1:10),
                dat = my_data)
my_list


# We can also create an empty list and then populate it using the $ operator
my_list <- list()

# Now lets add stuff to our list!
my_list$current_temp <- 10
my_list$dat <- my_data
my_list$cool_car <- "Honda Civic"

# Lets look at the contents of our list:
my_list

# And extract one of the elements using [[]] indexing:
my_second_data_frame <- my_list[[2]]
my_list$dat


### Subsetting ###

# The most basic form of subsetting is extracting a group of elements from a
# vector. This is best illustrated by example:
my_vector <- 1:10
my_vector[3:5] # extract the 3rd to 5th elements
new_vector <- my_vector[3:5] # assign them to a new vector
my_vector[c(1,2,9)] # extract the 1st, 2nd, and 9th elements in a vector:

# With lists, we need to be careful about the difference between [[]] and []
new_list <- my_list[1] # returns a list
new_value <-  my_list[[1]] # returns the thing we stored in the list

# Need to use single brackets to subset a list
new_list <- my_list[1:2]


