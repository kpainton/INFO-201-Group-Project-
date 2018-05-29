# File for numbers of attack by year/month/day
# Create the function to display the number of attacks in
# several conditions
create_bar <- function(df, select, decade) {
  # add the column to declare the month and day
  df$Month <- substr(df$Case.Number, 6, 7)
  df$Day <- substr(df$Case.Number, 9, 10)
  # get the data in selected decade and delete useless data
  df <- df %>%
    filter(Decade == decade & Month != "00" & Day != "00")
  # plot the graph if user choose year as differentiate condition
  if (select == "Year") {
    df <- df %>%
      group_by(Year) %>%
      summarise(n = n())
    p <- ggplot(data = df, aes(x = Year, y = n, fill = Year)) +
      geom_bar(stat = "identity") +
      scale_x_continuous(breaks = df$Year) +
      geom_text(aes(label = n), vjust = 1.6, color = "white", size = 3.5) +
      labs(
        title = "The numbers of attacks happened among years",
        x = "Year", y = "Number"
      )
    # plot the graph if user choose month as differentiate condition
  } else if (select == "Month") {
    df <- df %>%
      group_by(Month) %>%
      summarise(n = n())
    p <- ggplot(data = df, aes(x = Month, y = n, fill = Month)) +
      geom_bar(stat = "identity") +
      geom_text(aes(label = n), vjust = 1.6, color = "white", size = 3.5) +
      labs(
        title = "The numbers of attacks happened among Months",
        x = "Month", y = "Number"
      ) +
      theme_minimal()
    # plot the graph if user choose day as differentiate condition
  } else if (select == "Day") {
    df <- df %>%
      group_by(Day) %>%
      summarise(n = n())
    p <- ggplot(data = df, aes(x = Day, y = n, fill = Day)) +
      geom_bar(stat = "identity") +
      geom_text(aes(label = n), vjust = 1.6, color = "white", size = 3.5) +
      labs(
        title = "The numbers of attacks happened among Days",
        x = "Day", y = "Number"
      ) +
      theme_minimal()
  }



  # return graph
  return(p)
}
