# Read data file
filePath <- paste(getwd(), "/household_power_consumption/household_power_consumption.txt", sep="")
data <- read.table(filePath, header=TRUE, stringsAsFactors = FALSE, sep=";")
dateData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Get relevant columns
globalActivePower <- as.numeric(dateData$Global_active_power)
globalReactivePower <- as.numeric(dateData$Global_reactive_power)
subMetering1 <- as.numeric(dateData$Sub_metering_1)
subMetering2 <- as.numeric(dateData$Sub_metering_2)
subMetering3 <- as.numeric(dateData$Sub_metering_3)
voltage <- as.numeric(dateData$Voltage)

# Convert dates and times
asDateTimes <- strptime(paste(dateData$Date, dateData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Plot data
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(asDateTimes, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(asDateTimes, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(asDateTimes, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(asDateTimes, subMetering2, type="l", col="red")
lines(asDateTimes, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(asDateTimes, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()