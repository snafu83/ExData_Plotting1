## packages

library(dplyr)

## wd()

getwd()
setwd("D:/coursera/coursera exploratory data analysis/project 1/")

## read data, create subset and combine date to date2 column

dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
dat <- filter(dat, dat$Date == "2007-02-01" | dat$Date == "2007-02-02")
dat <- cbind (dat, data.frame(date2 = strptime(paste(as.character(dat$Date), as.character(dat$Time)), "%Y-%m-%d %H:%M:%S")))

## plot to png

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), bg = "transparent")
plot(dat$Global_active_power ~ dat$date2, ylab = "Global Active Power", xlab = "", type = "l")
plot(dat$Voltage ~ dat$date2,  ylab = "Voltage", xlab = "datetime", type = "l")
plot(dat$Sub_metering_1 ~ dat$date2,
     ylab = "Energy sub metering", xlab = "", type = "l")
lines(dat$Sub_metering_2 ~ dat$date2, type = "l", col = "red")
lines(dat$Sub_metering_3 ~ dat$date2, type = "l", col = "blue")
legend("topright", lty =  1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(dat$Global_reactive_power ~ dat$date2, ylab = "Global_reactive_power", xlab = "datetime", type = "l")
dev.off()
