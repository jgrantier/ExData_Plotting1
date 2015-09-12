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
png(file = "plot2.png")

#Plot date/time by global active power
with(powerdata, plot(DateTime,Global_active_power, type="l", ylab= "Global Active Power (kilowatts)", xlab = ""))

#Close png device to save file 
dev.off()


