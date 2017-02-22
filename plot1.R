##this is the code to create the file for plotting against


fileurl<-("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
download.file(fileurl,destfile="./powerconsumption.zip")
unzip("./powerconsumption.zip")
pwrconsum<-read.table("./household_power_consumption.txt",sep=";", header=TRUE)

pwrconsum$Date<-as.Date(pwrconsum$Date, format="%d/%m/%Y")
##convert date colum as date
pwrdfsub <- pwrconsum[(pwrconsum$Date=="2007-02-01") | (pwrconsum$Date=="2007-02-02"),]
##subset days wanted

pwrdf<-pwrdfsub
##makesubset master to check numeric conversions against
##transform time into POSIXLt class
##need to convert time from factor to character
pwrdf$Time<-as.character(pwrdf$Time)
pwrdf$Date<-as.character(pwrdf$Date)
pwrdf$timestamp <- paste(pwrdf$Date, pwrdf$Time, sep=" ")
pwrdf$timestamp<-strptime(pwrdf$timestamp,format="%Y-%m-%d %H:%M:%S")
##transform columns to numeric classs
pwrdf$Global_active_power<-as.numeric(as.character(pwrdf$Global_active_power))
##test one make sure command is taken
class(pwrdf$Global_active_power)
## transform all other colums to numeric class

pwrdf$Global_reactive_power<-as.numeric(as.character(pwrdf$Global_reactive_power))
pwrdf$Voltage<-as.numeric(as.character(pwrdf$Voltage))
pwrdf$Global_intensity<-as.numeric(as.character(pwrdf$Global_intensity))
pwrdf$Sub_metering_1<-as.numeric(as.character(pwrdf$Sub_metering_1))
pwrdf$Sub_metering_2<-as.numeric(as.character(pwrdf$Sub_metering_2))
pwrdf$Sub_metering_3<-as.numeric(as.character(pwrdf$Sub_metering_3))

##then proceed to create plot 1 and save in png and turn device off

with(pwrdf,hist(pwrdf$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)"))
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

  
  