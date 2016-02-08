#loading data
#edata<-read.table(file = "household_power_consumption.txt",header = TRUE,sep = ';',stringsAsFactors=FALSE)

#filter data by date
#sdata<-edata[which(edata$Date == "1/2/2007" | edata$Date=="2/2/2007"),]

#convert power to numeric
sdata$Global_active_power<-as.numeric(sdata$Global_active_power)



#get the histogram
png(file="plot4.png", bg="transparent",width = 480,height = 480,units = "px")

par(mfrow=c(2,2))

#plot1
plot(x1,sdata$Global_active_power,
     type ="l",ylim = c(0,8),ylab = "",xlab="")
title(ylab="Global Active Power (kilowatts)")

#plot2

plot(x1,sdata$Voltage,type ="l",ylim = c(232,246),ylab = "Voltage",
      xlab = "datetime",col="black")



#plot3
plot(x1,sdata$Sub_metering_1,type ="n",ylim = c(0,40),ylab = "",
     xlab="")

title(ylab="Energy sub metering")
lines(x1,sdata$Sub_metering_1,type ="l",ylim = c(0,40),ylab = "",xlab = "",col="black")
lines(x1,sdata$Sub_metering_2,type ="l",ylim = c(0,40),ylab = "",xlab = "",col="red")
lines(x1,sdata$Sub_metering_3,type ="l",ylim = c(0,40),ylab = "",xlab = "",col="blue")
legend("topright", inset=.05, c("Sub_metering_1","Sub_metering_2",
                                "Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))


#plot4
plot(x1,sdata$Global_reactive_power,type ="l",ylim = c(0,0.5)
      ,ylab = "Global_reactive_power",xlab = "datetime",col="black")


dev.off()

