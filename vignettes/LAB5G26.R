## ----eval=FALSE, message=FALSE, warning=FALSE----------------------------
#  devtools::install_github('mubhu398/LAB5G26',build_vignettes = TRUE)

## ------------------------------------------------------------------------
    library(lab5G26)

## ------------------------------------------------------------------------
example <- geocode$new("Stockholm")
example$getCoordinate()

