library(shinyWidgets)
library(tidyverse)
library(sp)
library(sf)
library(leaflet)

opciones_notacion <- list("Grados-Minutos-Segundos (GMS)" = "gms", 
                          "Grados decimales (GD)" = "gd", 
                          "Proyectadas UTM" = "utm")