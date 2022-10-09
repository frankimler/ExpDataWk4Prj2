# Frank C. Imler
# Coursera - John Hopkins University - Exploratory Data Analysis
# Week 4 Course Project 2 - Question 2

# No scientific notation
NEI[, Emissions := lapply(.SD, as.numeric), .SDcols = c("Emissions")]

# Creates dataset
totalNEI <- NEI[fips=='24510', lapply(.SD, sum, na.rm = TRUE), .SDcols = c("Emissions"), by = year]

# Set plot filename
png(filename = 'plot2.png')

# Plots data
barplot(totalNEI[, Emissions]
        , names = totalNEI[, year]
        , xlab = "Year", ylab = "Emissions"
        , main = "Total Annual Emissions in Baltimore City, Maryland")

# Closes plotting device
dev.off()