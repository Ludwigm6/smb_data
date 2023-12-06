
source("init.R")




lst = rast("tmp/MODIS_LST.tif")
ndvi = rast("tmp/MODIS_NDVI.tif")

modis_post(lst, 0.02)
modis_post(ndvi, 0.0001)

