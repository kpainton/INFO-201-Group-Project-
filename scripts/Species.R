dfone <- read.csv(file = "./data/Attacks.with.lat.long.pt2.csv")
dfone <- dfone %>% 
  select(Date, Year, Type, Activity, Sex, Age, Fatal, Species) %>% 
  arrange(Species)



