##Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Across the United States, how have emissions from coal combustion-related sources
##changed from 1999–2008?
library(ggplot2)
NEISCC<-merge(NEI,SCC,by="SCC")
coal<-grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
coalNEISCC<-subset(NEISCC, coal==TRUE )
totalcoal<-aggregate(Emissions ~ year, coalNEISCC, sum)
png('plot4.png')
ggplot(totalcoal,aes(x = factor(year),y = Emissions)) +
  geom_bar(stat="identity") +
  labs(x="Year", y="Total PM2.5 Emissions") + 
  labs(title="Total PM2.5 Coal Combustion Source Emissions Across US 1999-2008")
dev.off()
