# Read all the file with a specific NA character
data = read.csv("household_power_consumption.txt", header = TRUE, sep = ";"  , na.strings=c("?"))


# Filter between two dates.
data <- subset(data, as.Date(data$Date, "%d/%m/%Y") >= as.Date('2007-02-01', "%Y-%m-%d") & as.Date(data$Date, "%d/%m/%Y") <= as.Date('2007-02-03', "%Y-%m-%d"))

# Add a columns with date and time together
data <- within(data, Datetime <- as.POSIXlt(paste(Date, Time),
                                          format = "%d/%m/%Y %H:%M:%S"))

# Tricky to include just one value from 2007-02-03, to fix x axis.
data <- subset(data, data$Datetime >= as.POSIXlt.date("2007-02-01 00:00:00") 
               & data$Datetime < as.POSIXlt.date("2007-02-03 00:01:00"))


#Prepare a png
png("plot2.png",width=480,height=480,units="px")

# Plot time vs Global...
#
plot(data$Datetime, data$Global_active_power, type="l", xaxt = "n" , xlab=NA , ylab="Global Active Power(kilowatts)")
axis.POSIXct(1, at=seq(data$Datetime[1], max(data$Datetime), by="days"), format = "%a")

# Close the device
dev.off()