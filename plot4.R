## Read data 
data <- read.csv2("household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE, dec = ".")
## Select relevant data
relevant_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
## Clean data
library(dplyr)
clean_data <- mutate(relevant_data, Date = as.Date(Date, "%d/%m/%Y"))
datetime <- strptime(paste(clean_data$Date, clean_data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

## Select graphic device
png(filename = "plot4.png", width = 480, height = 480, units = "px")
## Plot4
par(mfrow = c(2,2))
#1
plot(datetime, as.numeric(clean_data$Global_active_power), type = "l", ylab = "Global Active Power", xlab = "")
#2
plot(datetime, as.numeric(clean_data$Voltage), type = "l", ylab = "Voltage")
#3
plot(datetime, as.numeric(clean_data$Sub_metering_1), type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime, as.numeric(clean_data$Sub_metering_2), col = "red")
lines(datetime, as.numeric(clean_data$Sub_metering_3), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"), bty = "n")
#4
plot(datetime, as.numeric(clean_data$Global_reactive_power), type = "l", ylab = "Global Reactive Power")
## Close graphic device
dev.off()
