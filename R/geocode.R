#' Coordinate finder
#'
#' The 'geocode' contains a function that converts an address to coordinates using an openweather API.
#'
#' @field out A data frame contains address, lontitude, latitude.
#' @field adrs A character represents address
#'
#' @import methods
#' @importFrom httr content GET
#' @importFrom rjson fromJSON
#'
#' @export geocode
#' @exportClass geocode

geocode <- setRefClass("geocode",
   fields = list(
                 adrs = "character",
                 out = "data.frame"
                 ),
   methods = list(
     initialize = function(input){
       Sys.setlocale(locale = "english")
       cat("User::initialize\n")

       if((!is.character(input))||nchar(input)<=0)
        stop("try again")
       adrs <<- input
       out <<- data.frame()
     },
     getCoordinate = function(){
         cat("Processing\n")
         key <- "42db6ca84392bff4038cde9470a0d24c"
         url<- paste("http://api.openweathermap.org/data/2.5/forecast?q=",adrs,"&APPID=",key,sep = "")
         get_url <- httr::GET(url = url)
         get_url_text <- httr::content(get_url,"text")
         json <- rjson::fromJSON(get_url_text)
         if(json$cod==404)
           stop(json$message)
         out <<- data.frame(addr=json$city$name, lon=json$city$coord$lon, lat=json$city$coord$lat)
         out
     }
   )
)

