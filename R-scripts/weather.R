# R Script: weather.R
# Example of using R 
# Author: Jane Doe
# Usage: To submit jobs on LSF using R scripts
# Output: Writes average monthly temperatures to stdout and creates a PDF scatter plot.

# Define temperature
Temp <- c(32,30,45,50,60,74,62,55,35)
cat ("Temperatures: ", Temp,"\n")
ylabel <- expression(paste('Average Temperature (',-degree,'F)',sep=""))

pdf("weather.pdf")
plot(Temp, main="Weather", xlab="Month",ylab=ylabel)
dev.off()