#Step 1 - Get Data
data_full <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Data(data_full$Date, format="%d/%m/%Y")

#Step 2 - Subsetting the Data
data <- subset(data_full, subset=(Date >= "2007-02-01" & "2007-02-02"))
rm(data_full)

#Step 3 - Converting Dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Step 4 - Generate the Plot
with(data, {
    plot(Sub_metering_1~Datetime, type="1", ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime, col="red")
    lines(Sub_metering_3~Datetime, col="blue")
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Step 5 - Save to File
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
