## Read data 
data <- read.csv2("household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE, dec = ".")
## Select relevant data
relevant_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
## Clean data
library(dplyr)
clean_data <- mutate(relevant_data, Date = as.Date(Date, "%d/%m/%Y"))

## Choose graphic device
png(filename = "plot1.png", width = 480, height = 480, units = "px")
## Plot1
hist(as.numeric(clean_data$Global_active_power), xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
## Close graphic device
dev.off()