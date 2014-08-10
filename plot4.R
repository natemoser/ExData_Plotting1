# plot4.R
# produce a series of plots written to the same png file:
#  - time series of Global Active Power
#  - time series of Voltage
#  - time series of Energy sub metering
#  - time series of Global_reactive_power

readfile <- function() {
    data <- read.csv("household_power_consumption.txt", 
                     sep=";", 
                     na.strings=c("?"), 
                     colClasses = c("character", "character", rep("numeric",7)))
    
    sub_data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
    sub_data
}

doPlots <- function(x) {
    
    # set device to put four plots in same file in 'square' 2x2 grid
    par(mfrow = c(2,2))
    
    # plot 1
    plot(x$Date, x$Global_active_power, 
         type = "l", 
         xlab = "", ylab = "Global Active Power")
    
    # plot 2
    plot(x$Date, x$Voltage, 
         type = "l", 
         xlab = "datetime", ylab = "Voltage")
    
    # plot 3
    plot(x$Date, x$Sub_metering_1, 
         type = "l", 
         xlab = "", ylab = "Energy sub metering")
    lines(x$Date, x$Sub_metering_2, col = "red")
    lines(x$Date, x$Sub_metering_3, col = "blue")
    legend("topright", 
           border="white", fill="white",
           lty=1, bty="n",
           col = c("black","red","blue"), 
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    # plot 4
    plot(x$Date, x$Global_reactive_power, 
         type = "l", 
         xlab = "datetime", , ylab = "Global_reactive_power")
    
}

x <- readfile()
x$Date <- strptime(paste(x$Date,x$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "plot4.png", width=480, height=480, bg="white")
doPlots(x)
dev.off()