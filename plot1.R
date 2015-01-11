# plot1.R: draw histogram of Global Active Power
# Project #1 of Coursera Data Science 4: Exploratory Data Analysis
# 
filename <- "household_power_consumption.txt"
fileData <- read.csv (filename, sep=";", na.strings="?", header=T, colClasses=c("character", "character", NA, NA, NA, NA, NA, NA, NA))
fileData$DateTime <- as.POSIXct (paste (fileData$Date, fileData$Time), format="%d/%m/%Y %H:%M:%S")
dat <- fileData [fileData$DateTime >= "2007-02-01 00:00:00" & fileData$DateTime <= "2007-02-02 23:59:59",]

png ("plot1.png")
par(mfrow=c(1,1))
hist(dat$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
