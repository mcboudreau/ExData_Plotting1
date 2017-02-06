## Read in the household power consumption data remembering to set the seperator as a semicolon
## I also want to set the NA string to ? and not convert to factors
## From there I convert the date into a Date YYYY-MM-DD Date format
df <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors = F)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

## Next I only want the subset of data for dates 2007-02-01 and 2007-02-02
## I also append the data frame with a column that combines the date and time
plotdata <- subset(df,Date >= "2007-02-01" & Date <= "2007-02-02")
plotdata$datetime <- as.POSIXct(paste(plotdata$Date,plotdata$Time))

## Now it's time to plot.  I open a png and produce a line plot with proper y label
png(file = "plot2.png",width=480,height=480)
plot(plotdata$datetime,plotdata$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab = "")
dev.off()