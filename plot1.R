df <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)
data <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

data$Global_active_power <- as.numeric(data$Global_active_power)

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Glocal Active Power (kilowatts)")
dev.off()
