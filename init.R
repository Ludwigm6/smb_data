# dependencies
library(sf)
sf_use_s2(FALSE)
library(terra)
library(tidyverse)
library(Metrics)


source("src/modis_gee_postprocessing.R")


template = terra::rast("data/static/checkerboard.tif")






