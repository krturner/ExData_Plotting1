#Read the data 
usage <- read.table('household_power_consumption.txt', header=TRUE, sep=';', stringsAsFactors = FALSE) 
finaldata <- usage[usage$Date == '1/2/2007' | usage$Date == '2/2/2007',]
finaldata$Date <- strptime(paste(finaldata$Date, finaldata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Open the png graphics device
png("./Plot4.png", width = 480, height = 480)

#Setup the 2x2 plot grid
par(mfrow=c(2,2))

#Create the top-left plot (same as Plot2)
plot(finaldata$Date,finaldata$Global_active_power,type='l', ylab='Global Active Power (kilowatts)',xlab='')

#Create the top-right plot
plot(finaldata$Date,finaldata$Voltage,type='l', ylab='Voltage',xlab='datetime')

#Create the bottom-left plot
plot(finaldata$Date, finaldata$Sub_metering_1, type='l', xlab='',ylab='Energy sub metering')
lines(finaldata$Date, finaldata$Sub_metering_2, col='red')
lines(finaldata$Date, finaldata$Sub_metering_3, col='blue')
legend('topright',c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'), border='black', col=c('black','red','blue'), lty=c(1,1))

#Create the bottom-right plot
plot(finaldata$Date,finaldata$Global_reactive_power,type='l', ylab='Global_reactive_power',xlab='datetime')

#Close the png graphics device 
dev.off() 