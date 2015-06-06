#plot1.png

##check the owrking directory
getwd()
##set the working directory to 'household_power_consumption.txt' file location
setwd(".")

install.packages("sqldf")
library(sqldf)

#Load the subset of data from the file to R
data <- read.csv.sql("household_power_consumption.txt", sql="select * from file where Date=='1/2/2007' or Date=='2/2/2007' ", sep=";", header=TRUE)

# Setting the file name and canvas size
png(file="plot1.png",width=480,height=480) # open ploting device

#creating the histogram
hist(as.numeric(data$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off() # close ploting device
 