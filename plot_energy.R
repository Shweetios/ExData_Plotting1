install.packages("mosaic")
install.packages("ggplot2")
install.packages("lubridate")
library(ggplot2)
library(mosaic)
library(lubridate)
#Download  data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","plot_data",mode = "wb")
data_energy<-read.table(unzip("plot_data"),header = TRUE,sep = ";")
tail(data_energy,5)
str(data_energy)

#Change format of date to type date
data_energy$Date<-as.Date(data_energy$Date,"%d/%m/%Y")
str(data_energy)
#Subset data for 2 days
data_energy<-subset(data_energy,data_energy$Date== "2007-02-01"|data_energy$Date== "2007-02-02")
#Check if subset works
unique(data_energy$Date)


#1 plot one
png(filename = "plot1.png")
hist(as.numeric(data_energy$Global_active_power),col = "red",xlab = "Global Active Power(killowatts)",main = "Global Active Power")
dev.off()
#2 plot 2
png(filename = "plot2.png")
dates<-with(data_energy, ymd(Date) + hms(Time))
with(data_energy,plot(dates,Global_active_power,xlab = "",type = "l"))
dev.off()

#3 plot 3
png(filename = "plot3.png")
with(data_energy,plot(dates,Sub_metering_1,pch ="",xlab = "",ylab = "Energy Sub Metering",type = "l"))
with(data_energy,lines(dates,Sub_metering_2,col = "red"))
with(data_energy,lines(dates,Sub_metering_3,col ="blue"))
legend("topright",legend = colnames(data_energy[,7:9]),col = c("black","red","blue"),pch = 20)
dev.off()

#4 plot 4
png(filename = "plot4.png")
par(mfrow = c(2,2))
with(data_energy,plot(dates,Global_active_power,xlab = "Date & Time",type = "l"))

with(data_energy,plot(dates,Voltage,xlab = "Date & Time",type = "l"))

with(data_energy,plot(dates,Sub_metering_1,pch ="",xlab = "",ylab = "Energy Sub Metering",type = "l"))
with(data_energy,lines(dates,Sub_metering_2,col = "red"))
with(data_energy,lines(dates,Sub_metering_3,col ="blue"))
legend("topright",legend = colnames(data_energy[,7:9]),col = c("black","red","blue"),pch = 20)

with(data_energy,plot(dates,Global_reactive_power,xlab = "Date & Time",type = "l"))
dev.off()
getwd()







     