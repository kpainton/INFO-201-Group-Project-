# File for Month/Weekday section

# Creates the month/Weekday vs Time Box Plot
month_weekday_time <- function(df, front, back, select) {

  # Filters data for year range
  df <- df %>%
    filter(Year >= front) %>%
    filter(Year <= back) %>% 
    filter(Time != 0)

  # Filters data for useable entries
  df <- df %>%
    filter(Month == "A. January" | Month == "B. February" |
      Month == "C. March" | Month == "D. April" |
      Month == "E. May" | Month == "F. June" | Month == "G. July" |
      Month == "H. August" | Month == "J. September" |
      Month == "K. October" |
      Month == "L. November" | Month == "M. December")

  # Filters data for useable entries
  df <- df %>%
    filter(Weekday == "1. Monday" | Weekday == "2. Tuesday" |
      Weekday == "3. Wednesday" | Weekday == "4. Thursday" |
      Weekday == "5. Friday" | Weekday == "6. Saturday" |
      Weekday == "7. Sunday")

  # Creates the Boxplot
  # X axis = User Selects
  # Y axis = Time
  g <- ggplot(df, aes(df[, select], Time))
  g + geom_boxplot(varwidth = T, fill = "light blue") +
    labs(
      title = paste("Time vs ", select),
      x = "Time",
      y = select
    )
}

# Creates bargraph for Month/Weekday vs Total Attacks
month_weekday_total <- function(df, front, back, select) {
  df <- df %>%
    filter(Year >= front) %>%
    filter(Year <= back) 

  # Filters data for useable entries
  df <- df %>%
    filter(Month == "A. January" | Month == "B. February" |
      Month == "C. March" | Month == "D. April" |
      Month == "E. May" | Month == "F. June" | Month == "G. July" |
      Month == "H. August" | Month == "J. September" |
      Month == "K. October" |
      Month == "L. November" | Month == "M. December")

  # Filters data for useable entries
  df <- df %>%
    filter(Weekday == "1. Monday" | Weekday == "2. Tuesday" |
      Weekday == "3. Wednesday" | Weekday == "4. Thursday" |
      Weekday == "5. Friday" | Weekday == "6. Saturday" |
      Weekday == "7. Sunday")

  # Summarizes data based on what user selected
  if (select == "Weekday") {
    check <- df %>%
      group_by(Weekday) %>%
      summarize(total = n())
  } else {
    check <- df %>%
      group_by(Month) %>%
      summarize(total = n())
  }

  # Joins dataframe together
  df <- left_join(df, check)

  # Removes identical data summaries
  df <- df %>% distinct(df[, select], .keep_all = TRUE)

  # Creates the bar graph
  # X axis = What user selects
  # Y axis = Total Attacks
  ggplot(df, aes(x = df[, select], y = total)) +
    geom_bar(stat = "identity", width = .5, fill = "light blue") +
    labs(title = paste("Total Attacks vs", select)) +
    xlab(select) +
    ylab("Total Attacks") +
    theme(axis.text.x = element_text(angle = 65, vjust = 0.6))
}
