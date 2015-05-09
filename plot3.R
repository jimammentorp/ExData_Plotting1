#plot3.R

#Data Preparation

#setwd("~/Exploratory Data Analysis")

data_full <- read.table("household_power_consumption.txt", dec=".", sep=";",header=T)

data_subset <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007"),]

Sub_metering_1<-as.numeric(as.character(data_subset$Sub_metering_1))
Sub_metering_2<-as.numeric(as.character(data_subset$Sub_metering_2))
Sub_metering_3<-as.numeric(as.character(data_subset$Sub_metering_3))

dateandtime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "),"%d/%m/%Y %H:%M:%S") 

#Create Plot and Image

png("plot3.png", width=480, height=480)

plot(dateandtime, Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")

lines(dateandtime, Sub_metering_2, col="red", type="l")
lines(dateandtime, Sub_metering_3, col="blue", type="l")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, lwd=2)

dev.off()


