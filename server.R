# server.R

# Source data
source("./scripts/Map.R")
source("./scripts/Species.R")
source("./scripts/BoxPlot.R")
source("./scripts/Time_Total.R")
source("./scripts/Time.R")
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
  output$species_graph_1 <- renderPlotly({
    return(create_species_fatal_decade(df, input$PickSpecies))
  })

  # Creates the output for second species graph
  output$species_graph_2 <- renderPlotly({
    return(create_species_attack_decade(df, input$PickSpecies))
  })

  # Creates the output for third species graph
  output$species_graph_3 <- renderPlotly({
    return(create_species_fatal_attack(df, input$PickSpecies))
  })

  # Creates the output for the time box plot
  output$time_graph <- renderPlot({
    return(time_breakdown(df, input$filterTime))
  })

  # Creates the output for the month/weekday boxplot
  output$month_weekday_times <- renderPlot({
    return(month_weekday_time(df, input$time[1],
                              input$time[2], input$Xaxis))
  })

  # Creates the output for the month/weekday barchart
  output$month_weekday_totals <- renderPlot({
    return(month_weekday_total(df, input$time[1],
                               input$time[2], input$Xaxis))
  })
  output$bar_chart <- renderPlot({
    return(create_bar(df, input$`time `, input$`decade `))
  })
})
