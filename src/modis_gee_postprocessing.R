# gee postprocessing

## TODO implement GEE download


# scale: ndvi = 0.0001
# scale: lst = 0.02


modis_post = function(modis, scale){
  template = terra::rast("data/static/checkerboard.tif")
  modis = project(modis, template)


  ## Remove front numbers (from GEE merge)
  names(modis) = names(modis) |> str_remove("^._|^.._")
  ## Apply scale factor
  modis = round(modis * scale, 4)


  out_dir = file.path("data", names(modis)[1] |> str_extract("^[A-Z]*"))

  if(!dir.exists(out_dir)) {
    dir.create(out_dir)
  }

  ## Save individual raster layers
  for(l in seq(terra::nlyr(modis))){

    outpath = file.path(out_dir, paste0(names(modis)[l], ".tif"))
    writeRaster(modis[[l]], outpath, overwrite = TRUE)
  }
  return("MODIS Postprocessing Done")
}


