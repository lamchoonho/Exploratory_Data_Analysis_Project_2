# Have total emissions from $PM_{2.5}$ decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total $PM_{2.5}$ emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.


# Reading source file
source("archiveFile.R")

# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate by summing the total emissions by year
aggTotals <- aggregate(Emissions ~ year, NEI, sum)

# Output plot file
png("plot1.png", bg="transparent")

# plotting bar chart
barplot(
  (aggTotals$Emissions)/10^6,
  names.arg=aggTotals$year,
  xlab = "Year",
  ylab = expression(paste('PM'[2.5], ' Emissions (10^6 Tons)')),
  main = expression(paste('Total PM'[2.5], ' Emissions From All US Sources'))
)

dev.off()
