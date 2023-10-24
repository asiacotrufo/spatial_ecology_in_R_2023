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


