#loading data
edata<-read.table(file = "household_power_consumption.txt",header = TRUE,sep = ';',stringsAsFactors=FALSE)

#filter data by date
sdata<-edata[which(edata$Date == "1/2/2007" | edata$Date=="2/2/2007"),]

#convert power to numeric
sdata$Global_active_power<-as.numeric(sdata$Global_active_power)

#get the histogram
png(file="plot2.png", bg="transparent",width = 480,height = 480,units = "px")


plot(x1,sdata$Global_active_power,type ="l",ylim = c(0,8),ylab = "",xlab="")
title(ylab="Global Active Power (kilowatts)")

dev.off()

