# plot1.R
# histogram of global active power in KW for 1/2/2007 and 2/2/2007

readfile <- function() {
    data <- read.csv("household_power_consumption.txt", 
                     sep=";", 
                     na.strings=c("?"), 
                     colClasses = c("character", "character", rep("numeric",7)))
    
    sub_data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
    sub_data
}

x <- readfile()
png(filename = "plot1.png", width=480, height=480, bg="white")

hist(x$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()
