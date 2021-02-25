library(datasets)

Powerdata4<- read.table("household_power_consumption.txt", sep=";", header = TRUE)
Powerdata4$date.time <- as.POSIXct(paste(Powerdata4$Date, Powerdata4$Time), format = "%d/%m/%Y %T")

Powerdata4$Date <- as.Date(Powerdata4$Date, format="%d/%m/%Y")

subPowerdata4 <- subset(Powerdata4, Date == "2007-02-01" | Date == "2007-02-02")



png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))

plot(subPowerdata4$date.time, 
     as.numeric(as.character(subPowerdata4$Global_active_power)), 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

plot(subPowerdata4$date.time, 
     as.numeric(as.character(subPowerdata4$Voltage)), 
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

plot(subPowerdata4$date.time, sub_1, col = "black", type = "l", 
     xlab = "", 
     ylab = "Energy sub metering")
lines(subPowerdata4$date.time, sub_2, col = "red", type = "l")
lines(subPowerdata4$date.time, sub_3, col = "blue", type = "l")
legend('topright','groups'
       ,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = 1,
       col=c('black','red','blue'), bty = "n")

plot(subPowerdata4$date.time, 
     as.numeric(as.character(subPowerdata4$Global_reactive_power)), 
     type = "l",
     xlab = "datetime",
     ylab = "Global_active_power")

dev.off()

