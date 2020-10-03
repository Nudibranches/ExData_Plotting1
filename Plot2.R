### Plot 2
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
png("Plot2.png")
plot(Target$DaT, Target$Global_active_power, type = "l", 
     xlab = " ", 
     ylab = "Global Active Power (kilowatts)")
dev.off()
