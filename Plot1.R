#Read the data 
usage <- read.table('household_power_consumption.txt', header=TRUE, sep=';') 

#Make the histogram (with titles and all!) 
hist(as.numeric(usage$Global_active_power), col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)') 
#Save the plot to a .png file 
dev.copy(png, 'Plot1.png') 
dev.off() 
