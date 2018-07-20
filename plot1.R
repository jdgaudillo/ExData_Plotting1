file <- 'household_power_consumption.txt'

# Column names
fields <- c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 
            'Voltage', 'Global_intensity', 'Sub_metering_1', 
            'Sub_metering_2', 'Sub_metering_3')x

# Read rows [2007/02/01, 2007/02/02]
df <- read.csv(file, sep=';', skip=66635, nrow=2881, header = TRUE)
names(df) <- fields

# Open image file
png('plot1.png')

# Create histogram
hist(df$Global_active_power, xlab='Global active power (kilowatts)', main='Global Active Power', col='red',
     xlim=c(0,6), ylim=c(0,1200))

# Close file
dev.off()