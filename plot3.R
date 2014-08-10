# plot3.R
# plot a time series of Energy sub metering for 1/2/2007 and 2/2/2007

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
png(filename = "plot3.png", width=480, height=480, bg="white")

plot(x$Date, x$Sub_metering_1, 
     type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(x$Date, x$Sub_metering_2, col = "red")
lines(x$Date, x$Sub_metering_3, col = "blue")
legend("topright", lty=1, 
       col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()