##Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
##from 1999 to 2008? Use the base plotting system to make a plot answering this question.

BaltimoreNEI<-subset( NEI, fips == "24510")
totalBaltimoreNEI<-aggregate(Emissions ~ year, BaltimoreNEI, sum)
png('plot2.png')
barplot( totalBaltimoreNEI$Emissions,
         names = totalBaltimoreNEI$year,
         xlab = "Years",
         ylab = "Total PM2.5 Emissions",
         main = "Total PM2.5 Emissions in Baltimore City (MD) 1999-2008"
        )
dev.off()
