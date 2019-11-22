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
plot(data$Global_active_power, type = "l", ylab ="Global Active Power (kiloWatts)", xlab="", xaxt="n")
axis(1, at = day_change, labels = c("Thu", "Fri", "Sat"))

#Saving PNG
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
