# Library needed to create shiny app
library(shiny)
library(shinythemes)
library(plotly)

# Creates the shiny UI for my app
shinyUI(
  navbarPage(
    theme = shinytheme("superhero"),
    "Sharks",

    # Creats Tab Panel for Mission tab
    tabPanel(
      "Mission",

      # Adds CSS styling to Shiny App
      includeCSS("style.css"),

      # Creates Title for Mission Panel
      titlePanel(tags$h1(class = "mapTitle", "Our Mission")),

      # Creates page for information on our app"
      fluidPage(
        tags$div(
          tags$br(),
          tags$h4(class = "MissionInfo", "Through the use of the Shark Research
                  Insitute's dataset, we have created multiple tab panels of
                  data visulaizations of all recorded shark attacks.  These
                  interactive visualzations will give you the oppurtunity to
                  explore different areas of the data set and hopefully provide
                  you with some valuable insight on shark attacks.  Our goal by
                  the end of exploring our app is to help be aware of where and
                  how these shark attacks happen, learn about the different
                  species of sharks, and better understand the complexity of
                  these different incidents."),
          tags$br(),
          tags$h3(class = "mapTitle", "Information on the Data set"),
          tags$br(),
          tags$p(class = "Mission", "   The data used in our shiny app is the
                  Global Shark Attack dataset collected by the Shark Research
                  Institute.  The Shark Research Institute is a scientific
                  research organization founded in 1991 in Princeton, New
                  Jersey. It was created to sponsor and conduct research on
                  sharks ensuring and bringing awareness to their conservation.
                  This dataset aims to explore the significance of interactions
                  between sharks and humans in comparison to the wide variety
                  of dangers we are exposed to in our daily lives. Humans are
                  not a prey to sharks, this dataset aims to give a better
                  understanding of interactions between humans and sharks
                  to minimize the risk of being injured by a shark and focusing
                  on the importance of conserving all shark species. The
                  dataset’s objective is to illustrate the actual threat that
                  sharks present to humans, to convey the message that these
                  creatures are not at all aggressive towards humans but our
                  ignorance and belief in stereotypes have made us think
                  otherwise."),
          tags$br(),
          tags$p(class = "Mission", "Those who may be interested in using this
                 dataset would vary from medical personnel, shark behaviorists,
                 divers, lifesavers to the media. The media would be a major
                 target audience to focus on. Researchers who gather this data
                 conducted personal interviews with medical personnel, victims
                 and witnesses to obtain a first-hand account of this incident.
                 After forensic analysis is conducted on the incident, it can
                 then be reported accurately through the media to answer the
                 public's question of whether the stereotype of sharks
                 naturally attacking humans is true or merely a misconception.
                 If proven a false stereotype, the mediacan inform the world
                 (their target audience) that sharks are not as dangerous as
                 the general population thinks.")
        )
      )
      # Tap Panel: Mission Page end
    ),

    # Creates Map panel
    tabPanel(
      "Interactive Map",

      # Creates Title for Map Panel
      titlePanel(tags$div(tags$h1(class = "mapTitle",
                                  "Map of Recorded Shark Attacks"))),

      # Creates sidepanel for different widgits
      sidebarLayout(
        sidebarPanel(
          tags$div(
            tags$h6(class = "mapQuick", "This map is designed to give you a
                    visual display of where most shark attacks take place
                    globally.  The various widgits below let you control
                    the data being displayed on the map.  The map is
                    interactive allowing you to hover each point to see
                    information on the date, location, species, sex of victim,
                    and if the injuries were fatal.  Additionally, you can zoom
                    in/out in the map and filter in/out groups displayed on the
                    map by clicking on each group in the legend")
          ),

          # Creates the select input to filter different points on the map
          selectInput(
            "filterclass",
            label = h3("Select Filter"),

            # Gives user option for the filter input panel
            choices = list(
                          "Attack" = "Type",
                          "Fatal" = "Fatal",
                          "Decade" = "Decade",
                          "Species" = "Species"
            ),
            width = "200px"
          ),
          tags$div(
            tags$h6(class = "selectFilter", "Here you can choose a filter
                    option to have the color of the points on the map represent
                    different groupings of data:"),
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
            tags$h6(class = "selectFilter", "Fatal: grouped based on if there
                    were any deaths from incident")
          ),

          # Creates the slider function for the range of years
          sliderInput("range",
            label = h3("Year Range"), min = 1800,
            max = 2017, value = c(1800, 2017),
            width = "300px"
          ),

          # Creates radio button to exclude certain information
          radioButtons("exclude",
            label = h3("Exclude Unknown Data?"),
            choices = list("Yes" = "TRUE", "No" = "FALSE")
          ),
          tags$div(
            tags$h6(class = "selectFilter", "By selecting yes, all points that
                    have data with unknown information will be removed from the
                    map.  For example, any shark species that was not identified
                    will not be shown.  By selecting no, all points (exlcuding
                    points that do not have a lon/lat values) regardless of data
                    that they contain will be plotted on the map.")
          ),
          tags$p(class = "disclaimer", "Points are rough estimations of
                 locations and not 100% accurate based on the nature of the
                 dataframe.  Not all recored shark attacks are plotted onto
                 the map")
        ),

        # Creates the panel for the map and summary information
        mainPanel(

          # Creates different tabs inside the map panel
          tabsetPanel(

            # Creates the panel for the interactive map
            tabPanel("Interactive map",
                     plotlyOutput("Map", width = "925px", height = "705px")),

            # Creates the panel for information gathered from the map
            tabPanel("Summary of Inforamtion", tags$div(
              tags$h2("Here are some quick notes on the information gathered
                       from the map:"),
              tags$br(),
              tags$h4("- The most aggressive sharks appear to be the
                      Tiger Shark, White Shark, and Bull Shark"),
              tags$h1(),
              tags$h4("- The white shark appeared the most 'global shark'
                      having the most incidents
                      spread out across the globe"),
              tags$h1(),
              tags$h4("- Most popular areas for attacks: Australia coast,
                      Southeastern coast of United States (Florida),
                      Western Coast of the United States, Caribbean Islands,
                      Southern Europe, South Africa Coast"),
              tags$h1(),
              tags$h4("- Most provoked attacks occur along the
                      Southeastern Coast of the United States"),
              tags$br(),
              tags$h2("This information also provides insight
                      on the 'regional' sharks."),
              tags$h3("Note: region-exlusive represents a
                      species that only appeared in that particualr region"),
              tags$br(),
              tags$h4("Australia: Bronze Whaler Shark (region-exclusive),
                      Bull Shark, Carpet Shark (region-exclusive),
                      Grey Nurse Shark (region-exclusive),
                      Wobbegong Shark (region-exclusive), White Shark"),
              tags$h1(),
              tags$h4("Caribbean Islands: Caribbean Reef Shark
                      (region-exclusive)"),
              tags$h1(),
              tags$h4("Europe: Blue Shark, Porbeagle Shark (Atlantic),
                      White Shark"),
              tags$h1(),
              tags$h4("South Africa: Copper Shark (region-exclusive),
                      Zambezi Shark (Name for Bull Shark in Africa),
                      Raggedtooth Shark (region-exclusive), White Shark"),
              tags$h1(),
              tags$h4("Southeastern USA: Blacktip Shark (Florida),
                      Bull Shark (Florida),
                      Tiger Shark, Lemon Shark,
                      Nurse Shark (region-exclusive), Sand Shark"),
              tags$h1(),
              tags$h4("West Coast USA: White Shark (Pacific Ocean)")
            ))
          )
        )
      )

      # Tap Panel: Map end
    ),

    # Creates tab Panel for Species section
    tabPanel(
      "Breakdown of Shark Species",

      # Creates Title for Species panel
      titlePanel(tags$div(tags$h1(class = "mapTitle",
                                  "Breakdown of Sharks Attacks By Species"))),
      sidebarLayout(

        # Creates side panel for pick the species option
        sidebarPanel(

          # Creates radio buttons for user to pick a species
          radioButtons("PickSpecies",
            label = h3("Pick a Shark Species"),
            choices = list(
                    "White Shark (605 total attacks)" = "White Shark",
                    "Tiger Shark (234 total attacks)" = "Tiger Shark",
                    "Bull Shark (152 total attacks)" = "Bull Shark",
                    "Blacktip Shark (64 total attacks)" = "Blacktip Shark",
                    "Bronze Whaler Shark (60 total attacks)" =
                    "Bronze Whaler Shark",
                    "Mako Shark (51 total attacks)" = "Mako Shark",
                    "Nurse Shark (49 total attacks)" = "Nurse Shark",
                    "Wobbegong Shark (45 total attacks)" = "Wobbegong Shark",
                    "Hammerhead Shark (43 total attacks)" = "Hammerhead Shark",
                    "Raggedtooth Shark (43 total attacks)" =
                    "Raggedtooth Shark",
                    "Unknown Shark" = "Unknown Species"
                   )
          )
        ),

        # Uses tabset panel to create four different tabs of information
        mainPanel(
          tabsetPanel(

            # Creates the tab panel for the first graph
            tabPanel("Attacks by Decade (Part One)",
                     plotlyOutput("Species_Graph_1",
                                  width = "800px", height = "600px")),

            # Creates the tab panel for the second graph
            tabPanel("Attacks by Decade (Part Two)",
                     plotlyOutput("Species_Graph_2",
                                  width = "800px", height = "600px")),

            # Creates the tab panel for the third graph
            tabPanel("Attacks by Attack Type",
                     plotlyOutput("Species_Graph_3",
                                  width = "800px", height = "600px")),

            # Creates the tab panel for the summmary infromation
            tabPanel(
              "Summary of Information",
              tags$div(
                tags$h2("Here are some quick notes on the information gathered
                        from the different graphs:"),
                tags$br(),
                tags$h4("- Of the 10 shark species with the most attacks,
                        only the White Shark, Tiger Shark, Bull Shark,
                        and Mako shark have had a fatal incident in the
                        last 30 years"),
                tags$br(),
                tags$h4("- Despite being involved in only 49 incidents,
                        the Nurse Shark has been provoked in 33 of those
                        incidents"),
                tags$br(),
                tags$h4("- Unprovoked attacks are the most common reason for
                        shark attacks"),
                tags$br(),
                tags$h4("- The amount of unknow species attacks had a
                        large spike in 1960s along with the highest amount of
                        provoked attacks over any decade.  This total wouldn't
                        be eclipsed until the 2000s"),
                tags$br(),
                tags$h4("- The amount of shark attacks have been steadily
                        increasing with most of the attacks coming
                        from the last 17 years.")
              )
            )
          )
        )
      )

    # Tap Panel: Species end
    )

    # NavBar end
  )
  # Shiny UI end
)
