library(data.table)

## 1. read the household_power_consumption.txt file
Powerdata <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?")
Powerdata

Powerdata$Date <- as.Date(Powerdata$Date, format = "%d/%m/%Y")

# Filter Dates for 2007-02-01 and 2007-02-02
Powerdata <- subset(Powerdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
Powerdata$datetime <- strptime(paste(Powerdata$Date, Powerdata$Time), "%Y-%m-%d %H:%M:%S")

## Plot 1
hist(Powerdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
