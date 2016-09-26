plot3 <- function(){
  
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
  
  png(file="plot3.png",
      width=480,
      height=480,
      units="px")
  
  
  #create the plot
  plot(data.subset$datetime,
       data.subset$Sub_metering_1,
       type="l",
       xlab="",
       ylab="Energy sub metering")
  
  
  points(data.subset$datetime,
         data.subset$Sub_metering_2,
         type="l",
         col="red")
  
  points(data.subset$datetime,
         data.subset$Sub_metering_3,
         type="l",
         col="blue")
  
  legend("topright", 
         col=c("black","red","blue"),
         lty=1,
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  dev.off()
}