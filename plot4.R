library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEISCC<- merge(NEI,SCC, by="SCC")
coals  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coals, ]

emissions_by_Type <- aggregate(Emissions ~ year + Short.Name, subsetNEISCC, sum)
png('plot4.png')
ggplot(emissions_by_Type, aes(factor(year), Emissions)) + 
  geom_bar(stat="identity") +
  xlab("Year") +
  ylab("Emissions") +
  ggtitle("Total Emissions from Coal Sources")
dev.off()