library(jsonlite)

ruta <- "C:/Users/super/OneDrive/Escritorio/012_geoportal/geoportal_areas_verdes/data"

archivos <- list.files(
  ruta,
  pattern="\\.geojson$",
  recursive=TRUE,
  full.names=TRUE
)

catalogo <- lapply(archivos, function(x){
  
  data.frame(
    nombre = tools::file_path_sans_ext(basename(x)),
    
    # ESTO ES LA CLAVE
    estado = basename(dirname(x)),
    
    ruta = paste0(
      "data/",
      basename(dirname(x)),
      "/",
      basename(x)
    )
  )
  
})

catalogo <- do.call(rbind, catalogo)

write_json(
  catalogo,
  "C:/Users/super/OneDrive/Escritorio/012_geoportal/geoportal_areas_verdes/catalogo.json",
  pretty=TRUE,
  auto_unbox=TRUE
)