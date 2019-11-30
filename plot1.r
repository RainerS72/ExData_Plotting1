## set working directory
setwd("C:/Rainer/DataScience/Exploratory Data Analysis/Project 1")

## Load data and remove datasets with missing values (marked with ?)
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
                   colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
data$Date <- strptime(data$Date, format="%d/%m/%Y")

## Filter data from 1-Feb-2007 to 2-Feb-2007
filtered_data <- subset(data, Date >= strptime("01/02/2007", format="%d/%m/%Y") & Date <= strptime("02/02/2007", format="%d/%m/%Y"))

## Combine Date and Time column
dateTime <- paste(filtered_data$Date, filtered_data$Time)

## Name the vector
dateTime <- setNames(dateTime, "DateTime")

## Remove Date and Time column and Add combined datTime column
filtered_data <- cbind(dateTime, filtered_data[ ,!(names(filtered_data) %in% c("Date","Time"))])
filtered_data$dateTime <- as.POSIXct(dateTime)

## Draw plot1 ---------------------------------------------
hist(filtered_data$Global_active_power, main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col="red")
## and save to plot1.png
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()


