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


#open the packages sdm, terra and rgdal con la funzione library
#Why populations disperse over the landscape in a certain manner?
library(sdm)
library(terra)
library(rgdal)
#we use a function to get the data
file <- system.file("external/species.shp", package="sdm") 
species <- vect(file)
#let's see the file path
file 
# looking at the set
species
# plot
plot(species)
# looking at the occurrences
species$Occurrence
# now we plot the speices occurrence, where they are present and where they are not:
plot(species[species$Occurrence == 1,],col='blue',pch=16)
points(species[species$Occurrence == 0,],col='red',pch=16)
#we save were the species are present
presence <- species[species$Occurrence == 1]
#now we do the same for absences
absences <- species[species$Occurrence == 0]
#then we can look at them through the plot function one next the other

par(mfrow=c(1,2))
plot(presence)
plot(absences)

# dev.off() is also a useful function if we have graphical problems for plotting
#plotting together
plot(presence,col='blue',pch=16)
points(absences,col='lightblue',pch=16)


# predictors: look at the path
path <- system.file("external", package="sdm") 
#predictors: environmental variables
# predictors: look at the path and import it (we do it for the elevation) 
elevation <- system.file("external/elevation.asc", package="sdm")
elevation <- rast(elevation) #una funzione di terra, che fa la stessa cosa di vec però essendo elevation un ascii usiamo questa
elevation
plot(elevation)
points(presence)
#da qui possiamo capire che la specie non sopravvive ad alte altitudini e nemmeno a basse altitudini.

#possiamo fare la stessa cosa per la temperature
temp <- system.file("external/temperature.asc", package="sdm")
temp <- rast(temp) #una funzione di terra, che fa la stessa cosa di vec però essendo elevation un ascii usiamo questa
temp
plot(temp)
points(presence)

#same for vegetation cover
vegcov <- system.file("external/vegetation.asc", package="sdm")
vegcov <- rast(vegcov) #una funzione di terra, che fa la stessa cosa di vec però essendo elevation un ascii usiamo questa
vegcov
plot(vegcov)
points(presence)

#same for precipitation
prec <- system.file("external/precipitation.asc", package="sdm")
prec <- rast(prec)
plot(prec)
points(presence)
