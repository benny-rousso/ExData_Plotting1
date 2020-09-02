#Load data
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

#Subset data
subset <- subset(df,df$Date =="1/2/2007" | df$Date == "2/2/2007")

#Convert data type
subset$Date <- as.Date(subset$Date, format = "%d/%m/%Y")
subset$Global_active_power <- as.numeric(subset$Global_active_power)

#Plotting and png export
png(file="plot.1.png", bg = "transparent", width=480, height=480)
hist(subset$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power(kilowatts")
dev.off()
