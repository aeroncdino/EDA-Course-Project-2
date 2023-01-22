library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEISCC<- merge(NEI,SCC, by="SCC")
vehicles  <- grepl("vehicles", NEISCC$SCC.Level.Two, ignore.case=TRUE)
subsetBaltiVec<- subset(NEISCC[vehicles,])
subsetBaltimore<-subset(subsetBaltiVec, fips=="24510")

png('plot5.png')
ggplot(subsetBaltimore, aes(factor(year), Emissions)) + 
  geom_bar(stat="identity") +
  xlab("Year") +
  ylab("Emissions") +
  ggtitle("Total Emissions from Vehicle Sources in Baltimore")
dev.off()