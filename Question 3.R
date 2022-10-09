# Frank C. Imler
# Coursera - John Hopkins University - Exploratory Data Analysis
# Week 4 Course Project 2 - Question 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

# Load GGPLOT2 Library
library(ggplot2)

# Creates Baltimore (fips = 24510) subset of NEI data
baltimoreNEI <- NEI[fips=="24510",]

# Sets plot filename
png(filename = 'plot3.png')

# Plots data
ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) + 
  geom_bar(stat="identity") + 
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Type"))

# Closes plotting device
dev.off()