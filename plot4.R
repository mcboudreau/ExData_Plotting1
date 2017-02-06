## Read in the household power consumption data remembering to set the seperator as a semicolon
## I also want to set the NA string to ? and not convert to factors
## From there I convert the date into a Date YYYY-MM-DD Date format
df <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors = F)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

## Next I only want the subset of data for dates 2007-02-01 and 2007-02-02
## I also append the data frame with a column that combines the date and time
plotdata <- subset(df,Date >= "2007-02-01" & Date <= "2007-02-02")
plotdata$datetime <- as.POSIXct(paste(plotdata$Date,plotdata$Time))

## Now it's time to plot.  I open a png and produce 
png(file = "plot4.png",width=480,height=480) #initiate png
par(mfrow = c(2,2)) #set a 2x2 graphing area

## Plot 1 - line graph of Global Active Power over Time
plot(plotdata$datetime,plotdata$Global_active_power,type="l",ylab="Global Active Power",xlab="")

## Plot 2 - Voltage usage over Time
plot(plotdata$datetime,plotdata$Voltage,type="l",ylab="Voltage",xlab="datetime")

## Plot 3 - line plots for each sub metering category distinguished by color and a legend is provided
plot(plotdata$datetime,plotdata$Sub_metering_1,type="l",ylab="Energy sub metering",xlab = "")
lines(plotdata$datetime,plotdata$Sub_metering_2,col="red")
lines(plotdata$datetime,plotdata$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n",cex=0.9)

## Plot 4 - Global_reactive_power over time
plot(plotdata$datetime,plotdata$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off() #Turn dev off to create the png and close the connection