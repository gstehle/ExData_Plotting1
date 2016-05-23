library(lubridate)
library(dplyr)

electric.data <- read.csv2(".//household_power_consumption.txt", nrow = 2880, skip = 66637, header = TRUE, dec = ".", colClasses = c(rep(NA,2), rep("numeric",7)))

colnames <- read.csv2(".//household_power_consumption.txt", nrow = 1, header = TRUE)
colnames(electric.data) <- colnames(colnames)

png("plot1.png")
hist(electric.data[,3], breaks = 12, col = "red", border = "black", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()