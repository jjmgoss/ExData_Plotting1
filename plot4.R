household_power_consumption <- read.csv("~/Coursera courses/Exploratory Data Analysis/Week 1/household_power_consumption.txt", sep=";")

pow = household_power_consumption

pow = pow[which(pow$Date == '1/2/2007' | pow$Date == '2/2/2007'),]
pow$Sub_metering_2 = as.numeric(pow$Sub_metering_2)

pow$datetime =  strptime(paste(pow$Date, pow$Time), format = "%d/%m/%Y %H:%M:%S")



png(file = "plot4.png")
par(mfrow = c(2,2))
plot(pow$datetime,as.numeric(pow$Global_active_power)/1000, ylab = "Global Active Power (Kilowatts)",xlab = " ", type = "l")
plot(pow$datetime, as.numeric(pow$Voltage), ylab = "Voltage", xlab = "datetime", type ="l")

plot(pow$datetime, pow$Sub_metering_1, ylab = "Energy sub metering", type = "n")
lines(pow$datetime, pow$Sub_metering_1)
lines(pow$datetime, pow$Sub_metering_2, col = "red")
lines(pow$datetime, pow$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)


plot( pow$datetime,as.numeric(pow$Global_reactive_power)/400, ylab ="Global_reactive_power", xlab = "datetime", type = "l" )
dev.off()