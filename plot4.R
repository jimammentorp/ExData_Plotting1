#plot3.R

#Data Preparation

#setwd("~/Exploratory Data Analysis")

data_full <- read.table("household_power_consumption.txt", dec=".", sep=";",header=T)

data_subset <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007"),]

gap_num<-as.numeric(as.character(data_subset$Global_active_power))

grp_num<-as.numeric(as.character(data_subset$Global_reactive_power))

voltage<-as.numeric(as.character(data_subset$Voltage))

Sub_metering_1<-as.numeric(as.character(data_subset$Sub_metering_1))
Sub_metering_2<-as.numeric(as.character(data_subset$Sub_metering_2))
Sub_metering_3<-as.numeric(as.character(data_subset$Sub_metering_3))

dateandtime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "),"%d/%m/%Y %H:%M:%S") 

#Create Plots and Images

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(dateandtime, gap_num, xlab="", ylab="Global Active Power", type="l")

plot(dateandtime, voltage, xlab="datetime", ylab="Voltage", type="l")

plot(dateandtime, Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")

lines(dateandtime, Sub_metering_2, col="red", type="l")
lines(dateandtime, Sub_metering_3, col="blue", type="l")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, bty="n")

plot(dateandtime, grp_num, xlab="datetime", ylab="Global_reactive_power", lwd=0.2, type="l")

dev.off()


