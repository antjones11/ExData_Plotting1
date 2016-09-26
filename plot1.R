plot1 <- function(){
  
  # file to load dataset, create histogram and save resulting graphic in "plot1.png"
  # assumes that the input data is located in current working directory
  
  df <- read.table("household_power_consumption.txt", sep =";", header=TRUE,na.strings="?")

  #concat first two columns as text, then convert to date
  z <- paste(as.character(df$Date),as.character(df$Time))
  df$datetime <- strptime(z,"%d/%m/%Y %H:%M:%S")

  #cast the columns into more reasonable types
  df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
  df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
  df$Voltage <- as.numeric(as.character(df$Voltage))
  df$Global_intensity <- as.numeric(as.character(df$Global_intensity))
  df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
  df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
  df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
  
  #subset on samples between 1st Feb 2007, 00:00:00 and 3rd Feb 2007 00:00:00
  data.subset <- subset(df,datetime >= "2007-02-01" & datetime < "2007-02-03")
  
  png(file="plot1.png",
      width=480,
      height=480,
      units="px")
  
  
  #create the plot
  hist(data.subset$Global_active_power,
       main="Global Active Power",
       xlab="Global Active Power (kilowatts)",
       col="orange",
       xlim=c(0,6),
       ylim=c(0,1200),
       xaxt='n',
       ylab="Frequency",
       breaks=12)
  
  
  axis(1,at=seq(0,6,2),labels=seq(0,6,2))
  axis(2,at=seq(0,1200,200),labels=seq(0,1200,200))
  

  
  dev.off()
}