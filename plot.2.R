#Load data
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

#Subset data
subset <- subset(df,df$Date =="1/2/2007" | df$Date == "2/2/2007")

#Convert data type
subset$Date <- as.Date(subset$Date, format = "%d/%m/%Y")
subset$Global_active_power <- as.numeric(subset$Global_active_power)
subset$datetime <- strptime(paste(subset$Date, subset$Time), "%Y-%m-%d %H:%M:%S")
subset$datetime <- as.POSIXct(subset$datetime)

#Plotting and png export
png(file="plot.2.png", bg = "transparent", width=480, height=480)
plot(subset$datetime, subset$Global_active_power, type="l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
