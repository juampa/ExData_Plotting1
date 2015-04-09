# Read all the file with a specific NA character
data = read.csv("household_power_consumption.txt", header = TRUE, sep = ";"  , na.strings=c("?"))

# Filter between two dates.
data <- subset(data, as.Date(data$Date, "%d/%m/%Y") >= '2007-02-01' & as.Date(data$Date, "%d/%m/%Y") <= '2007-02-02')

# First try
hist(data$Global_active_power)
