# Set the correct working Directory
setwd("Repository/Coursera/Explore_Project2")

# Load the two files into R
SCC <- readRDS("~/Repository/Coursera/exdata-data-NEI_data/Source_Classification_Code.rds")
NEI <- readRDS("~/Repository/Coursera/exdata-data-NEI_data/summarySCC_PM25.rds")

# Get only the rows that we are interested in

coalData <- SCC[grep("coal", SCC$Short.Name, ignore.case=TRUE), ]

# Merge the two data sources together to include only coal

data <- merge(x=coalData, y=NEI)

# Sum emissions by year

data2 <- tapply(data$Emissions, data$year, sum)
data3 <- data2/1000

# Create the plot
png("plot4.png")
barplot(data3, main="Plot 4", xlab="Year", ylab="Emissions (thousands of tons)", col="black")

# Close the PNG file
dev.off()