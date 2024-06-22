library(readr)
library(tidyverse)
library(dplyr)
library(lubridate)
library(skimr)
library(janitor)
library(ggplot2)
library(hms)

# Export cleaned all_trips 
all_trips <- read_csv("2023-2024_divvy-tripdata_cleaned.csv")

# Descriptive Analysis

#all_trips$ride_length <- as.numeric(as.character(all_trips$ride_length))
#is.numeric(all_trips$ride_length)

# Descriptive analysis on ride_length (all figures in seconds)
summary(all_trips$ride_length)

# Compare members and casual users
aggregate(all_trips$ride_length ~ all_trips$member_casual, FUN = mean)
aggregate(all_trips$ride_length ~ all_trips$member_casual, FUN = median)
aggregate(all_trips$ride_length ~ all_trips$member_casual, FUN = max)
aggregate(all_trips$ride_length ~ all_trips$member_casual, FUN = min)

# See the average ride time for every day for members vs casual users
aggregate(all_trips$ride_length ~ all_trips$member_casual + all_trips$day_of_week,
          FUN = mean)

# Sort days of the week
all_trips$day_of_week <- ordered(all_trips$day_of_week,
                                 levels=c("Sunday", "MOnday", "Tuesday", 
                                          "Wednessday", "Thursday", "Friday",
                                          "Saturday"))

# Analyzing ridership data by type and weekday

all_trips %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>%  
  arrange(member_casual, weekday)

# Visualize average duration of ride by rider type

all_trips %>%
  mutate(weekday = wday(started_at, label = TRUE)) %>%
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n() ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday) %>% 
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) + 
  geom_col(position = "dodge")

# EXPORT SUMMARY FILE FOR FURTHER ANALYSIS

# Total and Average number of weekly rides by rider type
summary_wd <- all_trips %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>%  
  group_by(member_casual, weekday) %>%  
  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>%    
  arrange(member_casual, weekday)

write_csv(summary_wd, "summary_ride_length_weekday.csv")

# Total and Average number of monthly rides by rider type
summary_month <- all_trips %>% 
  mutate(month = month(started_at, label = TRUE)) %>%  
  group_by(month,member_casual) %>%  
  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>%    
  arrange(month, member_casual)

write_csv(summary_month, "summary_ride_length_month.csv")

# Stations most used by each user group
summary_station <- all_trips %>% 
  mutate(station = start_station_name) %>%
  drop_na(start_station_name) %>% 
  group_by(start_station_name, member_casual) %>%  
  summarise(number_of_rides = n()) %>%    
  arrange(number_of_rides)

write_csv(summary_station, "summary_stations.csv")

