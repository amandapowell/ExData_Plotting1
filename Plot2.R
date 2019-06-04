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


##PLOT 2
#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
par(mfrow = c(1,1))


?png
png("plot2.png", width = 480, height = 480)

#Create plot
plot(data$Time, data$Global_active_power, type="l", col="black", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

#Close the file
dev.off()
