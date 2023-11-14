library(imageRy)
library(terra)
im.list()
b2 <- im.import("sentinel.dolomites.b2.tif")
b3 <- im.import("sentinel.dolomites.b3.tif") 
b4 <- im.import("sentinel.dolomites.b4.tif") 
b8 <- im.import("sentinel.dolomites.b8.tif")

stacksent <- c(b2, b3, b4, b8)
plot(stacksent)

dev.off()
im.plotRGB (stacksent, r=3, g=2, b=1)

# inseriamo la banda infrared sacrificando una delle precedenti ad esmepio la blu
im.plotRGB(stacksent, r=4, g=3, b=2)
# vediamo che la vegetazione diventa tutta rossa perche riflette quel colore

im.plotRGB(stacksent, r=3, g=4, b=2)
# ora la vegetation riflette il green

im.plotRGB(stacksent, r=3, g=2, b=4)
# ora blu

# correlation between bands
pairs(stacksent)
#provides a scatterplot matrix between variables, when you have a lot of variables
#in our case all the visible bands are highly correlated with each other (first three scatterplots)
#while the correlation with the infrared band is lower compared to the others, even though still high (0.7)
#this means the the last band is providing just additional information

#INDICES (e.g. NDVI)
#other packages needed
library(ggplot2)
library(viridis)

#why and how NDVI is calculated
#healthy plant has a high NIR and a low RED
#you can compare different NDVI taken during two different times to see how the vegetation is evolving
im.list()
#importing matogrosso data images from 1992 and 2006
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

#bands: 1:NIR, 2:RED, 3:GREEN
im.plotRGB(m1992, r=1, g=2, b=3)
# in questo caso va bene anche im.plotRGB(m1992, 1, 2, 3)
#cambiando layer delle bande
im.plotRGB(m1992, 2, 1, 3)
im.plotRGB(m1992, 2, 3, 1)

#same thing for 2006
im.plotRGB(m2006, r=1, g=2, b=3)
im.plotRGB(m2006, 2, 1, 3)
im.plotRGB(m2006, 2, 3, 1)

#comparison
par(mfrow=c(1,2))
im.plotRGB(m1992, 1, 2, 3)
im.plotRGB(m2006, 1, 2, 3)

#claculating the DVI indice for both years
dvi1992 <- m1992[[1]] - m1992[[2]]
dvi1992
cl <- colorRampPalette(c("darkblue", "yellow", "red", "black"))(100) # specifying a color scheme
plot(dvi1992, col=cl)


dvi2006 <- m2006[[1]] - m2006[[2]]
dvi2006
cl <- colorRampPalette(c("darkblue", "yellow", "red", "black"))(100) # specifying a color scheme
plot(dvi2006, col=cl)

#NDVI
ndvi1992 = (m1992[[1]] - m1992[[2]]) / (m1992[[1]] + m1992[[2]])
ndvi1992 = dvi1992 / (m1992[[1]] + m1992[[2]])
plot(ndvi1992, col = cl)

ndvi2006 = dvi2006 / (m2006[[1]] + m2006[[2]])
plot(ndvi2006, col=cl)

clvir <- colorRampPalette(c("violet", "dark blue", "blue", "green", "yellow"))(100) # specifying a color scheme
par(mfrow=c(1,2))
plot(ndvi1992, col=clvir)
plot(ndvi2006, col=clvir)

#sppeding up calculation
ndvi2006a <- im.ndvi(m2006, 1, 2)
plot(ndvi2006a, col=cl)
