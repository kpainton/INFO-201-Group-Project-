# File for the functions that create the species graph

# Creates the first species stacked bar chart
# X axis sorted by Decade
# Stack color sorted by Fatalities
create_species_fatal_decade <- function(data, entry) {

  # Margins for resolution of the graph
  m <- m <- list(
    l = 50,
    r = 50,
    b = 100,
    t = 100,
    pad = 4
  )

  # Reshapes data frame to meet the species that user chose
  data <- data %>%
    select(Date, Year, Decade, Type, Activity, Sex, Age, Fatal, Species) %>%
    filter(Year >= 1900) %>%
    filter(Species == entry) %>%
    group_by(Decade)

  # Summarizes information about the fatalities by Decade
  data_one <- data %>%
    filter(Fatal == "Yes") %>%
    summarize(total_deaths = n())

  # Summarizes infromation on the "Survivors" by Decade
  data_two <- data %>%
    filter(Fatal == "No") %>%
    summarize(survived = n())

  # Joins data together from information found above
  data <- left_join(data, data_one) %>%
    left_join(data_two) %>%
    arrange(Decade)

  # Seprates data to one entry per decade
  data <- data %>% distinct(Decade, .keep_all = TRUE)

  # Creates a stacked bar chart
  p <- plot_ly(data,
    x = ~ Decade, y = ~ total_deaths, type = "bar", name = "Yes",
    color = I("dark blue")
  ) %>%
    add_trace(y = ~ survived, name = "No", color = I("light blue")) %>%
    layout(
      title = paste0("Total Attacks by Decade (", entry, ")"),
      yaxis = list(title = "Count"),
      xaxis = list(title = ""),
      margin = m,
      barmode = "stack"
    )

  # returns the bar graph
  p
}

# Creates the second species stacked bar chart
# X axis sorted by Decade
# Stack color sorted by Attack Type
create_species_attack_decade <- function(data, entry) {

  # Margins for resolution of the graph
  m <- m <- list(
    l = 50,
    r = 50,
    b = 100,
    t = 100,
    pad = 4
  )

  # Reshapes data frame to meet the species that user chose
  data <- data %>%
    select(Date, Year, Decade, Type, Activity, Sex, Age, Fatal, Species) %>%
    filter(Year >= 1900) %>%
    filter(Species == entry) %>%
    group_by(Decade)

  # Filters data based on Unprovoked attacks
  data_one <- data %>%
    filter(Type == "Unprovoked") %>%
    summarize(Unprovoked = n())

  # Filters data based on Provoked attacks
  data_two <- data %>%
    filter(Type == "Provoked") %>%
    summarize(Provoked = n())

  # Filters data based on Invalid attacks
  data_three <- data %>%
    filter(Type == "Invalid") %>%
    summarize(Invalid = n())

  # Filters data based on Boating attacks
  data_four <- data %>%
    filter(Type == "Boating") %>%
    summarize(Boating = n())

  # Filters data based on Sea Diaster attacks
  data_five <- data %>%
    filter(Type == "Sea Disaster") %>%
    summarize(Sea_disaster = n())

  # Joins together filtered data from above
  data <- left_join(data, data_one) %>%
    left_join(data_two) %>%
    left_join(data_three) %>%
    left_join(data_four) %>%
    left_join(data_five) %>%
    arrange(Decade)

  # Seprates data to one entry per decade
  data <- data %>% distinct(Decade, .keep_all = TRUE)

  # Creates stacked bar chart
  p <- plot_ly(data,
    x = ~ Decade, y = ~ Unprovoked, type = "bar", name = "Unprovoked",
    color = I("dark blue")
  ) %>%
    add_trace(y = ~ Provoked, name = "Provoked", color = I("dark green")) %>%
    add_trace(y = ~ Invalid, name = "Invald", color = I("light green")) %>%
    add_trace(y = ~ Boating, name = "Boating", color = I("light blue")) %>%
    add_trace(y = ~ Sea_disaster, name = "Sea Diaster",
              color = I("light gray")) %>%
    layout(
      title = paste0("Total Attacks by Decade (", entry, ")"),
      yaxis = list(title = "Count"),
      xaxis = list(title = ""),
      margin = m,
      barmode = "stack"
    )

  # returns the bar graph
  p
}

# Creates the third species stacked bar chart
# X axis sorted by Attack Type
# Stack color sorted by fatalities
create_species_fatal_attack <- function(data, entry) {

  # Margins for resolution of the graph
  m <- m <- list(
    l = 50,
    r = 50,
    b = 100,
    t = 100,
    pad = 4
  )

  # Reshapes data frame to meet the species that user chose
  data <- data %>%
    select(Date, Year, Decade, Type, Activity, Sex, Age, Fatal, Species) %>%
    filter(Year >= 1900) %>%
    filter(Species == entry) %>%
    group_by(Type)

  # Summarizes information about the fatalities by Attack Type
  data_one <- data %>%
    filter(Fatal == "Yes") %>%
    summarize(total_deaths = n())

  # Summarizes infromation on the "Survivors" by Attack Type
  data_two <- data %>%
    filter(Fatal == "No") %>%
    summarize(survived = n())

  # Joins data together from information found above
  data <- left_join(data, data_one) %>% left_join(data_two)

  # Seprates data to one entry per decade
  data <- data %>% distinct(Type, .keep_all = TRUE)

  # Creates stacked bar chart
  p <- plot_ly(data,
    x = ~ Type, y = ~ total_deaths, type = "bar", name = "Yes",
    color = I("dark blue")
  ) %>%
    add_trace(y = ~ survived, name = "No", color = I("light blue")) %>%
    layout(
      title = paste0("Total Attacks by Decade (", entry, ")"),
      yaxis = list(title = "Count"),
      xaxis = list(title = ""),
      margin = m,
      barmode = "stack"
    )

  # returns the bar graph
  p
}
