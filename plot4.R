##then proceed to create plot 1 and save in png and turn device off
##played with format of multipanel plots to achieve similar look.mar impacted
##whether xlab and ylab displayed
par(mfcol= c(2, 2), mar = c(4, 4, 2, 2))
with(pwrdf,{
  ##plot one loading in column format
  plot(timestamp,Global_active_power,xlab="",ylab="Global Active Power",type="l")
  ##plot two with legend adjustments
  plot(timestamp,Sub_metering_1, xlab="",ylab="Energy sub metering",type="n")
  lines(timestamp,Sub_metering_1,col="black")
  lines(timestamp,Sub_metering_2,col="red")
  lines(timestamp,Sub_metering_3,col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black", "red","blue"),lty=1, bty="n", cex=.50)
  ##remove box and resize legend
  ##plot three
  plot(timestamp,Voltage, xlab="datetime",ylab="Voltage",type="l")
  
  ##plot four and end of plotting
  plot(timestamp,Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")})

  ##copy to png of correct pixel
  
dev.copy(png, file="plot4.png", width=480, height=480, units="px",bg="white")
##close device
dev.off()

