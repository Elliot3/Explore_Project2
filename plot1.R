# Set the correct working Directory
setwd("Repository/Coursera/Explore_Project2")

# Load the two files into R
SCC <- readRDS("~/Repository/Coursera/exdata-data-NEI_data/Source_Classification_Code.rds")
NEI <- readRDS("~/Repository/Coursera/exdata-data-NEI_data/summarySCC_PM25.rds")

# Calculate the sums of the emissions by year
data <- tapply(NEI$Emissions, NEI$year, sum)
data2 <- data/1000000

# Plot the total PM2.5 emissions year over year
png("plot1.png")
barplot(data2, main="Plot 1", xlab="Year", ylab="PM2.5 Emitted (millions of tons)", col="black")

# Close the PNG file
dev.off()