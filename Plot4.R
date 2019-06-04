### EXPLORATORY DATA ANALYSIS
## Course Project 1 

## This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. 
## In particular, we will be using the “Individual household electric power consumption Data Set” which I have made available on 
## the course web site:
## Dataset: Electric power consumption [20Mb]

## Description: 
## Measurements of electric power consumption in one household with a 1 min sampling rate over a period of almost 4 years. 
## Different electrical quantities and some sub-metering values are available.

getwd()
setwd("/Users/lax4life1469/Desktop/DataScience_Coursera/Exploratory_Data_Analysis")

power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings="?")
#Note that in this dataset missing values are coded as ?
head(power)

#We will only be using data from the dates 2007-02-01 and 2007-02-02.
data <- power[power$Date %in% c("1/2/2007","2/2/2007"),]
Time <-strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
data <- cbind(Time, data)


##PLOT 4
#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.


png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))


plot(data$Time, data$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(data$Time, data$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(data$Time, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, type="l", col="red")
lines(data$Time, data$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", 
       legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=1, 
       col=c("black","red","blue"))
plot(data$Time, data$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")

#Close the file
dev.off()
