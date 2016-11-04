# Origin: HW for week 7 of programming class.
# Author: Laura Green
# Title: HW7.R
# Last modified: 2016.11.04

# QUESTIONS 1, 2 & 3

getwd()
mydir <- "/GitHub/RepoLauraProgramming/Session7/"
setwd(dir = '~/GitHub/RepoLauraProgramming/Session7')

data_911 = read.csv('911.csv', header = TRUE, sep = ",", quote = "\"", dec = ".", fill = TRUE, comment.char = "")

# data_911 

typeof(data_911) # Just testing random stuff for the next few lines
class(data_911)
str(data_911)
typeof(data_911["lng"])
str(data_911["lng"])
head(data_911)
head(data_911[['twp']])

# QUESTION 4

colnames(data_911)

# QUESTION 5

summary(data_911) 

# This isn't super interesting,
# we can't learn much from this.
# I'll try to get only stats I care about.

#install.packages('ggplot2', repos="http://cran.us.r-project.org")
library(ggplot2)
library(reshape2) 

# Can't remember why I needed ggplot there. 
# Probably should have cleaned up and documented the code earlier on.
# I think I was just randomly trying things from the internet, 
# some of it has no link whatsoever to what I was trying to do. 
# Or maybe this was actually useful and the whole code will crash if I delete these lines.
# Or MAYBE I just realized I'd never installed ggplot and thought it might come in handy later on? 

numcalls <- subset(data_911, select=c("title", "timeStamp"))
numcalls

# Ok so what I am doing here is selecting the only 2 columns I care about,
# i.e. the date of the call and the name/type of the emergency. 
# If I had more time I would love to look at stats by type, 
# as the owner of the dataset on Kaggle does in his exploration of the data.
# https://www.kaggle.com/umeshnarayanappa/d/mchirico/montcoalert/explore-911-data
# As it is, am clearly spending WAY too much time on this HW, so will just work 
# with the number of calls per time period. 

colnames(numcalls)

#install.packages("lubridate")
library(lubridate)

# This I know for sure now that it was unnecessary. 
# Still, just in case I need to remember my thought process, am leaving it. 

#install.packages("data.table") 
library(data.table)

d <- data_911[,6]
dd <- as.Date(data_911[,6])
dd[order(data_911)]

typeof(data_911)
class(data_911)
mode(data_911)

typeof(data_911[6])
class(data_911[6])
mode(data_911[6])

typeof(dd)
class(dd)
mode(dd) 

table(numcalls$timeStamp)
str(numcalls)
length(numcalls$timeStamp)
# Random trying things out, I think. 
# Ultimately, was trying to find out if the length and data type 
# of my new data frame were "compatible", and order the data points by date.
# Also, wanted to get rid of the "time" and keep the date in legible format. 
# If more time, wanted to play with different aggregates of periods (days of the week, months...)
# to find interesting correlations with the number of calls.

newt <- cbind(numcalls, dd)
newt$timeStamp <- NULL

# Making a new data frame where the "timeStamp" column
# is replaced by an ordered list of dates in "date" format.

colnames(newt)
newt

split(newt, as.Date(newt$dd, format="%m/%d/%Y"))

countt <- as.data.frame(table(unique(newt)$dd)) # wow this does what I've been looking for for a while!!! 
# (Note to self: this is a cool and easy way to group/order/count data per date, might need again.)

colnames(countt)
names(countt)[names(countt)=="Var1"] <- "date"

countt

summary(countt) 

# This is the actual answer to question 5. 
# I can now comment on the descriptive stats.
# The number of calls per day to 911 in whatever place this study is from
# between mid-December 2015 and the end of October 2016
# varies between 32 and 61.
# The average number of calls per day over this period is 49.46.


# QUESTION 6

# I want to find the average number of calls per month.

length(countt$date)

# install.packages("dplyr")
library(dplyr)
countt$date <- as.Date(countt$date)
countt$date

# Once I have the "date" column in a date format,
# I can create a new column with the months: 

Month <- format(as.Date(countt$date, "%d/%m/%Y"), "%Y-%m")
Month

# And add it to my data frame:

countt2 <- cbind(countt, Month)
countt2

# From there, I use the "ave" function to compute the average number of calls per day for each month:
counttav <- ave(countt2$Freq,countt2$Month)
counttav

countt3 <- cbind(countt2, counttav)
countt3

# QUESTION 7

plot(x = countt3$Month, y = countt3$Freq, col = "pink", main = "Pwetty Pink Graph")

# Plotting the number of calls per day wrt the month 

# QUESTION 8

counttM <- aggregate(countt2$Freq,by=list(countt2$Month), "sum")
counttM

names(counttM)[names(counttM)=="x"] <- "Calls"
names(counttM)[names(counttM)=="Group.1"] <- "Month"

counttM

plot(x = counttM$Month, y = counttM$Calls, type="o")

# Not sure this really shows a correlation (or even more of a correlation than previous plot...) 
# But it's showing the number of calls per month. 
# It's not very reliable/useful, since the first "month" is only 2/3 of December 2015
# and October 2016 is also missing a few days. 
# The only thing we can tell from this graph is that there were more calls than usual
# during the summer of this year, and a drop in calls in February 
# (probably because less days in the month?)

# QUESTION 9

write.csv(file="MyData7.csv", x=countt3, row.names = F)
