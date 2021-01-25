# Creating the second plot

# Loading data
filepath <- "/Users/Mohammad/Research/Coursera/Data_Analysis_R"
setwd(filepath)
if(!file.exists("./dataset")) {dir.create("./dataset")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./dataset/Household_Power_Consumption_UCIrvineML.zip",method="curl")
unzip(zipfile="./dataset/Household_Power_Consumption_UCIrvineML.zip",exdir="./dataset")

#read data
data <- read.table("./dataset/household_power_consumption.txt",sep=';',header=TRUE,stringsAsFactors=FALSE,na.strings = '?')

#Using data from the dates 2007-02-01 and 2007-02-02 :
selectedData <- data[data$Date %in% c("1/2/2007","2/2/2007"),] 
global_active_power <- selectedData$Global_active_power
times <- strptime(paste(selectedData$Date,selectedData$Time),format="%d/%m/%Y %H:%M:%S")
submeter1 <- selectedData$Sub_metering_1
submeter2 <- selectedData$Sub_metering_2
submeter3 <- selectedData$Sub_metering_3

# Overlaying multiple plots
plot(times, submeter1, type="l", ylab="Energy Submetering")
lines(times, submeter2, type="l", col="red")
lines(times, submeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
invisible(dev.copy(png,file="dataset/plot3.png"))
invisible(dev.off())