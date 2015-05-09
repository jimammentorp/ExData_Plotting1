#plot2.R

#Data Preparation

#setwd("~/Exploratory Data Analysis")

data_full <- read.table("household_power_consumption.txt", dec=".", sep=";",header=T)

data_subset <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007"),]

gap_num<-as.numeric(as.character(data_subset$Global_active_power))

dateandtime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "),"%d/%m/%Y %H:%M:%S") 

#Create Plot and Image

png("plot2.png", width=480, height=480)

plot(dateandtime, gap_num, xlab="", ylab="Global Active Power (kilowatts)", type="l")

dev.off()

