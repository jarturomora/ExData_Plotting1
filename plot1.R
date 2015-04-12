#*********************
#*Initial assumptions*
#*********************
# 1. The DATA is stored in a particular directory under the path "../data/household_power_consumption.txt"
#    and can be changed in the "dataSource" argument.
# 2. This script was created using Ubuntu 14.04

plot1 <- function(dataSource) {
  #Loading the data
  dataNames <- read.table(dataSource, header=TRUE, sep=";", nrows=1)
  # February 1st 2007 is on the 66637th row
  dataSet <- read.table(dataSource, sep=";",na.strings=c("NA","?"), skip=66637, nrows=2880)
  # Assign names to the data frame to clean it up
  names(dataSet) <- names(dataNames)
  
  # Plot data
  par(mfrow=c(1,1))
  hist(dataSet$Global_active_power, main="Global Active Power", 
       xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
  
  # Save to file
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
}