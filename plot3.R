##then proceed to create plot 3 and save in png and turn device off
with(pwrdf,{
  plot(timestamp,Sub_metering_1, xlab="",ylab="Energy sub metering",type="l")
  lines(timestamp,Sub_metering_1,col="black")
  lines(timestamp,Sub_metering_2,col="red")
  lines(timestamp,Sub_metering_3,col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black", "red","blue"),lty=1)})
dev.copy(png, file="plot3.png", width=480, height=480,units="px",bg="white")
dev.off()

