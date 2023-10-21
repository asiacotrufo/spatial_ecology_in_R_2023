library(overlap)
data(kerinci)
head(kerinci)
summary(kerinci)
#relation among species in time
# The unit of time is the day, so values range from 0 to 1. 
# The package overlap works entirely in radians: fitting density curves uses trigonometric functions (sin, cos, tan),
# so this speeds up simulations. We must convert and add to the dataset a new columns:
kerinci$timeRad <- kerinci$Time*2*pi
# selecting the first species
tiger <- kerinci[kerinci$Sps=="tiger"]
# selecting the time for the tiger
timetig <- tiger$timeRad
densityPlot(timetig, rug=TRUE)
#rug is useful to smooth the curve
# selecting the second species
maca <- kerinci[kerinci$Sps=="macaque",]
# selecting the time for the macaque
timemaca <- maca$timeRad
densityPlot(timemaca, rug=TRUE)

# overlap!
overlapPlot(timetig, timemaca)
legend('topright', c("Tigers", "Macaques"), lty=c(1,2), col=c("black","blue"), bty='n')

