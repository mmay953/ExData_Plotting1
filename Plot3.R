
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
png("Plot 3.png")  #height & width already set

with(powcon, plot(mytime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(powcon,points(mytime, Sub_metering_2, col="red", type="l"))
with(powcon,points(mytime, Sub_metering_3, col="blue", type="l"))
legend("topright",lty=1,col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off() 

library(png)
Plot3 <- readPNG("Plot 3.png")
rasterImage(Plot3,0,0,100,100)







