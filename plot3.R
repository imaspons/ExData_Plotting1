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

plot(data$Sub_metering_1, ylab="Energy sub metering",  xaxt="n", type ="l", xlab="")
lines(data$Sub_metering_2, col ="red")
lines(data$Sub_metering_3, col ="blue")
axis(1, at = day_change, labels = c("Thu", "Fri", "Sat"))
legend("topright", lty=c(1,1,1), lwd=c(2,2,2,2),col=c("black","red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

#saving PNG
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()