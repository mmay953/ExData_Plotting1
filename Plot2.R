

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# setwd("C:/Users/mmay/Desktop/Coursera/Data Scientist Toolbox - John Hopkins/4) Exploratory Data Analysis/Data")
# download.file(url, "powcon")
# unzip("powcon")
powcon <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

#powcon$Date <- replace(powcon$Date,1, as.Date("powcon$Date",format = "%d/%m/%Y"))
powcon <- subset(powcon, Date %in% c("1/2/2007","2/2/2007"))

# PLOT 2 ##

library(lubridate)

wday(powcon$Date)

mytime <- as.POSIXct(paste(powcon$Date, powcon$Time), format="%d/%m/%Y %H:%M:%S")
    head(powcon)

powcon <- cbind(mytime, powcon)    

#head(powcon)  
png("Plot 2.png")  #height & width already set
with(powcon, plot(mytime,Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off() 

library(png)
Plot2 <- readPNG("Plot 2.png")
rasterImage(Plot2,10,10,10,10,0)




