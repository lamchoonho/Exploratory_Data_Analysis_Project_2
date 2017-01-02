# Have total emissions from $PM_{2.5}$ decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? Use the base plotting 
# system to make a plot answering this question.

# Reading source file
source("archiveFile.R")

# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip.
baltimoreNEI <- NEI[NEI$fips=="24510",]

# Aggregate using sum the Baltimore emissions data by year
aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI, sum)

# Output plot file
png("plot2.png", bg="transparent")

# plotting bar chart
barplot(
  aggTotalsBaltimore$Emissions,
  names.arg=aggTotalsBaltimore$year,
  xlab="Year",
  ylab = expression(paste('PM'[2.5], ' Emissions (Tons)')),
  main = expression(paste('Total PM'[2.5], ' Emissions in Baltimore City Sources'))
)

dev.off()