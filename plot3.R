#Read data from file in working directory
powerdata <- read.table("household_power_consumption.txt",header=TRUE, sep = ";",na.strings = "?", stringsAsFactors = FALSE)
#Create DateF variable in "Date" format for subsetting
powerdata$DateF <- as.Date(powerdata$Date, "%d/%m/%Y")
#Choose only data from February 1, 2007 & February 2, 2007
powerdata <- powerdata[powerdata$DateF == "2007-02-01" | powerdata$DateF == "2007-02-02",]
#Create a single variable for date and time by pasting the two columns and converting to POSIXlt format
powerdata$DateTime <- paste (powerdata$Date, powerdata$Time)
powerdata$DateTime <- strptime(powerdata$DateTime, "%d/%m/%Y %H:%M:%S")

#Open png device to plot
png(file = "plot3.png")

#Plot date/time by all three energy sub metering values
with(powerdata, plot(DateTime,Sub_metering_1, type="l", ylab= "Energy sub metering", xlab = ""))
with(powerdata, lines(DateTime,Sub_metering_2, type="l",col="red" ))
with(powerdata, lines(DateTime,Sub_metering_3, type="l",col="blue" ))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"))

#Close png device to save file
dev.off()


