library(dplyr)
#data setup
#reading the data
df <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings = "?")
#changing data format
df$Date <- as.Date(df$Date,"%d/%m/%Y")
#filter data for the given date range
df <- filter(df,Date == as.Date("2007-2-1") | Date == as.Date("2007-2-2"))
#plot1
dev.copy(png,'plot1.png', width=480, height=480)
hist(as.numeric(df$Global_active_power),col="red",xlab="Global Active Power (kilowatts)"
     ,ylab="Frequency",main="Global Active Power")
dev.off()