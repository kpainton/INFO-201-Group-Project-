# Library needed to create shiny app
library(shiny)
library(shinythemes)

# Creates the shiny UI for my app
shinyUI(navbarPage(theme = shinytheme("superhero"),
  "Sharks",
  
  # Creates Map panel
  tabPanel(
    "Map",
    
    # Creates Title for Panel
    titlePanel("Map"),
    sidebarLayout(
      sidebarPanel(
      # Creates the first scatter plot onto the shiny app
        selectInput(
          "filterclass",
          label = h3("Select class"),
          
          # Gives user option for scale input panel
          choices = list(
            "Decade" = "Decade",
            "Species" = "Species",
            "Attack" = "Type",
            "Fatal" = "Fatal"
          ),
          width = "200px"
        ),
        sliderInput("range", label = h3("Slider Range"), min = 1800, 
                    max = 2017, value = c(1800, 2017),
                    width = "300px"),
        radioButtons("exclude", label = h3("Exclude Unknown Data?"),
                     choices = list("Yes" = "TRUE", "No" = "FALSE") 
        )
        ),
      mainPanel(
        plotlyOutput("Map", width = "925px", height = "600px")
    )
    )
    
    #Tap Panel: Map end
    )
  
  #NavBar end
  )

#Shiny UI end  
)      



