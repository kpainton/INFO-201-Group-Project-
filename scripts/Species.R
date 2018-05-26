

create_species_with_fatal_decade <- function(data, entry) {
  m <- m <- list(
    l = 50,
    r = 50,
    b = 100,
    t = 100,
    pad = 4
  )
   data <- data %>% 
          select(Date, Year, Decade, Type, Activity, Sex, Age, Fatal, Species) %>% 
          filter(Year >= 1900) %>%
          filter(Species == entry) %>%
          group_by(Decade)
  data_one <- data %>% 
              filter(Fatal == "Yes") %>%
              summarize(total_deaths = n())
  data_two <- data %>% 
              filter(Fatal == "No") %>%
              summarize(survived = n())
  data <- left_join(data, data_one) %>% left_join(data_two)
  data <- data %>% distinct(Decade, .keep_all = TRUE)
  p <- plot_ly(data, x = ~Decade, y = ~total_deaths, type = 'bar', name = 'Yes', 
               color = I("dark blue")) %>%
    add_trace(y = ~survived, name = "No", color = I("light blue")) %>%
    layout(title = paste0("Total Attacks by Decade (", entry, ")"), yaxis = list(title = 'Count'),
           xaxis = list(title = ""), 
           margin = m,
           barmode = 'stack')
  p
}

create_species_with_attack_decade <- function(data, entry) {
  m <- m <- list(
    l = 50,
    r = 50,
    b = 100,
    t = 100,
    pad = 4
  )
  data <- data %>% 
    select(Date, Year, Decade, Type, Activity, Sex, Age, Fatal, Species) %>% 
    filter(Year >= 1900) %>%
    filter(Species == entry) %>%
    group_by(Decade)
  data_one <- data %>% 
    filter(Type == "Unprovoked") %>%
    summarize(Unprovoked = n())
  data_two <- data %>% 
    filter(Type == "Provoked" ) %>%
    summarize(Provoked = n())
  data_three <- data %>% 
    filter(Type == "Invalid" ) %>%
    summarize(Invalid = n())
  data_four <- data %>% 
    filter(Type == "Boating" ) %>%
    summarize(Boating = n())
  data_five <- data %>% 
    filter(Type == "Sea Disaster" ) %>%
    summarize(Sea_disaster = n())
  data <- left_join(data, data_one) %>% left_join(data_two) %>%
          left_join(data_three) %>% left_join(data_four) %>%
          left_join(data_five)
  data <- data %>% distinct(Decade, .keep_all = TRUE)
  p <- plot_ly(data, x = ~Decade, y = ~Unprovoked, type = 'bar', name = 'Unprovoked', 
               color = I("dark blue")) %>%
    add_trace(y = ~Provoked, name = "Provoked", color = I("dark green")) %>%
    add_trace(y = ~Invalid, name = "Invald", color = I("light green")) %>%
    add_trace(y = ~Boating, name = "Boating", color = I("light blue")) %>%
    add_trace(y = ~Sea_disaster, name = "Sea Diaster", color = I("light gray")) %>%
    layout(title = paste0("Total Attacks by Decade (", entry, ")"), yaxis = list(title = 'Count'),
           xaxis = list(title = ""), 
           margin = m,
           barmode = 'stack')
  p
}

create_species_with_fatal_attack <- function(data, entry) {
  m <- m <- list(
    l = 50,
    r = 50,
    b = 100,
    t = 100,
    pad = 4
  )
  data <- data %>% 
    select(Date, Year, Decade, Type, Activity, Sex, Age, Fatal, Species) %>% 
    filter(Year >= 1900) %>%
    filter(Species == entry) %>%
    group_by(Type)
  data_one <- data %>% 
    filter(Fatal == "Yes") %>%
    summarize(total_deaths = n())
  data_two <- data %>% 
    filter(Fatal == "No") %>%
    summarize(survived = n())
  data <- left_join(data, data_one) %>% left_join(data_two)
  data <- data %>% distinct(Type, .keep_all = TRUE)
  p <- plot_ly(data, x = ~Type, y = ~total_deaths, type = 'bar', name = 'Yes', 
               color = I("dark blue")) %>%
    add_trace(y = ~survived, name = "No", color = I("light blue")) %>%
    layout(title = paste0("Total Attacks by Decade (", entry, ")"), yaxis = list(title = 'Count'),
           xaxis = list(title = ""), 
           margin = m,
           barmode = 'stack')
  p
}
