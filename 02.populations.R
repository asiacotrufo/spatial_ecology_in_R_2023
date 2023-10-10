# code related to population ecology

#we have installed the package spatstat
install.packages("spatstat")
#let's use the bei data:
# https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages
bei
plot(bei, cex = 0.5, pch = 19)
#why some points are clumped?
#there is also another dataset
bei.extra 
plot(bei.extra) #it contains two graphs, elevation and gradient, but how can we select just elevation?
#method 1
bei.extra$elev
#or better
elevation <- bei.extra$elev
plot(elevation)
#method 2
elevation2 <- bei.extra[[1]]
plot(elevation2)

#altri pacchetti scaricati utili
library(sdm)
library(terra)
library(rgdal)

#come creare una density map, passing from points to a continuous surface (interpolation)
density_map <- density(bei)
density_map
plot(density_map)

#plotting the points on top of the image using the points function
points(bei, cex = .2)
#changing colors of the map using the function colorRampPalette, outside of the function we put the gradient, ossia quanti colori graduali si trovano tra i 4 nostri
cl <- colorRampPalette(c("black", "red", "orange", "yellow"))(100)

#vogliamo plottare insieme density and elevation (multiframe)
#we use par function, we create a multiframe we two empty slots
par(mfrow=c(1,2)) #se metto 2,1 fa due righe e una colonna
#we filled the slots
plot(density_map)
plot(elev)

#adesso voglio plottare 3 robe nel multiframe
par(mfrow = c(1,3))
plot(bei)
plot(density_map)
plot(elev)

