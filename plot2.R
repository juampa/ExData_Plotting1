# Read all the file with a specific NA character
data = read.csv("household_power_consumption.txt", header = TRUE, sep = ";"  , na.strings=c("?"))


# Filter between two dates.
data <- subset(data, as.Date(data$Date, "%d/%m/%Y") >= as.Date('2007-02-01', "%Y-%m-%d") & as.Date(data$Date, "%d/%m/%Y") <= as.Date('2007-02-02', "%Y-%m-%d"))

data$Date <- as.Date(data$Date, "%d/%m/%Y")

#Prepare a png file
#png("plot2.png",width=480,height=480,units="px")

# Plot time vs Global...
plot(data$Time, data$Global_active_power, xaxt = "n")

#Axis

axis(side=1, at=data$Time,labels=format(data$Date,"%a"))

# Close the device
# dev.off