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

png("plot2.png", width = 480, height = 480)
par(bg = "transparent")
plot(dat$Global_active_power ~ dat$date2,
     ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.off()
