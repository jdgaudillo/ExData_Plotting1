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

# Open image file
png('plot4.png', height = 480, width = 480)

# Set up plot
par(mfrow = c(2, 2))

# Create plots
plot(df$Global_active_power ~ df$DateTime, xlab='', 
     ylab = 'Global active power (kilowatts)', ylim=c(0, 6), type='l')

plot(df$Voltage ~ df$DateTime, xlab='datetime', 
     ylab = 'Voltage', type='l')

plot(df$Sub_metering_1 ~ df$DateTime, type='l', ylim=c(0, 30), xlab='', 
     ylab='Energy sub metering')
lines(df$Sub_metering_2 ~ df$DateTime, col='Red')
lines(df$Sub_metering_3 ~ df$DateTime, col='Blue')
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(df$Global_reactive_power ~ df$DateTime, type='l', xlab='datetime',
     ylab='Global_reactive_power')

# Close file
dev.off()