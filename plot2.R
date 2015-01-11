# plot2.R: plot Global Active Power over the 2 specified days
# Project #1 of Coursera Data Science 4: Exploratory Data Analysis
# 
filename <- "household_power_consumption.txt"
fileData <- read.csv (filename, sep=";", na.strings="?", header=T, colClasses=c("character", "character", NA, NA, NA, NA, NA, NA, NA))
fileData$DateTime <- as.POSIXct (paste (fileData$Date, fileData$Time), format="%d/%m/%Y %H:%M:%S")
dat <- fileData [fileData$DateTime >= "2007-02-01 00:00:00" & fileData$DateTime <= "2007-02-02 23:59:59",]

png ("plot2.png")
par(mfrow=c(1,1))
plot(dat$DateTime, dat$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
