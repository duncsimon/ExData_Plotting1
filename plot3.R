# Read data file
filePath <- paste(getwd(), "/household_power_consumption/household_power_consumption.txt", sep="")
data <- read.table(filePath, header=TRUE, stringsAsFactors = FALSE, sep=";")
dateData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Get relevant columns
globalActivePower <- as.numeric(dateData$Global_active_power)
subMetering1 <- as.numeric(dateData$Sub_metering_1)
subMetering2 <- as.numeric(dateData$Sub_metering_2)
subMetering3 <- as.numeric(dateData$Sub_metering_3)

# Convert dates and times
asDateTimes <- strptime(paste(dateData$Date, dateData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Plot data
png("plot3.png", width=480, height=480)
plot(asDateTimes, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(asDateTimes, subMetering2, type="l", col="red")
lines(asDateTimes, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()