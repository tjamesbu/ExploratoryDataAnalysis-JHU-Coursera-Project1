#Step 1 - Get Data
data_full <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

#Step 2 - Subsetting the Data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

#Step 3 - Converting Dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Step 4 - Generate the Plot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
    plot(Global_active_power~Datetime, type="1", ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~Datetime, type="1", ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~Datetime, type="1", ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime, col="red")
    lines(Sub_metering_3~Datetime, col="blue")
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="1", ylab="Global Active Power (kilowatts)", xlab="")
})

#Step 5 - Saving to File
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
