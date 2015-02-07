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
# Making a dataset to be used for plot commands
d3 <- data %>% select(Date, Time, Global_active_power, Sub_metering_1, Sub_metering_2, Sub_metering_3) %>% mutate(Date, Time, dmy_hms(paste(Date, Time)))
colnames(d3) <- c("date", "time", "metric","c1","c2","c3","stamp")
# Drawing plot in two step process. First transparent plots and visible lines
plot(d3$stamp, d3$c1, pch=21, bg = "white", col= "white", xlab="", ylab = "Energy sub metering")
lines(d3$stamp, d3$c1, col="black")
lines(d3$stamp, d3$c2, col = "red")
lines(d3$stamp, d3$c3, col = "blue")
# Making legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.7, lwd=2, col=c("black", "red", "blue"))
#Export into current working directory as PNG file
dev.copy(png, "plot2.png")
#png 
#4 
# Switch back to main screen
dev.off()
