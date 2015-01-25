# Load in ggplot2
library(ggplot2)

# Set the correct working Directory
setwd("Repository/Coursera/Explore_Project2")

# Load the two files into R
SCC <- readRDS("~/Repository/Coursera/exdata-data-NEI_data/Source_Classification_Code.rds")
NEI <- readRDS("~/Repository/Coursera/exdata-data-NEI_data/summarySCC_PM25.rds")

# Subset the data we are interested in
dataLA <- subset(NEI, type=="ON-ROAD" & fips=="06037")
dataBalt <- subset(NEI, type=="ON-ROAD" & fips=="24510")

# Get the sums of the yearly emissions

dataLA_2 <- aggregate(dataLA$Emissions, by=list(dataLA$year), sum)
dataBalt_2 <- aggregate(dataBalt$Emissions, by=list(dataBalt$year), sum)

# Create the city labels
dataLA_2[,3] <- "Los Angeles"
dataBalt_2[,3] <- "Baltimore City"

# Add the appropriate column names

colnames(dataLA_2) <- c("Year", "Emissions", "City")
colnames(dataBalt_2) <- c("Year", "Emissions", "City")

# Bind the 2 data sets together
data <- rbind(dataLA_2, dataBalt_2)

# Create the plot
png("plot6.png")
myplot <- ggplot(data, aes(x=Year, y=Emissions, colour=City))
myplot2 <- myplot + geom_line()
myplot3 <- myplot2 + geom_point()
myplot4 <- myplot3 + ggtitle("Plot 6")
myplot4

# Close the PNG file
dev.off()