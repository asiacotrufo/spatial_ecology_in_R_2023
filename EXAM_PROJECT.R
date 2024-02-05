#uploading the libraries

library(terra)
library (raster)
library (ggplot2)
library (RStoolbox)
library (viridis)
library(patchwork)
library(ncdf4) 
 
install.packages("RColorBrewer")
library(RColorBrewer)

#this project aim to see the variation in Fraction of Vegetation Cover and NDVI
#of the Parco Nazionale dell'Alta Murgia and Parco della Murgia Materana

#setting the pathway were data are stored
setwd ("C:/Users/asia2/Documents/dataset")

#files were cutted already in Copernicus

#uploading the files in the variables
#Fraction of Vegetation Cover
Matera_FC2020 <- rast("FCOVER_2020.tiff")
Matera_FC2021 <- rast("FCOVER_2021.tiff")
Matera_FC2022 <- rast("FCOVER_2022.tiff")
Matera_FC2023 <- rast("FCOVER_2023.tiff")

#NDVI Normalized Difference Vegetation Index data
NDVI_2020 <- rast("NDVI_2020.tiff")
NDVI_2021 <- rast("NDVI_2021.tiff")
NDVI_2022 <- rast("NDVI_2022.tiff")
NDVI_2023 <- rast("NDVI_2023.tiff")

#let's look at our data by
#plotting them with two palette useful for colorblind people
viridis <- colorRampPalette(viridis(7))(255)

par(mfrow=c(2,2))
plot(Matera_FC2020, col=viridis)
plot(Matera_FC2021, col=viridis)
plot(Matera_FC2022, col=viridis)
plot(Matera_FC2023, col=viridis)

cl <- colorRampPalette(brewer.pal(11, 'Spectral'))(100)
par(mfrow=c(2,2))
plot(NDVI_2020, col=cl)
plot(NDVI_2021, col=cl)
plot(NDVI_2022, col=cl)
plot(NDVI_2023, col=cl)

#To plot using ggplot we must convert into dataframes
Matera_FC2020_df <- as.data.frame(Matera_FC2020, xy=TRUE)
Matera_FC2020
plot_FC2020 <-  ggplot(Matera_FC2020_df, aes(x = x, y = y, fill = FCOVER_2020)) +
                 geom_tile() +
                 scale_fill_viridis_c(option="magma") +  
                 theme_minimal() +
                 labs(title = "Fraction of Vegetation Cover 2020")
plot_FC2020

#saving the map we just created
ggsave(filename = "FCover2020.png" , plot = plot_FC2020)

#now we do the same for each plot
Matera_FC2021_df <- as.data.frame(Matera_FC2021, xy=TRUE)
plot_FC2021 <-  ggplot(Matera_FC2021_df, aes(x = x, y = y, fill = FCOVER_2021)) +
  geom_tile() +
  scale_fill_viridis_c(option="magma") + 
  theme_minimal() +
  labs(title = "Fraction of Vegetation Cover 2021")

plot_FC2021
ggsave(filename = "FCover2021.png" , plot = plot_FC2021)




Matera_FC2022_df <- as.data.frame(Matera_FC2022, xy=TRUE)
plot_FC2022 <-  ggplot(Matera_FC2022_df, aes(x = x, y = y, fill = FCOVER_2022)) +
  geom_tile() +
  scale_fill_viridis_c(option="magma") + 
  theme_minimal() +
  labs(title = "Fraction of Vegetation Cover 2022")

plot_FC2022
ggsave(filename = "FCover2022.png" , plot = plot_FC2022)




Matera_FC2023_df <- as.data.frame(Matera_FC2023, xy=TRUE)
plot_FC2023 <-  ggplot(Matera_FC2023_df, aes(x = x, y = y, fill = FCOVER_2023)) +
  geom_tile() +
  scale_fill_viridis_c(option="magma") +  
  theme_minimal() +
  labs(title = "Fraction of Vegetation Cover 2023")

plot_FC2023
ggsave(filename = "FCover2023.png" , plot = plot_FC2023)




NDVI_2020_df <- as.data.frame(NDVI_2020, xy=TRUE)
plot_ndvi2020 <-  ggplot(NDVI_2020_df, aes(x = x, y = y, fill = NDVI_2020)) +
  geom_tile() +
  scale_fill_viridis_c("plasma") +  
  theme_minimal() +
  labs(title = "Fraction of Vegetation Cover 2020")

plot_ndvi2020
ggsave(filename = "ndvi2020.png" , plot = plot_ndvi2020)




NDVI_2021_df <- as.data.frame(NDVI_2021, xy=TRUE)
plot_ndvi2021 <-  ggplot(NDVI_2021_df, aes(x = x, y = y, fill = NDVI_2021)) +
  geom_tile() +
  scale_fill_viridis_c("plasma") +  
  theme_minimal() +
  labs(title = "Fraction of Vegetation Cover 2021")

plot_ndvi2021
ggsave(filename = "ndvi2021.png" , plot = plot_ndvi2021)




NDVI_2022_df <- as.data.frame(NDVI_2022, xy=TRUE)
plot_ndvi2022 <-  ggplot(NDVI_2022_df, aes(x = x, y = y, fill = NDVI_2022)) +
  geom_tile() +
  scale_fill_viridis_c("plasma") +  
  theme_minimal() +
  labs(title = "Fraction of Vegetation Cover 2022")

plot_ndvi2022
ggsave(filename = "ndvi2022.png" , plot = plot_ndvi2022)




NDVI_2023_df <- as.data.frame(NDVI_2023, xy=TRUE)
plot_ndvi2023 <-  ggplot(NDVI_2023_df, aes(x = x, y = y, fill = NDVI_2023)) +
  geom_tile() +
  scale_fill_viridis_c("plasma") +  
  theme_minimal() +
  labs(title = "Fraction of Vegetation Cover 2020")

plot_ndvi2023
ggsave(filename = "ndvi2023.png" , plot = plot_ndvi2023)
