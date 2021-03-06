library(dplyr)
library(ggplot2)
#data setup
#reading the data
df <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings = "?")
#changing data format
df$Date <- as.Date(df$Date,"%d/%m/%Y")
#filter data for the given date range
df <- filter(df,Date == as.Date("2007-2-1") | Date == as.Date("2007-2-2"))
#Creating and adding new column
within(df, dateTime <- paste(df$Date, df$Time))
df$dateTime <- as.POSIXct(dateTime)

#plot4
dev.copy(png,'plot4.png', width=480, height=480)
par(mfrow=c(2,2))
plot(df$Global_active_power~df$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(df$Voltage~df$dateTime, type="l", ylab="Voltage", xlab="datetime")
plot(df$dateTime, df$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="",col="black")
lines(df$dateTime, df$Sub_metering_2, col="red", lwd=1)
lines(df$dateTime, df$Sub_metering_3, col="blue", lwd=1)
legend("topright", col=c("black", "red", "blue"), bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1),cex=0.8)
plot(df$Global_reactive_power~df$dateTime, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()
