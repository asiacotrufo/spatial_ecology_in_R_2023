library(terra)

#external data
#set the working directory (cambia backslash con slash)
setwd("C:/Users/asia2/Downloads")


#importiamo le immagini

naja <- rast("najafiraq_etm_2003140_lrg.jpg") # like im.import
naja
plot(naja)

naja2023 <- rast("najafiraq_oli_2023219_lrg.jpg")
naja2023
plot(naja2023)

par(mfrow=c(1,2))
plot(naja)
plot(naja2023)

dev.off()
#multitemporal change detection
najadif = naja[[1]] - naja2023[[1]]
cl <- colorRampPalette(c("brown", "grey", "orange")) (100)
plot(najadif, col =cl)


atoll <- rast("ISS013-E-28610_lrg.jpg")
plot(atoll)
plotRGB(atoll, r=1, g=2, b=3)

install.packages("ncdf4")
