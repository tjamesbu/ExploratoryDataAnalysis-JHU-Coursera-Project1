#Step 1 - Get Data
data_full <- read.csv("./Data/household_power_consumption.txt", headers=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

#Step 2 - Subsetting the Data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

#Step 3 - Converting Dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Step 4 - Generate the Histogram
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

#Step 5 - Saving to File
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
