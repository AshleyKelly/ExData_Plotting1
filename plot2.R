<<<<<<< HEAD
## Coursera - Exploratory Data Analysis
## Week 1 - Project 1 - Plot 2
## Ashley M. Kelly

plot2 <- function() {
  ## Our overall goal here is simply to examine how household energy usage varies over a 2-day period 
  ## in February, 2007. Your task is to reconstruct the following plots below, all of which were constructed 
  ## using the base plotting system.
  if(!file.exists("exdata-data-household_power_consumption.zip")) {
    temp <- tempfile()
    download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
    file <- unzip(temp)
    unlink(temp)
  }
  
  ## The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of how much memory the 
  ## dataset will require in memory before reading into R. Make sure your computer has enough memory.
  power <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
  names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  
  ## We will only be using data from the dates 2007-02-01 and 2007-02-02. 
  ## Read the data from just those dates rather than reading in the entire dataset and subset to those dates.
  power_subset <- subset(power, power$Date=="1/2/2007" | power$Date =="2/2/2007")
  
  ## Convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.
  power_subset$Date <- as.Date(power_subset$Date, format="%d/%m/%Y")
  power_subset$Time <- strptime(power_subset$Time, format="%H:%M:%S")
  power_subset[1:1440,"Time"] <- format(power_subset[1:1440,"Time"],"2007-02-01 %H:%M:%S")
  power_subset[1441:2880,"Time"] <- format(power_subset[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
  
  ## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
  ## Name each of the plot files as plot1.png, plot2.png, etc.
  png("plot2.png", width=480, height=480)
  plot(power_subset$Time,as.numeric(as.character(power_subset$Global_active_power)) ,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  dev.off()
}
=======
version https://git-lfs.github.com/spec/v1
oid sha256:015029b12449b349164556ac0ba2f9e197f3416193d4d540ab9cc7caee34aaa5
size 2180
>>>>>>> 9d8a3d7972904ab50c0f6b49cfb4e5d3a433f8a6
