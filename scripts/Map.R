
source(map_key.R)

library(plotly)
library(dplyr)

df <- read.csv(file = "./data/Attacks.with.lat.long.pt2 copy.csv")

Sys.setenv("MAPBOX_TOKEN" = key)

create_map <- function(df, class) {
# df <- df %>% 
  # filter(Year >= front) %>% 
  # filter(Year <= back )
  p <- df %>%
  plot_mapbox(lat = ~lat, lon = ~lon,
              split = ~df[,class], 
              mode = 'scattermapbox', hoverinfo= "name") %>%
  layout(title = 'Meteorites by Class',
         font = list(color='white'),
         plot_bgcolor = '#191A1A', paper_bgcolor = '#191A1A',
         mapbox = list(style = 'dark'),
         legend = list(orientation = 'h',
                       font = list(size = 8)),
         margin = list(l = 25, r = 25,
                       b = 25, t = 25,
                       pad = 2))
p
}

create_map(df, "Activity")

write.csv(df, "Attacks.With.Lon.Lat.csv", row.names=FALSE)
