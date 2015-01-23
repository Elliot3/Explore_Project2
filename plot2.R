# Set the correct working Directory
setwd("Repository/Coursera/Explore_Project2")

# Load the two files into R
SCC <- readRDS("~/Repository/Coursera/exdata-data-NEI_data/Source_Classification_Code.rds")
NEI <- readRDS("~/Repository/Coursera/exdata-data-NEI_data/summarySCC_PM25.rds")

# Calculate the sums of the emissions by year
data <- NEI[NEI$fips == "24510",]
data2 <- tapply(data$Emissions, data$year, sum)
data3 <- as.character(as.numeric(data2/1000))

# Plot the total PM2.5 emissions year over year
png("plot2.png")
barplot(as.numeric(data3), main="Plot 2", xlab="Year", ylab="PM2.5 Emitted (thousands of tons)", col="black", xaxt="n")
axis(1, at=1:4, labels=c(1999, 2002, 2005, 2008))

# Close the PNG file
dev.off()