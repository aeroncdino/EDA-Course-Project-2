NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore<-subset(NEI, fips=="24510")Baltimore
emissions_by_year_Baltimore <- aggregate(Baltimore$Emissions, by=list(Baltimore$year), sum)
emissions_by_year_Baltimore
png('plot2.png')
barplot(emissions_by_year_Baltimore$x, names.arg = emissions_by_year_Baltimore$Group.1, xlab = "Year", ylab = "Emissions", main = "Total Emissions per Year in Baltimore")
dev.off()