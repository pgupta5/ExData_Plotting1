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
#plot2
dev.copy(png,'plot2.png', width=480, height=480)
plot(df$Global_active_power~df$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
