# plot4.R: plot the 4 specified sub plots in one file
# Project #1 of Coursera Data Science 4: Exploratory Data Analysis
# 
filename <- "household_power_consumption.txt"
fileData <- read.csv (filename, sep=";", na.strings="?", header=T, colClasses=c("character", "character", NA, NA, NA, NA, NA, NA, NA))
fileData$DateTime <- as.POSIXct (paste (fileData$Date, fileData$Time), format="%d/%m/%Y %H:%M:%S")
dat <- fileData [fileData$DateTime >= "2007-02-01 00:00:00" & fileData$DateTime <= "2007-02-02 23:59:59",]

png ("plot4.png")
par (mfrow=c(2,2))
# plot 4.1
plot(dat$DateTime, dat$Global_active_power, type="l", ylab="Global Active Power", xlab="")

# plot 4.2
plot(dat$DateTime, dat$Voltage, type="l", ylab="Voltage", xlab="datetime")

# plot 4.3
plot(dat$DateTime, dat$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(dat$DateTime, dat$Sub_metering_2, type="l", col="red")
lines(dat$DateTime, dat$Sub_metering_3, type="l", col="blue")
legend (x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), col=c(1,2,"blue"), bty="n")

# plot 4.4
plot(dat$DateTime, dat$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()
par(mfrow=c(1,1)) # reset parameter

