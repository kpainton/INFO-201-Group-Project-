
# Source in MapBox key
source("./scripts/map_key.R")

# Libraries Needed to build Map
library(dplyr)

# To make this specific map, use MAPBOX
Sys.setenv("MAPBOX_TOKEN" = key)

# Function to make map based on user input
create_map <- function(df, front, back, class, truth) {
  # Edits data frame to meet certain year
  df <- df %>% 
    filter(Year >= front) %>% 
    filter(Year <= back)
  
  if (truth == "TRUE") {
    df <- df %>% 
      filter(Species != "Unknown Species") %>%
      filter(Type != "Unknown") %>%
      filter(Type != "Invalid") %>%
      filter(Fatal != "Unknown")
  } 

  # Creates Map
  p <- df %>%
  plot_mapbox(lat = ~lat, lon = ~lon,
              split = df[,class], 
              mode = 'scattermapbox'
              ) %>%
  add_markers(text = ~paste("Date = ", df$Date, 
                            "<br />",
                            "Location =", df$Location,
                            "<br />",
                            "Species =", df$Species,
                            "<br />",
                            "Sex =", df$Sex, 
                            "<br />",
                            "Age =", df$Age,
                            "<br />",
                            "Fatal =",
                            df$Fatal)
   
  )%>%
  layout(title = paste('Shark Attacks by', class),
         font = list(color='white'),
         plot_bgcolor = '#191A1A', paper_bgcolor = '#191A1A',
         mapbox = list(style = 'dark', zoom = 0.765),
         legend = list(orientation = 'h',
                       font = list(size = 8)),
         margin = list(l = 25, r = 25,
                       b = 25, t = 25,
                       pad = 2))
  # Returns map
  p
}

