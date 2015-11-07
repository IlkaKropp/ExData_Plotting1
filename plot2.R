## Read data 
data <- read.csv2("household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE, dec = ".")
## Select relevant data
relevant_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
## Clean data
library(dplyr)
clean_data <- mutate(relevant_data, Date = as.Date(Date, "%d/%m/%Y"))
datetime <- strptime(paste(clean_data$Date, clean_data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

## Choose graphic device
png(filename = "plot2.png", width = 480, height = 480, units = "px")
## Plot2
plot(datetime,as.numeric(clean_data$Global_active_power), type = "l")
## Close graphic device
dev.off()