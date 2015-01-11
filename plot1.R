household_power_consumption <- read.csv("~/Coursera courses/Exploratory Data Analysis/Week 1/household_power_consumption.txt", sep=";")

pow = household_power_consumption

pow = pow[which(pow$Date == '1/2/2007' | pow$Date == '2/2/2007'),]
active = as.numeric(pow$Global_active_power)

png(file = 'plot1.png')
hist(active/1000, main = "Global Active Power",xlab = "Global Active Power (Kilowatts)", col = "red")
dev.off()

