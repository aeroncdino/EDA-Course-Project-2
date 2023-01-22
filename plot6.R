library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC<- merge(NEI,SCC, by="SCC")
subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

aggregatedTotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png", width=1040, height=480)
g <- ggplot(aggregatedTotalByYearAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("year") +
  ylab("Emissions") +
  ggtitle('Total Emissions from motor vehicle  in Baltimore City, MD  vs Los Angeles, CA')
print(g)
dev.off()