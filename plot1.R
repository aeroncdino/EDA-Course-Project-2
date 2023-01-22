NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emissions_by_year <- aggregate(NEI$Emissions, by=list(NEI$year), sum)
png('plot1.png')
barplot(emissions_by_year$x, names.arg = emissions_by_year$Group.1, xlab = "Year", ylab = "Emissions", main = "Total Emissions per Year")
dev.off()