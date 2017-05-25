
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# setwd("C:/Users/mmay/Desktop/Coursera/Data Scientist Toolbox - John Hopkins/4) Exploratory Data Analysis/Data")
# download.file(url, "powcon")
# unzip("powcon")
powcon <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

#powcon$Date <- replace(powcon$Date,1, as.Date("powcon$Date",format = "%d/%m/%Y"))
powcon <- subset(powcon, Date %in% c("1/2/2007","2/2/2007"))

# PLOT 1 ##

png("Plot 1.png")  #height & width already set
hist(powcon$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main = "Global Active Power")
dev.off()

Plot1 <- readPNG("Plot 1.png")
rasterImage(Plot1,0,0,40,50)




