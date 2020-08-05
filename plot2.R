df <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)
data <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

data$Global_active_power <- as.numeric(data$Global_active_power)
data$datetime <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(data$datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Glocal Active Power (kilowatts)")
dev.off()
