file <- 'household_power_consumption.txt'

# Column names
fields <- c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 
            'Voltage', 'Global_intensity', 'Sub_metering_1', 
            'Sub_metering_2', 'Sub_metering_3')x

# Read rows [2007/02/01, 2007/02/02]
df <- read.csv(file, sep=';', skip=66635, nrow=2881, header = TRUE, na.strings = '?')

# Convert class of Date
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
# Combine date and time
df$DateTime <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")

# Convert class to POSIXct
df$DateTime <- as.POSIXct(df$DateTime)

png('plot2.png', height = 480, width = 480)
plot(df$Global_active_power ~ df$DateTime, type='l', xlab='', ylab='Global active power (kilowatts)')
dev.off()