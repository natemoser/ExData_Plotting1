# plot2.R
# plot a time series of Global active power for 1/2/2007 and 2/2/2007

readfile <- function() {
    data <- read.csv("household_power_consumption.txt", 
                     sep=";", 
                     na.strings=c("?"), 
                     colClasses = c("character", "character", rep("numeric",7)))
    
    sub_data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
    sub_data
}

x <- readfile()
x$Date <- strptime(paste(x$Date,x$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", width=480, height=480, bg="white")

plot(x$Date, x$Global_active_power, 
     type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
