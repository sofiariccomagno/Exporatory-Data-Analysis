##Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##Using the base plotting system, make a plot showing the total PM2.5 emission
##from all sources for each of the years 1999, 2002, 2005, and 2008.

totalNEI<-aggregate(Emissions ~ year, NEI, sum)
png('plot1.png')
barplot( totalNEI$Emissions,
         names = totalNEI$year,
         xlab = "Years",
         ylab = "Total PM2.5 Emissions",
         main = "Total PM2.5 Emissions 1999-2008"
         )
dev.off()
