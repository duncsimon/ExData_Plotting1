# Read data file
filePath <- paste(getwd(), "/household_power_consumption/household_power_consumption.txt", sep="")
data <- read.table(filePath, header=TRUE, stringsAsFactors = FALSE, sep=";")
dateData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Get relevant columns
globalActivePower <- as.numeric(dateData$Global_active_power)
asDateTimes <- strptime(paste(dateData$Date, dateData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Plot data
png("plot2.png", width=480, height=480)
plot(asDateTimes, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()