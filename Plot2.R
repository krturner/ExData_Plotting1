#Read the data 
usage <- read.table('household_power_consumption.txt', header=TRUE, sep=';', stringsAsFactors = FALSE) 
finaldata <- usage[usage$Date == '1/2/2007' | usage$Date == '2/2/2007',]
finaldata$Date <- strptime(paste(finaldata$Date, finaldata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Create the line plot
plot(finaldata$Date,finaldata$Global_active_power,type='l', ylab='Global Active Power (kilowatts)',xlab='')

#Save the plot to a .png file 
dev.copy(png, 'Plot2.png') 
dev.off() 
