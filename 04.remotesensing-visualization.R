library(devtools)
library(imageRy)
library(terra) #provides several remote sensing functions

im.list()

#we are gonna use an image, the [23] for example
b2 <- im.import("sentinel.dolomites.b2.tif")
b2 #is the blue wavelength

# green band
b3 <- im.import("sentinel.dolomites.b3.tif") # b2 is the green wavelength
b3

# red band
b4 <- im.import("sentinel.dolomites.b4.tif") # b2 is the green wavelength
b4

#NIR band
b8 <- im.import("sentinel.dolomites.b8.tif") # b2 is the green wavelength
b8

#stack images
stacksent <- c(b2,b3,b4,b8)
dev.off() #it closes devices
plot(stacksent, col=cl)

plot(stacksent[[4]], col=cl)

clb <- colorRampPalette(c("dark blue", "blue", "light blue")) (100)
clg <- colorRampPalette(c("dark green", "green", "light green")) (100)
clr <- colorRampPalette(c("dark red", "red", "pink")) (100)
cln <- colorRampPalette(c("brown", "orange", "yellow")) (100)

par(mfrow=c(2,2))
plot(b2, col=clb)
plot(b3, col=clg)
plot(b4, col=clr)
plot(b8, col=cln)


#RGB space
im.plotRGB (stacksent, r=3, g=2, b=1)
dev.off()
