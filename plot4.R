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
png(file="plot4.png",width=480,height=480)  

# create canvas for 4 plots
par(mfrow = c(2,2))

#Create plot1 
plot(data$Global_active_power,type="l", xaxt="n", xlab="",ylab="Global Active Power")
    
    #create x label
    axis(side=1, at=c(0,length(data$Date)/2,length(data$Date)), labels=c("Thu","Fri","Sat"))

#create plot 2
plot(data$Voltage,type="l",lwd=1,     xaxt="n",  xlab="datetime",ylab="Voltage")

  #create x label
  axis(side=1, at=c(0,length(data$Date)/2,length(data$Date)), labels=c("Thu","Fri","Sat"))

#create plot 3
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

#create plot 4
plot(data$Global_reactive_power,type="l",  xaxt="n", xlab="datetime",ylab="Global_reactive_power")
  #create x label
  axis(side=1, at=c(0,length(data$Date)/2,length(data$Date)), labels=c("Thu","Fri","Sat"))

# close the plot
dev.off() 

