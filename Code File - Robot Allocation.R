
  # GOAL PROGRAMMING : OPTIMISATION FOR NUMBER OF ROBOTS
  
  # Set the working Directory
  setwd("C:/Users/shres")

# Install Goal Programming Package 
install.packages("goalp")
# Load the Package
library(goalp)

# Assign the equations with constraints to a variable
# Assign the lower and upper bounds for the variables

goals <-"Man Hours: 40*x1 + 28*x2 + 20*x3 = 1000 

spend: 8700*x1 + 8100*x2 + 7700*x3 <= 250000 

orders: 252*x1 + 168*x2 + 112*x3 >= 2660

x1 lBound 5 

x2 lBound 5 

x3 lBound 5" #The equation is being solved by taking month as base

# Load Variable in the console
goals

# Assign the "goals" variable to function "goalp"
gp <- goalp(goals)

# Check the summary
summary(gp)

[04:01, 03/01/2024] Shresth: # GOAL PROGRAMMING : OPTIMISATION FOR NUMBER OF ROBOTS
  
  # Set the working Directory
  setwd("C:/Users/shres")

# Install Goal Programming Package 
install.packages("goalp")
# Load the Package
library(goalp)

# Assign the equations with constraints to a variable
# Assign the lower and upper bounds for the variables

goals <-"Man Hours: 40*x1 + 28*x2 + 20*x3 = 1000 

spend: 8700*x1 + 8100*x2 + 7700*x3 <= 250000 

orders: 252*x1 + 168*x2 + 112*x3 >= 2660

x1 lBound 5 

x2 lBound 5 

x3 lBound 5" #The equation is being solved by taking month as base

# Load Variable in the console
goals

# Assign the "goals" variable to function "goalp"
gp <- goalp(goals)

# Check the summary
summary(gp)
[05:09, 03/01/2024] Shresth: #Read Data
  data <- read.csv("Robot_info.csv")


R Code for TOPSIS :
  #Install and load MCDA package
  install.packages('MCDA')
library('MCDA')

# Install WHOLE MCDA PACK
install.packages("./MCDA_0.1.0.tar.gz")
install.packages(c('Rglpk','triangle','plyr','ggplot2','glpkAPI','combinat'))

# Performance Table for TOPSIS
performance_table <- as.data.frame(t(data))
# Shed extra row
performance_table <- performance_table[c(2,3,4,5), c(1,2,3,4,5)]
# Change data frame into numeric form
performance_table <- as.data.frame(sapply(performance_table, as.numeric))
performance_table

# Change column and row names
colnames(performance_table) <- c("Carrying Capacity", "Battery Size", "Average Speed", "Cost Per Unit", "Reliability")
rownames(performance_table) <- c("Archer", "Bowler", "Corner", "Deviant")
performance_table

# Weights
weights <- c(0.07, 0.30, 0.13, 0.27, 0.33 )
names(weights) <- colnames(performance_table)
weights

# Criteria
criteriaMinMax <- c("max", "max", "max", "min", "max")
names(criteriaMinMax) <- colnames(performance_table)
criteriaMinMax

# TOPSIS Function
overall1 <- TOPSIS(performance_table, weights, criteriaMinMax)
overall1

# Bar-Plot
barplot(overall1, main="TOPSIS Score for Robot",
        xlab="Car Model", col=c("darkblue","red","green", "yellow"),
        legend = names(overall1))
