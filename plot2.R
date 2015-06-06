#plot2.png

##check the owrking directory
getwd()
##set the working directory to 'household_power_consumption.txt' file location
setwd(".")

install.packages("sqldf")
library(sqldf)

#Load the subset of data from the file to R
data <- read.csv.sql("household_power_consumption.txt", sql="select * from file where Date=='1/2/2007' or Date=='2/2/2007' ", sep=";", header=TRUE)

# Setting the file name and canvas size
png(file="plot2.png",width=480,height=480) # open ploting device
 
# Combine the date and time  
datetime <- strptime(paste(data[,1], data[,2]), "%d/%m/%Y %H:%M:%S")

#creating the plot
plot(datetime,data$Global_active_power, main="",xlab="", ylab="Global Active Power (kilowatts)",type="l",lwd=1,)

dev.off() # close ploting device

