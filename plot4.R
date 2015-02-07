# Reading data into table
data <- read.csv("household_power_consumption.txt", sep=";", na.strings=c("?"))
data <- subset(data, Date =="1/2/2007" | Date == "2/2/2007")
# Setting size of overall window
par(fin = c(5.7, 4.7))
# Setting size of plot area
par(pin = c(3.2, 2.4))
# Setting margins
par(mar = c(4,4,2,1))
#Adjusting main title font
par(cex.main = 0.9)
# Adjusting axis font size
par(cex.axis = 0.7)
# Adjusting axis label font size
par(cex.lab = 0.8)
# Splitting the screen to four containers
par(mfrow=c(2,2))
# Making a dataset to be used for plot commands
d4 <- mutate(data, Date, Time, dmy_hms(paste(Date, Time)))
colnames(d4) <- c("Date", "Time", "metric", "reactive", "volt", "int", "c1", "c2", "c3", "stamp")
# Drawing first plot
plot(d4$stamp, d4$metric, pch=21, col="white", bg = "white", xlab="", ylab="Global Active Power")
lines(d4$stamp, d4$metric, col="black")
# Drawing second plot
plot(d4$stamp, d4$volt, pch=21, col="white", bg="white",xlab="datetime",ylab="Voltage")
lines(d4$stamp, d4$volt, col = "black")
# Drawing third plot and ignoring border for legend
plot(d4$stamp, d4$c1, pch=21, bg = "white", col= "white", xlab="", ylab = "Energy sub metering")
lines(d4$stamp, d3$c1, col="black")
lines(d4$stamp, d4$c2, col = "red")
lines(d4$stamp, d4$c3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.7, lwd=2, col=c("black", "red", "blue"), bty = "n")
# Drawing fourth plot
plot(d4$stamp, d4$reactive, pch=21, col="white", bg="white", xlab="datetime", ylab="Global_reactive_power")
lines(d4$stamp, d4$reactive)
# Exporting data and closing session
dev.copy(png, "plot4.png")
dev.off()





