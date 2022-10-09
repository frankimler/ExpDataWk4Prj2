# Frank C. Imler
# Coursera - John Hopkins University - Exploratory Data Analysis
# Week 4 Course Project 2 - Question 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

# Load GGPLOT2 Library
library(ggplot2)

# Create coal combustion related NEI data subsets
combustionRelated <- grepl("comb", SCC[, SCC.Level.One], ignore.case=TRUE)
coalRelated <- grepl("coal", SCC[, SCC.Level.Four], ignore.case=TRUE) 
combustionSCC <- SCC[combustionRelated & coalRelated, SCC]
combustionNEI <- NEI[NEI[,SCC] %in% combustionSCC]

# Sets png filename
png(filename = 'plot4.png')

# Plots data
ggplot(combustionNEI,aes(x = factor(year),y = Emissions/10^5)) + 
  geom_bar(stat="identity", fill ="#FF9999", width=0.75) + 
  labs(x="Year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" US Coal Combustion Source Emissions from 1999-2008"))

# Closes plotting device
dev.off()