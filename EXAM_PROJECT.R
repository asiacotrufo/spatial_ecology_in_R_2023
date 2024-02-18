#uploading the libraries

library(terra) #creating, reading, manipulating, and writing raster data
library (raster) #creating, reading, manipulating, and writing raster data
library (ggplot2) #for data visualization
library (RStoolbox) #toolbox for remote sensing image processing and analysis
library (viridis) #Colorblind-Friendly Color Maps for R 
library(dplyr) #tool for working with data frame

#this project aim to see the variation in Fraction of Vegetation Cover and NDVI
#of the Regional Park of Murgia Materana (mainly) and
#National Park of Alta Murgia

#setting the pathway were data are stored
setwd ("C:/Users/asia2/Documents/dataset")

#files were cutted already in Copernicus

##uploading the raster images in the variables
#Fraction of Vegetation Cover
Matera_FC2020 <- rast("FCOVER_2020.tiff")
Matera_FC2021 <- rast("FCOVER_2021.tiff")
Matera_FC2022 <- rast("FCOVER_2022.tiff")
Matera_FC2023 <- rast("FCOVER_2023.tiff")

#NDVI Normalized Difference Vegetation Index 
ndvi_2020 <- rast("NDVI_2020.tiff")
ndvi_2021 <- rast("NDVI_2021.tiff")
ndvi_2022 <- rast("NDVI_2022.tiff")
ndvi_2023 <- rast("NDVI_2023.tiff")

#let's look at our data by
#plotting them with palette useful for colorblind people
viridis <- colorRampPalette(viridis(7))(255)

par(mfrow=c(2,2))
plot(Matera_FC2020, col=viridis, main="FCover 2020")
plot(Matera_FC2021, col=viridis, main="FCover 2021")
plot(Matera_FC2022, col=viridis, main="FCover 2022")
plot(Matera_FC2023, col=viridis, main="FCover 2023")


# other useful palette: cl <- colorRampPalette(brewer.pal(11, 'Spectral'))(100)
par(mfrow=c(2,2))
plot(ndvi_2020, col=viridis, main ="NDVI 2020")
plot(ndvi_2021, col=viridis, main ="NDVI 2021")
plot(ndvi_2022, col=viridis, main ="NDVI 2022")
plot(ndvi_2023, col=viridis, main ="NDVI 2023")

##GGPLOT AND GGSAVE
#we must convert into dataframes
Matera_FC2020_df <- as.data.frame(Matera_FC2020, xy=TRUE)
Matera_FC2020
plot_FC2020 <-  ggplot(Matera_FC2020_df, aes(x = x, y = y, fill = FCOVER_2020)) +
                 geom_tile() +
                 scale_fill_viridis_c(option="viridis") +  
                 theme_minimal() +
                 labs(title = "Fraction of Vegetation Cover 2020")
plot_FC2020

#saving the map we just created
ggsave(filename = "FCover2020.png" , plot = plot_FC2020)

#now we do the same for each plot
Matera_FC2021_df <- as.data.frame(Matera_FC2021, xy=TRUE)
plot_FC2021 <-  ggplot(Matera_FC2021_df, aes(x = x, y = y, fill = FCOVER_2021)) +
  geom_tile() +
  scale_fill_viridis_c(option="viridis") + 
  theme_minimal() +
  labs(title = "Fraction of Vegetation Cover 2021")

plot_FC2021
ggsave(filename = "FCover2021.png" , plot = plot_FC2021)



Matera_FC2022_df <- as.data.frame(Matera_FC2022, xy=TRUE)
plot_FC2022 <-  ggplot(Matera_FC2022_df, aes(x = x, y = y, fill = FCOVER_2022)) +
  geom_tile() +
  scale_fill_viridis_c(option="viridis") + 
  theme_minimal() +
  labs(title = "Fraction of Vegetation Cover 2022")

plot_FC2022
ggsave(filename = "FCover2022.png" , plot = plot_FC2022)




Matera_FC2023_df <- as.data.frame(Matera_FC2023, xy=TRUE)
plot_FC2023 <-  ggplot(Matera_FC2023_df, aes(x = x, y = y, fill = FCOVER_2023)) +
  geom_tile() +
  scale_fill_viridis_c(option="viridis") +  
  theme_minimal() +
  labs(title = "Fraction of Vegetation Cover 2023")

plot_FC2023
ggsave(filename = "FCover2023.png" , plot = plot_FC2023)

#we do the same for NDVI index

ndvi_2020
ndvi_2020_df <- as.data.frame(ndvi_2020, xy=TRUE)
plot_ndvi2020 <-  ggplot(ndvi_2020_df, aes(x = x, y = y, fill = NDVI_2020)) +
  geom_tile() +
  scale_fill_viridis_c(option = "magma") +  
  theme_minimal() +
  labs(title = "Normalized Difference Vegetation Index 2020")

plot_ndvi2020
ggsave(filename = "ndvi2020.png" , plot = plot_ndvi2020)




ndvi_2021_df <- as.data.frame(ndvi_2021, xy=TRUE)
plot_ndvi2021 <-  ggplot(ndvi_2021_df, aes(x = x, y = y, fill = NDVI_2021)) +
  geom_tile() +
  scale_fill_viridis_c(option = "magma") +  
  theme_minimal() +
  labs(title = "Normalized Difference Vegetation Index 2021")

plot_ndvi2021
ggsave(filename = "ndvi2021.png" , plot = plot_ndvi2021)




ndvi_2022_df <- as.data.frame(ndvi_2022, xy=TRUE)
plot_ndvi2022 <-  ggplot(ndvi_2022_df, aes(x = x, y = y, fill = NDVI_2022)) +
  geom_tile() +
  scale_fill_viridis_c(option = "magma") +  
  theme_minimal() +
  labs(title = "Normalized Difference Vegetation Index 2022")

plot_ndvi2022
ggsave(filename = "ndvi2022.png" , plot = plot_ndvi2022)



ndvi_2023
ndvi_2023_df <- as.data.frame(ndvi_2023, xy=TRUE)
plot_ndvi2023 <-  ggplot(ndvi_2023_df, aes(x = x, y = y, fill = NDVI_2023)) +
  geom_tile() +
  scale_fill_viridis_c(option = "magma") +  
  theme_minimal() +
  labs(title = "Normalized Difference Vegetation Index 2023")

plot_ndvi2023
ggsave(filename = "ndvi2023.png" , plot = plot_ndvi2023)

#we can save all 4 heath maps of each parameter in one image
FCOVER_comparison <- plot_FC2020 + plot_FC2021 + plot_FC2022 + plot_FC2023
FCOVER_comparison
ggsave (filename = "FCOVERcomparison.png", plot = FCOVER_comparison)

NDVI_comparison <- plot_ndvi2020 + plot_ndvi2021 + plot_ndvi2022 + plot_ndvi2023
NDVI_comparison
ggsave (filename = "NDVIcomparison.png", plot = NDVI_comparison)

#To look at the difference between years(pairwise comparison) we must stack data,
#and then we can perform the difference
stacked_FCOVER <- c(Matera_FC2020, Matera_FC2021, Matera_FC2022, Matera_FC2023)
stacked_NDVI <- c(ndvi_2020, ndvi_2021, ndvi_2022, ndvi_2023)
#our stacked data
plot(stacked_FCOVER, col = viridis)
plot(stacked_NDVI, col = viridis)

#defining the paette
cldif <- colorRampPalette(c("blue", "white", "red")) (100)

#difference between the FCOVER 2020 and 2021
difCOVER <- stacked_FCOVER[[2]] - stacked_FCOVER[[1]]
#difference between the FCOVER 2022 and 2021
difCOVER_2 <- stacked_FCOVER[[3]] - stacked_FCOVER[[2]]
#difference between the FCOVER 2023 and 2022
difCOVER_3 <- stacked_FCOVER[[4]] - stacked_FCOVER[[3]]
#difference between the FCOVER 2023 and 2020
difCOVER_4 <- stacked_FCOVER[[4]] - stacked_FCOVER[[1]]

par(mfrow=c(2,2))
plot(difCOVER, col=cldif, main="Difference in FCOVER 2020_2021")
plot(difCOVER_2, col = cldif, main="Difference in FCOVER 2021_2022")
plot(difCOVER_3, col = cldif, main="Difference in FCOVER 2022_2023")
plot(difCOVER_4, col = cldif, main="Difference in FCOVER 2023_2020")


#difference between the NDVI 2020 and 2021
difNDVI <- stacked_NDVI[[2]] - stacked_NDVI[[1]]
plot(difNDVI, col=cldif, main="NDVI difference 2020_2021")
#difference between the NDVI 2022 and 2021
difNDVI_2 <- stacked_NDVI[[3]] - stacked_NDVI[[2]]
plot(difNDVI_2, col=cldif, main="NDVI difference 2021_2022")
#difference between the NDVI 2023 and 2022
difNDVI_3 <- stacked_NDVI[[4]] - stacked_NDVI[[3]]
plot(difNDVI_3, col=cldif, main="NDVI difference 2022_2023")
#difference between the NDVI 2020 and 2023
difNDVI_4 <- stacked_NDVI[[4]] - stacked_NDVI[[1]]
plot(difNDVI_4, col=cldif, main="NDVI difference 2023_2020")

#major differences appears to be between 2020_2021 and 2023_2020
#so I saved the plots (again converting in dataframes and using ggsave)

#for the Fraction of Vegetation Cover
difCOVER
difCOVER_df <- as.data.frame(difCOVER, xy=TRUE)
diff_20_21_plot <- ggplot() + geom_raster(difCOVER_df, mapping=aes(x=x, y=y, fill= FCOVER_2021 )) + scale_fill_gradientn(colors = cldif) + ggtitle("FCOVER difference 2020 2021")
ggsave(filename = "diffCOV_20_21.png" , plot = diff_20_21_plot)


difCOVER_4
difCOVER4_df <- as.data.frame(difCOVER_4, xy=TRUE)
diff_23_20_plot <- ggplot() + geom_raster(difCOVER4_df, mapping=aes(x=x, y=y, fill= FCOVER_2023 ))+ scale_fill_gradientn(colors = cldif) + ggtitle("FCOVER difference 2023 2020")
ggsave(filename = "diffCOV_23_20.png" , plot = diff_23_20_plot)


#for the Normalized Difference Vegetation Index
difNDVI
difNDVI_df <- as.data.frame(difNDVI, xy=TRUE)
diffndvi_20_21_plot <- ggplot() + geom_raster(difNDVI_df, mapping=aes(x=x, y=y, fill= NDVI_2021 ))+ scale_fill_gradientn(colors = cldif) + ggtitle("NDVI difference 2021 2020")
diffndvi_20_21_plot
ggsave(filename = "diffNDVI_20_21.png" , plot = diffndvi_20_21_plot)


difNDVI_4
difNDVI4_df <- as.data.frame(difNDVI_4, xy=TRUE)
diffndvi_23_20_plot <- ggplot() + geom_raster(difNDVI4_df, mapping=aes(x=x, y=y, fill= NDVI_2023 ))+ scale_fill_gradientn(colors = cldif) + ggtitle("NDVI difference 2023 2020")
ggsave(filename = "diffNDVI_23_20.png" , plot = diffndvi_23_20_plot)


##TRENDS

#NDVI
ndvitrend <- plot(ndvi_2020, ndvi_2021, xlab="NDVI 2020", ylab="NDVI 2021", main="Trend of NDVI")
abline(0,1, col="red")
ndvitrend <- plot(ndvi_2021, ndvi_2022, xlab="NDVI 2021", ylab="NDVI 2022", main="Trend of NDVI")
abline(0,1, col="red")
ndvitrend <- plot(ndvi_2022, ndvi_2023, xlab="NDVI 2022", ylab="NDVI 2023", main="Trend of NDVI")
abline(0,1, col="red")
ndvitrend <- plot(ndvi_2020, ndvi_2023, xlab="NDVI 2020", ylab="NDVI 2023", main="Trend of NDVI")
abline(0,1, col="red")


#FCOVER
fcovertrend <- plot(Matera_FC2020, Matera_FC2021, xlab="FCOVER 2020", ylab="FCOVER 2021", main="Trend of FCOVER")
abline(0,1, col="red")
fcovertrend <- plot(Matera_FC2021, Matera_FC2022, xlab="FCOVER 2021", ylab="FCOVER 2022", main="Trend of FCOVER")
abline(0,1, col="red")
fcovertrend <- plot(Matera_FC2022, Matera_FC2023, xlab="FCOVER 2022", ylab="FCOVER 2023", main="Trend of FCOVER")
abline(0,1, col="red")
fcovertrend <- plot(Matera_FC2020, Matera_FC2023, xlab="FCOVER 2020", ylab="FCOVER 2023", main="Trend of FCOVER")
abline(0,1, col="red")


#CORRELATION BETWEEN FCOVER AND NDVI FOR EACH YEAR
trend1 <- plot(Matera_FC2020, ndvi_2020, xlab="FCOVER 2020", ylab="NDVI 2020", main="2020 trend")
abline(0,1, col="red")
trend2 <- plot(Matera_FC2021, ndvi_2021, xlab="FCOVER 2021", ylab="NDVI 2021", main="2021 trend")
abline(0,1, col="red")
trend3 <- plot(Matera_FC2022, ndvi_2022, xlab="FCOVER 2022", ylab="NDVI 2022", main="2022 trend")
abline(0,1, col="red")
trend4 <- plot(Matera_FC2023, ndvi_2023, xlab="FCOVER 2023", ylab="NDVI 2023", main="2023 trend")
abline(0,1, col="red")

#trend of the differences
dif_trendFC<- plot(difCOVER, difCOVER_2, xlab="difCOVER2020_2021", ylab="difCOVER2021_2022", main="trend of difference")
abline(0,1, col="red")
dif_trendFC2<- plot(difCOVER_2, difCOVER_3, xlab="difCOVER2021_2022", ylab="difCOVER2022_2023", main="trend of difference")
abline(0,1, col="red")
dif_trendFC3<- plot(difCOVER_3, difCOVER_4, xlab="difCOVER2022_2023", ylab="difCOVER2020_2023", main="trend of difference")
abline(0,1, col="red")
dev.off()

dif_trendN<- plot(difNDVI, difNDVI_2, xlab="difNDVI2020_2021", ylab="difNDVI2021_2022", main="trend of difference")
abline(0,1, col="red")
dif_trendN2<- plot(difNDVI_2, difNDVI_3, xlab="difNDVI2021_2022", ylab="difNDVI2022_2023", main="trend of difference")
abline(0,1, col="red")
dif_trendN3<- plot(difNDVI_3, difNDVI_4, xlab="difNDVI2022_2023", ylab="difNDVI2020_2023", main="trend of difference")
abline(0,1, col="red")
dev.off()
