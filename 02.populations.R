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
