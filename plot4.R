data <- read.csv("data/household_power_consumption.txt", header=TRUE, sep=";")
feb_data <- subset(data,data$Date=='1/2/2007' | data$Date=='2/2/2007')
remove(data)
dateandtime <- paste(as.Date(feb_data$Date,format="%d/%m/%Y"), feb_data$Time)
dateandtime <- strptime(dateandtime,"%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))
##Draw Plot1
plot(dateandtime, as.numeric(as.character(feb_data$Global_active_power)), type="l", ylab="Global Active Power", xlab="" )

##Draw Plot1
plot(dateandtime, as.numeric(as.character(feb_data$Voltage)), type="l", ylab="Voltage", xlab="datetime" )

##Draw Plot3
plot(dateandtime, as.numeric(as.character(feb_data$Sub_metering_1)), type="l", ylab="Energy sub metering", xlab="",width=480,height=480,units="px" )
lines(dateandtime, as.numeric(as.character(feb_data$Sub_metering_2)), type="l", ylab="", xlab="", col="red")
lines(dateandtime, as.numeric(as.character(feb_data$Sub_metering_3)), type="l", ylab="", xlab="", col="blue")
legend("topright", lty=1, col = c("black","blue","red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty="n")

##Draw Plot4
with(feb_data,
plot(dateandtime, Global_reactive_power, type="l", xlab="datetime" )
)

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()