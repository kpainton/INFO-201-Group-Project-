# Library needed to create shiny app
library(shiny)

# Creates the shiny UI for my app
shinyUI(navbarPage(
  "Sharks",
  
  # Creates Map panel
  tabPanel(
    "Map",
    
    # Creates Title for Panel
    titlePanel("Map"),
    
    
      # Creates the first scatter plot onto the shiny app
      mainPanel(
          )
          )
          )
)
