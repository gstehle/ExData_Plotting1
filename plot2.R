library(lubridate)
library(dplyr)

electric.data <- read.csv2(".//household_power_consumption.txt", nrow = 2880, skip = 66637, header = TRUE, dec = ".", colClasses = c(rep(NA,2), rep("numeric",7)))

colnames <- read.csv2(".//household_power_consumption.txt", nrow = 1, header = TRUE)
colnames(electric.data) <- colnames(colnames)

electric.data <- electric.data %>% mutate(date.time = (dmy_hms(paste(Date, Time))))

png("plot2.png")
plot(electric.data$date.time, electric.data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()