##Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Compare emissions from motor vehicle sources in Baltimore City with emissions 
##from motor vehicle sources in Los Angeles County, California (fips=="06037"). 
##Which city has seen greater changes over time in motor vehicle emissions?
library(ggplot2)
vehicle<-grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC<-subset(SCC, vehicle==TRUE)
vehiclesNEI<- subset(NEI, NEI$SCC %in% vehiclesSCC)

##Create subsets for both Baltimore and LA, then merge them
BaltimoreVehiclesNEI<-subset(vehiclesNEI, fips=="24510")
LAVehiclesNEI<-subset(vehiclesNEI, fips=="06037")
bothNEI <- rbind(BaltimoreVehiclesNEI,LAVehiclesNEI)

png('plot6.png')
ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  labs(x="Year", y="Total PM2.5 Emissions") + 
  labs(title="Total PM2.5 Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008")
dev.off()