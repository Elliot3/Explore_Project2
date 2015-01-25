# Set the correct working Directory
setwd("Repository/Coursera/Explore_Project2")

# Load the two files into R
SCC <- readRDS("~/Repository/Coursera/exdata-data-NEI_data/Source_Classification_Code.rds")
NEI <- readRDS("~/Repository/Coursera/exdata-data-NEI_data/summarySCC_PM25.rds")

# Pull out the specific data we are interested interested interested

data <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")

# Sum the results by year

data2 <- tapply(data$Emissions, data$year, sum)

# Create the plot
png("Plot5".png)
barplot(data2, main="Plot 5", xlab="Year", ylab="Emissions", col="black")

# Close the PNG file
dev.off()