# Frank C. Imler
# Coursera - John Hopkins University - Exploratory Data Analysis
# Week 4 Course Project 2 - Question 1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
# Upload a PNG file containing your plot addressing this question.

# No scientific notation
NEI[, Emissions := lapply(.SD, as.numeric), .SDcols = c("Emissions")]

# Create dataset
totalNEI <- NEI[, lapply(.SD, sum, na.rm = TRUE), .SDcols = c("Emissions"), by = year]

# Set plot filename
png(filename = 'plot1.png')

# Plot data
barplot(totalNEI[, Emissions]
        , names = totalNEI[, year]
        , xlab = "Year", ylab = "Emissions"
        , main = "Total Annual Emissions from All Sources")

# Closes plotting device
dev.off()