# File for time breakdown section

# Functionn for boxplot of time
time_breakdown <- function(df, select) {

  # Filters out data with no time
  df <- df %>%
    filter(Time != 0) %>%
    filter(Decade != "pre-1880" &
           Decade != "Unknown")

  # Filters for activites
  filters <- c("Surfing", "Swimming", "Fishing", "Kayaking", "Snorkeling")

  # Filters for Species
  top_ten <- c(
    "Great White Shark", "Bull Shark", "Tiger Shark", "Hammerhead Shark",
    "Wobbegong Shark", "Blacktip Shark", "Bronze Whaler Shark",
    "Nurse Shark", "Raggedtooth Shark"
  )

  # Filters out data depending on what user selects in select input
  if (select == "Activity" | select == "Species" | select == "Type") {
    df <- df %>%
      filter(Activity %in% filters) %>%
      filter(Species %in% top_ten) %>%
      filter(Type != "Unknown")
  }

  # Creates a ggplot
  # X Axis = what User Selects
  # Y Axis = Time
  g <- ggplot(df, aes(df[, select], Time))

  # Creates boxplot for different visualization
  g + geom_boxplot(varwidth = T, fill = "light blue") +
    labs(
      title = "Time of Shark Attacks",
      subtitle = paste("Time vs", select),
      caption = "Times are stored as numbers, Ex 1000 = 10:00 AM",
      x = select,
      y = "Time"
    )
}
