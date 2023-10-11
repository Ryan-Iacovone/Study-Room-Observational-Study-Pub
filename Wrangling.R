## ---- echo=TRUE---------------------------------------------------------------------------------------------------------------------------------------------------
#Loading in all appropriate libraries for the report 
library(tidyverse)
library(janitor)
library(scales)
library(ggplot2)
library(ggthemes)
library(readxl)
library(stringr)
source("http://pcwww.liv.ac.uk/~william/R/crosstab.r") #Library for crosstab function
library(expss)
library(writexl)
library(RColorBrewer)
library(lubridate)

#Code to knit the file even if there are errors 
knitr::opts_chunk$set(error = TRUE)


## ---- echo=TRUE---------------------------------------------------------------------------------------------------------------------------------------------------
#Loading in the data file from local home drive and omitting all missing values 

study <- read_excel("C:/Users/Ryan/Coding Projects/Public Forks/Study Rooms pub/Data/Example Data.xlsx") %>%
  na.omit()

#Encoding the vector Time as a factor with three levels "M", "A", "E" soon to represent "morning" "afternoon" and "evening 
study$Time <- factor(study$Time, levels = c("M", "A", "E"))

#The factor() function is used to create a factor from the Room_Avaliable vector of the study data frame. The levels argument specifies the order of the levels, with "yes" being the first level and "no" being the second level.
study$Room_Avaliable <- factor(study$Room_Avaliable, levels = c("yes", "no"))

#Getting a brief look at our data set to make sure it looks good 
head(study)

#Applying labels to the factors of variable time to be applied later on in the tabyl() to create our cross tab  
study1 = apply_labels(study, 
                     Time = c("Afternoon" = "A",
                              "Evening" = "E",
                              "Morning" = "M"))


## ---- echo=TRUE---------------------------------------------------------------------------------------------------------------------------------------------------
save(study1, file = "rda/study1.rda")
save(study, file = "rda/study.rda")

