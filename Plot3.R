### Plot 3
##Loading information into R
library(readr)
SourceData <- read_delim("household_power_consumption.txt", 
                         ";", escape_double = FALSE, na = "?", 
                         trim_ws = TRUE)
##Generating new column of complete data & time
DaT<-paste(SourceData$Date, SourceData$Time, sep = " ")
DaT<-strptime(DaT, "%d/%m/%Y %H:%M:%S")
SourceData<-cbind(SourceData,DaT)
##Reviewing and correcting data classes. Only Date is being reclassed.
str(SourceData)
SourceData$Date<-as.Date(SourceData$Date, format = "%d/%m/%Y")
##Subsetting data
Target<-subset(SourceData,Date=="2007-02-01"|Date=="2007-02-02")
##Creating the plot
png("Plot3.png")
plot(Target$DaT, Target$Sub_metering_1, type = "l", 
     xlab = " ", 
     ylab = "Energy Sub metering")
lines(Target$DaT, Target$Sub_metering_2, type = "l", col = "red")
lines(Target$DaT, Target$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub metering 1", "Sub metering 2", "Sub metering 3"), 
       lty = 1, lwd = 3, col = c("black", "red", "blue"))
dev.off()
