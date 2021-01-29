# Creating the first plot

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

#histogram
hist(global_active_power ,main="Global Active Power",xlab="Global Active Power (kilowatts)",col = 'red')
invisible(dev.copy(png,file="dataset/plot1.png"))
invisible(dev.off())