## WWF Terrestrial Ecoregions
library(terra)

## Download
dir.create("tmp")
download.file("https://files.worldwildlife.org/wwfcmsprod/files/Publication/file/6kcchn7e3u_official_teow.zip",
              destfile = "tmp/wwf.zip")
unzip("tmp/wwf.zip", exdir = "tmp")

#-----------------

biomes = vect("tmp/official/wwf_terr_ecos.shp")
biomes = biomes[is.valid(biomes),]

# crop to rough area
biomes = crop(biomes, c(4,20, 44,57) )

# create raster from vector
template = rast("2020/NDVI_2020_01.tif")
biomes = project(biomes, template)
t = rasterize(biomes, template, field = "ECO_NAME")

# abbreviate categories to avoid spaces
t = droplevels(t)
levels(t)<- data.frame(ID = c(0,2,4,6,15),
                       category =  c("Alps", "Atlantic", "Baltic", "Central", "Western"))


names(t) = "wwf_ecoregion"
writeRaster(t, "data/static/ecoregions.tif", overwrite = TRUE)


