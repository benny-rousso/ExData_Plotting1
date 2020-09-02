#Load data
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

#Subset data
subset <- subset(df,df$Date =="1/2/2007" | df$Date == "2/2/2007")

#Convert data type
subset$Date <- as.Date(subset$Date, format = "%d/%m/%Y")
subset$Global_active_power <- as.numeric(subset$Global_active_power)
subset$datetime <- strptime(paste(subset$Date, subset$Time), "%Y-%m-%d %H:%M:%S")
subset$datetime <- as.POSIXct(subset$datetime)
subset$Sub_metering_1 <- as.numeric(subset$Sub_metering_1)
subset$Sub_metering_2 <- as.numeric(subset$Sub_metering_2)
subset$Sub_metering_3 <- as.numeric(subset$Sub_metering_3)

#Plotting and png export
png(file="plot.3.png", bg = "transparent", width=480, height=480)
plot(subset$datetime, subset$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(subset$datetime, subset$Sub_metering_2, col = "Red")
lines(subset$datetime, subset$Sub_metering_3, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
