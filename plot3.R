library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore<-subset(NEI, fips=="24510")
emissions_by_Type <- aggregate(Emissions ~ year + type, Baltimore, sum)
png('plot3.png')
ggplot(emissions_by_Type, aes(year, Emissions, color=type)) + 
  geom_line() +
  xlab("Year") +
  ylab("Emissions") +
  ggtitle("Total Emissions per Type")
dev.off()
