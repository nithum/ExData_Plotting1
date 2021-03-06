header <- read.table("./data/household_power_consumption.txt", nrows = 1, header = FALSE, sep=';', stringsAsFactors = FALSE)
dat <- read.table("./data/household_power_consumption.txt", na.strings = '?', quote = "", sep = ';', header = FALSE, skip=66637, nrows = 2880)
colnames(dat) <- unlist(header)
dat$DateTime = paste(dat$Date, dat$Time)
dat$DateTime = strptime(dat$DateTime, "%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png", width=480, height=480)
plot(dat$DateTime, dat$Sub_metering_1, type="l", col = "black", ylab = "Energy sub metering", xlab = "")
lines(dat$DateTime, dat$Sub_metering_2, type="l", col = "red")
lines(dat$DateTime, dat$Sub_metering_3, type="l", col = "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", labels, lty=1, col = c("black","red","blue"))
dev.off()
