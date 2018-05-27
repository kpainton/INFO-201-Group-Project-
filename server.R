# server.R

# Source data
source("./scripts/Map.R")
source("./scripts/Species.R")

# Read in Data
df <- read.csv(file = "./data/Attacks.with.lat.long.csv")

# Start shinyServer
shinyServer(function(input, output) {

  # Creates the output for interactive map
  output$Map <- renderPlotly({
    return(create_map(
      df, input$range[1], input$range[2],
      input$filterclass, input$exclude
    ))
  })

  # Creates the output for first species graph
  output$Species_Graph_1 <- renderPlotly({
    return(create_species_fatal_decade(df, input$PickSpecies))
  })

  # Creates the output for second species graph
  output$Species_Graph_2 <- renderPlotly({
    return(create_species_attack_decade(df, input$PickSpecies))
  })

  # Creates the output for third species graph
  output$Species_Graph_3 <- renderPlotly({
    return(create_species_fatal_attack(df, input$PickSpecies))
  })
})
