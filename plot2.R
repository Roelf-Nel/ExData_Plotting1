## plot2.R
## Coursera Exploratory Data Analysis - Assignment Week 1

## read the data, filter & transform

energy.total = read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
energy.filtered <- energy.total[energy.total$Date %in% c("1/2/2007","2/2/2007"),]

energy.filtered$Global_active_power <- as.numeric(energy.filtered$Global_active_power)
energy.filtered$Date <- as.Date(energy.filtered$Date, format="%d/%m/%Y")
energy.filtered$DateTime <- as.POSIXct(paste(energy.filtered$Date, energy.filtered$Time))

## construct the plot

png("plot2.png", width=480, height=480)
with(energy.filtered, 
   plot(Global_active_power~DateTime, 
        type="l",
        ylab="Global Active Power (kilowatts)", 
        xlab=""))
dev.off()
