#Step 1 - Get Data
data_full <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

#Step 2 - Subsetting the Data
data <- subset(data_full, subset=(Date >= "2007-02-01" & "2007-02-02"))
rm(data_full)

#Step 3 - Converting Dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Step 4 - Generate the Plot
plot(data$Global_active_power~data$Datetime, type="1", ylab="Global Active Power (kilowatts)", xlab="")

#Step 5 - Saving to File
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
