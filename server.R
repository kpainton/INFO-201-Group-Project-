# server.R

# Source data
source("./scripts/Map.R")
source("./scripts/Species.R")

# Read in Data
df <- read.csv(file = "./data/Attacks.with.lat.long.csv")

# Start shinyServer
shinyServer(function(input, output) {
  
  output$Map <- renderPlotly({
    return(create_map(df, input$range[1], input$range[2], 
                      input$filterclass, input$exclude))
  })
  output$SpeciesGraph1 <- renderPlotly({
    return(create_species_with_fatal_decade(df, input$PickSpecies))
  })
  output$SpeciesGraph2 <- renderPlotly({
    return(create_species_with_attack_decade(df, input$PickSpecies))
  })
  output$SpeciesGraph3 <- renderPlotly({
    return(create_species_with_fatal_attack(df, input$PickSpecies))
  })
  
})
