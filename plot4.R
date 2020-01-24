## plot3.R
## Coursera Exploratory Data Analysis - Assignment Week 1

## read the data, filter & transform

energy.total = read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
energy.filtered <- energy.total[energy.total$Date %in% c("1/2/2007","2/2/2007"),]

energy.filtered$Global_active_power <- as.numeric(energy.filtered$Global_active_power)
energy.filtered$Date <- as.Date(energy.filtered$Date, format="%d/%m/%Y")
energy.filtered$DateTime <- as.POSIXct(paste(energy.filtered$Date, energy.filtered$Time))

## construct the plot

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(energy.filtered,
{
   plot(Global_active_power~DateTime, type="l", 
        ylab="Global Active Power (kilowatts)", 
        xlab="")
   
   plot(Voltage~DateTime, type="l", 
        ylab="Voltage (volt)", 
        xlab="")
   
   plot(Sub_metering_1, 
        type="l",
        ylab="Global Active Power (kilowatts)", 
        xlab="")
   lines(Sub_metering_2, 
        col="red")
   lines(Sub_metering_3, 
        col="blue")
   legend("topright", 
          col=c("black", "red", "blue"), 
          lty=1, 
          lwd=2, 
          legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
   
   plot(Global_reactive_power~DateTime, type="l", 
        ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.off()
