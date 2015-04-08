header <- read.table("./data/household_power_consumption.txt", nrows = 1, header = FALSE, sep=';', stringsAsFactors = FALSE)
dat <- read.table("./data/household_power_consumption.txt", na.strings = '?', quote = "", sep = ';', header = FALSE, skip=66637, nrows = 2880)
colnames(dat) <- unlist(header)
dat$DateTime = paste(dat$Date, dat$Time)
dat$DateTime = strptime(dat$DateTime, "%d/%m/%Y %H:%M:%S")

png(filename = "plot1.png", width=480, height=480)
hist(dat$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

