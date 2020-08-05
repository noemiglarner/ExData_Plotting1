df <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)
data <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

data$datetime <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))

plot(data$datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Glocal Active Power (kilowatts)")

plot(data$datetime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(data$datetime, data$Sub_metering_1, type = "l", col = "red", xlab = "", ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_2, type = "l", col = "red")
lines(data$datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"), bty = "n")

plot(data$datetime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()