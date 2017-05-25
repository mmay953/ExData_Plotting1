


url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# setwd("C:/Users/mmay/Desktop/Coursera/Data Scientist Toolbox - John Hopkins/4) Exploratory Data Analysis/Data")
# download.file(url, "powcon")
# unzip("powcon")
powcon <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

#powcon$Date <- replace(powcon$Date,1, as.Date("powcon$Date",format = "%d/%m/%Y"))
powcon <- subset(powcon, Date %in% c("1/2/2007","2/2/2007"))

# PLOT 3 ##

library(lubridate)

wday(powcon$Date)

mytime <- as.POSIXct(paste(powcon$Date, powcon$Time), format="%d/%m/%Y %H:%M:%S")
head(powcon)

powcon <- cbind(mytime, powcon)    


names(powcon)
#head(powcon)  
png("Plot 4.png")  #height & width already set

par(mfrow=c(2,2), mar = c(5,5,2,2))

with(powcon, plot(mytime,Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

with(powcon, plot(mytime,Voltage, type="l", xlab="datetime", ylab="Voltage"))

with(powcon, plot(mytime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(powcon,points(mytime, Sub_metering_2, col="red", type="l"))
with(powcon,points(mytime, Sub_metering_3, col="blue", type="l"))
legend("topright",border="white",lty=1,col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(powcon, plot(mytime,Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

dev.off() 

library(png)
Plot4 <- readPNG("Plot 4.png")
rasterImage(Plot2,0,0,100,100,0)








