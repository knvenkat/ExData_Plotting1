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
# Draw histogram
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
#Export into current working directory as PNG file
dev.copy(png, "plot1.png")
#png 
#4 
# Switch back to main screen
dev.off()