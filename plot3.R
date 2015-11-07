## Read data 
data <- read.csv2("household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE, dec = ".")
## Select relevant data
relevant_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
## Clean data
library(dplyr)
clean_data <- mutate(relevant_data, Date = as.Date(Date, "%d/%m/%Y"))
datetime <- strptime(paste(clean_data$Date, clean_data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

## Choose graphic device
png(filename = "plot3.png", width = 480, height = 480, units = "px")
## Plot3
plot(datetime, as.numeric(clean_data$Sub_metering_1), type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime, as.numeric(clean_data$Sub_metering_2), col = "red")
lines(datetime, as.numeric(clean_data$Sub_metering_3), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))
## Close graphic device
dev.off()