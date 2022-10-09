# Frank C. Imler
# Coursera - John Hopkins University - Exploratory Data Analysis
# Week 4 Course Project 2 - Question 1

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
        , main = "Total Annual Emissions")

# Closes plotting device
dev.off()