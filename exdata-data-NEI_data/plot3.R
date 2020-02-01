##Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
##which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
##Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make
##a plot answer this question.
library(ggplot2)
BaltimoreNEI<-subset( NEI, fips == "24510")
png('plot3.png')
ggplot(BaltimoreNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="Year", y="Total PM2.5 Emissions") + 
  labs(title="Total PM2.5 Emissions in Baltimore City (MD) 1999-2008 by Source Type")
dev.off()
