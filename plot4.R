#Checking the size of the file 
file.info("household_power_consumption.txt")$size

#Preparing data
names <- names(read.table("household_power_consumption.txt", sep=";", header=T, nrow=1))
row_number <- 1440*46+(6*60)+36
data <- read.table("household_power_consumption.txt", sep=";", header=T, skip=row_number,nrow=1440*2+1)
names(data)<-names
data$Date <- as.Date(data$Date,  "%d/%m/%Y")


#Weekdays
day_change <- which(data$Time=="00:00:00")
days <- data[day_change,]


#Plotting
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(1,1,1,1))

#plot1
plot(data$Global_active_power, type = "l", ylab ="Global Active Power", xlab="", xaxt="n")
axis(1, at = day_change, labels = c("Thu", "Fri", "Sat"))

#plot2
plot(data$Voltage, type = "l", ylab ="Voltage", xlab="Datetime", xaxt="n")
axis(1, at = day_change, labels = c("Thu", "Fri", "Sat"))

#plot3
plot(data$Sub_metering_1, ylab="Energy sub metering", xlab="Datetime",  xaxt="n", type ="l")
lines(data$Sub_metering_2, col ="red")
lines(data$Sub_metering_3, col ="blue")
axis(1, at = day_change, labels = c("Thu", "Fri", "Sat"))
legend("topright", lty=c(1,1,1),col=c("black","red", "blue"), 
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), cex=0.6,
       bty ="n")

#plot4
plot(data$Global_reactive_power, type = "l", ylab ="Global_reactive_power", xlab="Datetime", xaxt="n")
axis(1, at = day_change, labels = c("Thu", "Fri", "Sat"))

#Saving PNG
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
