# Frank C. Imler
# Coursera - John Hopkins University - Exploratory Data Analysis
# Week 4 Course Project 2 - Question 5

# Load GGPLOT2 Library
library(ggplot2)

# Create vehicle subsets of the NEI data
condition <- grepl("vehicle", SCC[, SCC.Level.Two], ignore.case=TRUE)
vehiclesSCC <- SCC[condition, SCC]
vehiclesNEI <- NEI[NEI[, SCC] %in% vehiclesSCC,]

# Subset the vehicles data to Baltimore's fip
baltimoreVehiclesNEI <- vehiclesNEI[fips=="24510",]

# Sets png filename
png(filename = "plot5.png")

# Plots data
ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity", fill ="#FF9999" ,width=0.75) +
  labs(x="Year", y=expression("Total PM"[2.5]*"Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*"Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

# Closes plotting device
dev.off()