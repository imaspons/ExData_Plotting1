#Checking the size of the file 
file.info("household_power_consumption.txt")$size

#Preparing data
names <- names(read.table("household_power_consumption.txt", sep=";", header=T, nrow=1))
row_number <- 1440*46+(6*60)+36
data <- read.table("household_power_consumption.txt", sep=";", header=T, skip=row_number,nrow=1440*2)
names(data)<-names
data$Date <- as.Date(data$Date,  "%d/%m/%Y")

#Plotting data
hist(data$Global_active_power, main= "Global Active Power", col="red", xlab="Global Active Power (kiloWatts)")

#Saving PNG
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()