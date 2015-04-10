# Read all the file with a specific NA character
data = read.csv("household_power_consumption.txt", header = TRUE, sep = ";"  , na.strings=c("?"))

# Filter between two dates.
data <- subset(data, as.Date(data$Date, "%d/%m/%Y") >= as.Date('2007-02-01', "%Y-%m-%d") & as.Date(data$Date, "%d/%m/%Y") <= as.Date('2007-02-02', "%Y-%m-%d"))

#Prepare a png file
png("plot1.png",width=480,height=480,units="px")

# Plot the hist
hist(data$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)", xaxp  = c(0, 6, 3), xlim = c(0,8), yaxp = c(0,1200, 6))

# Close the device
dev.off()