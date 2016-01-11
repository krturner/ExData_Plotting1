#Read the data 
usage <- read.table('household_power_consumption.txt', header=TRUE, sep=';', stringsAsFactors = FALSE) 
finaldata <- usage[usage$Date == '1/2/2007' | usage$Date == '2/2/2007',]
finaldata$Date <- strptime(paste(finaldata$Date, finaldata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Create the line plot
png("./plot3.png", width = 480, height = 480)
plot(finaldata$Date, finaldata$Sub_metering_1, type='l', xlab='',ylab='Energy sub metering')
lines(finaldata$Date, finaldata$Sub_metering_2, col='red')
lines(finaldata$Date, finaldata$Sub_metering_3, col='blue')
legend('topright',c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'), border='black', col=c('black','red','blue'), lty=c(1,1))

#Save the plot to a .png file 
dev.copy(png, 'Plot3.png') 
dev.off() 