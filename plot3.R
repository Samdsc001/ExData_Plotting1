#plot3.png

##check the owrking directory
getwd()
##set the working directory to 'household_power_consumption.txt' file location
setwd(".")

install.packages("sqldf")
library(sqldf)

#Load the subset of data from the file to R
data <- read.csv.sql("household_power_consumption.txt", sql="select * from file where Date=='1/2/2007' or Date=='2/2/2007' ", sep=";", header=TRUE)

# Setting the file name and canvas size
png(file="plot3.png",width=480,height=480)  

 

#Creat the sub metering 1 plot
with(data,plot(data$Sub_metering_1,type="l",main="",xaxt="n",xlab="", ylab="Energy sub metering"))

#create the sub metering 2  line
lines(data$Sub_metering_2,col="red",type="l")

# Create the sub metering 3 line
lines(data$Sub_metering_3,col="blue",type="l")


# Display the legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

#create x label
axis(side=1, at=c(0,length(data$Date)/2,length(data$Date)), labels=c("Thu","Fri","Sat"))


# close the plot
dev.off() 


