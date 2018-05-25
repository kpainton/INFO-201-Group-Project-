# Library needed to create shiny app
library(shiny)
library(shinythemes)

# Creates the shiny UI for my app
shinyUI(navbarPage(theme = shinytheme("superhero"), 
  "Sharks",
  tabPanel(
    "Mission",
    includeCSS("style.css"),
    
    # Creates Title for Panel
    titlePanel("Mission"),
      mainPanel(
        tags$div(
          tags$p("Some sort of paragraph on mission statement/findings/etc.")
        )
      )
    # Tap Panel: Home Page end
    ),
  
  # Creates Map panel
  tabPanel(
    "Map",
    
    # Creates Title for Panel
    titlePanel(tags$div(tags$h1(class = "mapTitle", "Map of Recored Shark Attacks"))),
    sidebarLayout(
      sidebarPanel(
        tags$div(
          tags$h6(class = "mapQuick", "This map is designed to give you a visual display
                  of where most shark attacks take place globally.  The various widgits below
                  let you control the data being displayed on the map.  The map is interactive 
                  allowing you to hover each point to see information on the date, location, 
                  species, sex of victim, and if the injuries were fatal.  Additionally, 
                  you can zoom in/out in the map and filter in/out groups displayed on the map by
                  clicking on each group in the legend")
        ),
          
      # Creates the first scatter plot onto the shiny app
        selectInput(
          "filterclass",
          label = h3("Select Filter"),
          
          # Gives user option for scale input panel
          choices = list(
            "Attack" = "Type",
            "Fatal" = "Fatal",
            "Decade" = "Decade",
            "Species" = "Species"
          ),
          width = "200px"
        ),
        tags$div(
          tags$h6(class = "selectFilter", "Here you can choose a filter option to have the color
                  of the points on the map represent different groupings of data:"),
          tags$p(),
          tags$h6(class = "selectFilter", "Decade: 
                  grouped into different 10-year time periods"),
          tags$p(),
          tags$h6(class = "selectFilter", "Species:
                  grouped based on the species of the shark involved in
                  the incident"),
          tags$p(),
          tags$h6(class = "selectFilter", "Attack: grouped based on how 
                  incident occured"),
          tags$p(),
          tags$h6(class = "selectFilter", "Fatal: grouped based on if there were
                  any deaths from incident")
        ),
        sliderInput("range", label = h3("Slider Range"), min = 1800, 
                    max = 2017, value = c(1800, 2017),
                    width = "300px"),
        radioButtons("exclude", label = h3("Exclude Unknown Data?"),
                     choices = list("Yes" = "TRUE", "No" = "FALSE") 
        ),
        tags$div(
          tags$h6(class = "selectFilter", "By selecting yes, all points that have data with unknown information
                  will be removed from the map.  For example, any shark species that 
                  was not identified will not be shown.  By selecting no, all points
                  (exlcuding points that do not have a lon/lat values)
                  regardless of data that they contain will be plotted on the map.")
        ),
        tags$p(class = "disclaimer", "Points are rough estimations of locations and not
                                     100% accurate based on the nature of the dataframe.
                                     Not all recored shark attacks are plotted onto the map")
        ),
      mainPanel(
        tabsetPanel(
        tabPanel("Interavtive map", plotlyOutput("Map", width = "925px", height = "705px")),
        tabPanel("Summary of Inforamtion", tags$div(
          tags$h2("Here are some quick notes on the information gathered from the maps:"),
          tags$br(),
          tags$h4("- The most aggressive sharks appear to be the Tiger Shark, White Shark, and Bull Shark"),
          tags$p(),
          tags$h4("- The white shark appeared the most 'global shark' having the most incidents 
                  spread out across the globe"),
          tags$p(),
          tags$h4("- Most popular areas for attacks: Australia coast, Southeastern coast of United States (Florida), 
                  Western Coast of the United States, Caribeean Islands, Southern Europe, South Africa Coast"),
          tags$p(),
          tags$h4("- Most provoked attacks occur along the Southeastern Coast of the United States"),
          tags$br(),
          tags$h2("This information also provides insight on the 'regional' sharks.  Note: region-exlusive represents a 
                  species that only appeared in that particualr region"),
          tags$br(),
          tags$h4("Australia: Bronze Whaler Shark (region-exclusive), Bull Shark, Carpet Shark (region-exclusive), Grey Nurse Shark (region-exclusive), Wobbegong Shark (region-exclusive), White Shark"),
          tags$p(),
          tags$h4("Caribbean Islands: Caribeen Reef Shark (region-exclusive)"),
          tags$p(),
          tags$h4("Europe: Blue Shark, Porbeagle Shark (Atlantic), White Shark"),
          tags$p(),
          tags$h4("South Africa: Copper Shark (region-exclusive), Zambezi Shark (Name for Bull Shark in Africa), Raggedtooth Shark (region-exclusive), White Shark"),
          tags$p(),
          tags$h4("Southeastern USA: Blacktip Shark (Florida), Bull Shark (Florida), Tiger Shark, Lemon Shark, Nurse Shark (region-exclusive), Sand Shark"),
          tags$p(),
          tags$h4("West Coast USA: White Shark (Pacific Ocean)")
        ))
        )
    )
    )
    
    #Tap Panel: Map end
    )
  
  #NavBar end
  )

#Shiny UI end  
)      



