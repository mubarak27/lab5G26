#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#



if (!require('lab5G26',character.only = TRUE)){
    library(devtools)
    install_github('https://github.com/mubarak27/lab5G26')
    if(!require('lab5G26',character.only = TRUE)) stop("Package not found")
}

library(shiny)
library(leaflet)





# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("Cities","Select Cities",c("Karachi","Sialkot","Lahore","Peshawar","Quetta","Stockholm","Linkoping","Malmo","Gothenberg","Jonkoping"))
        ),
        

        # Show a plot of the generated distribution
        mainPanel(
            leafletOutput("maps")
            
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$maps <- renderLeaflet({
        obj <- lab5G26::geocode$new(input$Cities)
        cords <- obj$getCoordinate()
        
        leaflet() %>%
            addProviderTiles(providers$Stamen.TonerLite,
                             options = providerTileOptions(noWrap = TRUE)
            ) %>%
            addMarkers(lat =cords$lat ,lng = cords$lon,popup = cords$addr )
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
