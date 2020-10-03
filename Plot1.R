### Plot 1
##Loading information into R
library(readr)
SourceData <- read_delim("household_power_consumption.txt", 
                                          ";", escape_double = FALSE, na = "?", 
                                          trim_ws = TRUE)
##Reviewing and correcting data classes. Only Date is being reclassed.
str(SourceData)
SourceData$Date<-as.Date(SourceData$Date, format = "%d/%m/%Y")
##Subsetting data
Target<-subset(SourceData,Date=="2007-02-01"|Date=="2007-02-02")
##Creating the plot
png("Plot1.png")
hist(Target$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
