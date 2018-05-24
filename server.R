# server.R

# Source data
source("./scripts/Map.R")
source("./scripts/Species.R")

# Read in Data
df_for_map <- read.csv(file = "./data/Attacks.with.lat.long.csv")

# Start shinyServer
shinyServer(function(input, output) {
  
  output$Map <- renderPlotly({
    return(create_map(df_for_map, input$range[1], input$range[2], 
                      input$filterclass, input$exclude))
  })
})
