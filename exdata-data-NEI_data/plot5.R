##Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
library(ggplot2)
vehicle<-grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC<-subset(SCC, vehicle==TRUE)
vehiclesNEI<- subset(NEI, NEI$SCC %in% vehiclesSCC)
BaltimoreVehiclesNEI<-subset(vehiclesNEI, fips=="24510")
png('plot5.png')
ggplot(BaltimoreVehiclesNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity") +
  labs(x="Year", y="Total PM2.5 Emissions") + 
  labs(title="Total PM2.5 Motor Vehicle Source Emissions in Baltimore (MD) 1999-2008")
dev.off()