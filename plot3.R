library(data.table)

Powerdata3 <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
Powerdata3$date.time <- as.POSIXct(paste(Powerdata3$Date,Powerdata3$Time), format = "%d/%m/%Y %T")

Powerdata3$Date <- as.Date(Powerdata3$Date, format="%d/%m/%Y")

subPowerdata3 <- subset(Powerdata3, Date == "2007-02-01" | Date == "2007-02-02")

sub_1 <- as.numeric(as.character(subPowerdata3$Sub_metering_1))
sub_2 <- as.numeric(as.character(subPowerdata3$Sub_metering_2))
sub_3 <- as.numeric(as.character(subPowerdata3$Sub_metering_3))

png("plot3.png", width = 480, height = 480)
plot(subPowerdata3$date.time, sub_1, col = "black", type = "l", 
     xlab = "", 
     ylab = "Energy sub metering")
lines(subPowerdata3$date.time, sub_2, col = "red", type = "l")
lines(subPowerdata3$date.time, sub_3, col = "blue", type = "l")
legend('topright','groups'
       ,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = 1,
       col=c('black','red','blue'))
dev.off()

