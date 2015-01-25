# Load in the ggplot2 package
library(ggplot2)

# Set the correct working Directory
setwd("Repository/Coursera/Explore_Project2")

# Load the two files into R
SCC <- readRDS("~/Repository/Coursera/exdata-data-NEI_data/Source_Classification_Code.rds")
NEI <- readRDS("~/Repository/Coursera/exdata-data-NEI_data/summarySCC_PM25.rds")

# Calculate the sums of the emissions by year for each type
data <- NEI[NEI$fips == "24510",]
data2 <- aggregate(data["Emissions"], list(type=data$type, year=data$year), sum)

# Plot sums of emissions year over year by type
png("plot3.png")
myplot <- ggplot(data=data2, aes(x=year, y=Emissions, colour=type))
myplot2 <- myplot + ggtitle("Plot 3")
myplot3 <- myplot2 + geom_line()
myplot3

# Close the PNG file
dev.off()