
setwd("/Users/Aga/Documents/Coursera/Data science/Course 4  - Exploratory Data Analysis/Week 1/")

data <- read.table("data.txt", header = TRUE, sep =";")

#setting proper colClasses
library(lubridate)
data$Date <- as.character(data$Date)
data$Date <- dmy(data$Date)
#cutting data to two dates: 2007-02-01 and 2007-02-02
data <- data[data$Date =="2007-02-01" | data$Date =="2007-02-02", ]

data$Time <- as.character(data$Time)
data$Time <- paste(data$Date, data$Time)
data$Time <- ymd_hms(data$Time)


data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_intensity <- as.numeric(as.character(data$Global_intensity))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

#plot 4
par(mfrow = c(2,2))

plot(x=data$Time, y=data$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = NA)

plot(x=data$Time, y=data$Voltage, type = "l",
     ylab = "Voltage",
     xlab = "datetime")

plot(x=data$Time, y=data$Sub_metering_1, type = "l",
     ylab = "Energy sub metering",
     xlab = NA,
     col="black")
lines(x=data$Time, y=data$Sub_metering_2, type = "l", col="red")
lines(x=data$Time, y=data$Sub_metering_3, type = "l", col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red","blue"), bty = "n")


plot(x=data$Time, y=data$Global_reactive_power, type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime")

dev.copy(png, "plot4.png", width=480, height=480)
dev.off()
