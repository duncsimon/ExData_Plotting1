# Read data file
filePath <- paste(getwd(), "/household_power_consumption/household_power_consumption.txt", sep="")
data <- read.table(filePath, header=TRUE, stringsAsFactors = FALSE, sep=";")
dateData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Get column
globalActivePower <- as.numeric(dateData$Global_active_power)

# Plot data
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()