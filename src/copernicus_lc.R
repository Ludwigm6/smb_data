## Copernicus Land Cover
source("init.R")


imd = rast("tmp/copernicus/IMD_2018_100m_eu_03035_V2_0.tif")
tcd = rast("tmp/copernicus/TCD_2018_100m_eu_03035_V2_0.tif")
gra = rast("tmp/GRA_2018_100m_eu_03035_V1_0.tif")


imd = project(imd, template, method = "average")
tcd = project(tcd, template, method = "average")

gra[gra == 255] = NA
gra_sum = project(gra, template, method = "sum")


imd = round(imd)
tcd = round(tcd)
gra_sum = round(gra_sum)

writeRaster(imd, "data/LANDCOVER/IMD_2018.tif", overwrite = TRUE, datatype = "INT4U")
writeRaster(tcd, "data/LANDCOVER/TCD_2018.tif", overwrite = TRUE, datatype = "INT4U")
writeRaster(gra_sum, "data/LANDCOVER/GRA_2018.tif", overwrite = TRUE, datatype = "INT4U")

