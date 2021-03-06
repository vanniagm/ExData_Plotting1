data <- read.csv.sql("./data/household_power_consumption.txt", "select * from file where Date ='1/2/2007' OR Date ='2/2/2007'",sep=";",header=TRUE,eol = "\n")
data$Date<-as.Date(data$Date)
data$datetime<-strptime(paste(data$Date, data$Time,sep = " "), format="%d/%m/%Y %H:%M:%S")
grep("\\?",data)
with(data,plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
lines(data$datetime,data$Sub_metering_2,col="red")
lines(data$datetime,data$Sub_metering_3,col="blue")
legend("topright",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
dev.copy(png,file="plot3.png")
dev.off()