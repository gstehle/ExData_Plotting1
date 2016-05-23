library(lubridate)
library(dplyr)

electric.data <- read.csv2(".//household_power_consumption.txt", nrow = 2880, skip = 66637, header = TRUE, dec = ".", colClasses = c(rep(NA,2), rep("numeric",7)))

colnames <- read.csv2(".//household_power_consumption.txt", nrow = 1, header = TRUE)
colnames(electric.data) <- colnames(colnames)

png("plot3.png")
plot(electric.data$date.time, electric.data$Sub_metering_1, type = "l", ylab = "Energy Sub Metering", xlab = "", col = "black") 
points(electric.data$date.time, electric.data$Sub_metering_2, type = "l", col = "red")
points(electric.data$date.time, electric.data$Sub_metering_3, type = "l", col = "blue")
legend(x = "topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()