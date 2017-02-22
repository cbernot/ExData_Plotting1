##then proceed to create plot 2 and save in png and turn device off

with(pwrdf,plot(pwrdf$timestamp,pwrdf$Global_active_power,xlab="",ylab="Global Active Power(kilowatts)",type="l"))
dev.copy(png, file="plot2.png", width=480, height=480,units="px",bg="white")
dev.off()



