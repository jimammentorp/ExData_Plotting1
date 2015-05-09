#plot1.R

#Data Preparation

#setwd("~/Exploratory Data Analysis")

data_full <- read.table("household_power_consumption.txt", dec=".", sep=";",header=T)

data_subset <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007"),]

gap_num<-as.numeric(as.character(data_subset$Global_active_power))


#Create Plot and Image

png("plot1.png", width=480, height=480)

hist(gap_num, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()

