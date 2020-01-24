## plot3.R
## Coursera Exploratory Data Analysis - Assignment Week 1

## read the data, filter & transform

energy.total = read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
energy.filtered <- energy.total[energy.total$Date %in% c("1/2/2007","2/2/2007"),]

energy.filtered$Global_active_power <- as.numeric(energy.filtered$Global_active_power)
energy.filtered$Date <- as.Date(energy.filtered$Date, format="%d/%m/%Y")
energy.filtered$DateTime <- as.POSIXct(paste(energy.filtered$Date, energy.filtered$Time))

## construct the plot

png("plot3.png", width=480, height=480)
with(energy.filtered,
{     
   plot(Sub_metering_1, 
        type="l",
        ylab="Global Active Power (kilowatts)", 
        xlab="")
   lines(Sub_metering_2, 
        col="red")
   lines(Sub_metering_3, 
        col="blue")
})
legend("topright", 
       col=c("black", "red", "blue"), 
       lty=1, 
       lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
