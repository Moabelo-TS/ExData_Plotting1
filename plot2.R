library(data.table)

Powerdata2 <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?")
Powerdata2

Powerdata2$Date <- as.Date(Powerdata2$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(Powerdata2, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Powerdata2)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

