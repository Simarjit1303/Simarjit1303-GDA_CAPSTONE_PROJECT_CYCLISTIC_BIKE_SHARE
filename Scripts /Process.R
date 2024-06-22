# Installing Required Packages
install.packages(c("readr,tidyverse","dplyr","lubridate","skimr","janitor","ggplot2"))

library(readr)
library(tidyverse)
library(dplyr)
library(lubridate)
library(skimr)
library(janitor)
library(ggplot2)
library(hms)

getwd() #displays your working directory 

setwd("F:/Data Analysis/Case Study/1. How Does a Bike-Share Navigate Speedy Success/Trip_Data_CSV/")
#sets your working directory to simplify calls to data ... make sure to use your OWN username instead of mine ;)

getwd()

# STEP 1: COLLECT DATA

# Upload Divvy datasets (csv files) here

Trip_data_06_2023 <- read.csv("202306-divvy-tripdata.csv")
Trip_data_07_2023 <- read.csv("202307-divvy-tripdata.csv")
Trip_data_08_2023 <- read.csv("202308-divvy-tripdata.csv")
Trip_data_09_2023 <- read.csv("202309-divvy-tripdata.csv")
Trip_data_10_2023 <- read.csv("202310-divvy-tripdata.csv")
Trip_data_11_2023 <- read.csv("202311-divvy-tripdata.csv")
Trip_data_12_2023 <- read.csv("202312-divvy-tripdata.csv")
Trip_data_01_2024 <- read.csv("202401-divvy-tripdata.csv")
Trip_data_02_2024 <- read.csv("202402-divvy-tripdata.csv")
Trip_data_03_2024 <- read.csv("202403-divvy-tripdata.csv")
Trip_data_04_2024 <- read.csv("202404-divvy-tripdata.csv")
Trip_data_05_2024 <- read.csv("202405-divvy-tripdata.csv")

# STEP 2: WRANGLE DATA AND COMBINE INTO A SINGLE FILE

# Compare column names each of the files, while the names don't have to be in the
# same order, they **do** need to match perfectly before we can use a command to 
# join them into one file

colnames(Trip_data_06_2023)
colnames(Trip_data_07_2023)
colnames(Trip_data_08_2023)
colnames(Trip_data_09_2023)
colnames(Trip_data_10_2023)
colnames(Trip_data_11_2023)
colnames(Trip_data_12_2023)
colnames(Trip_data_01_2024)
colnames(Trip_data_02_2024)
colnames(Trip_data_03_2024)
colnames(Trip_data_04_2024)
colnames(Trip_data_05_2024)

# Stack individual quarter's data frames into one big data frame

all_trips <- bind_rows(Trip_data_06_2023, Trip_data_07_2023,
                       Trip_data_08_2023, Trip_data_09_2023, Trip_data_10_2023,
                       Trip_data_11_2023, Trip_data_12_2023, Trip_data_01_2024,
                       Trip_data_02_2024, Trip_data_03_2024, Trip_data_04_2024,
                       Trip_data_05_2024)
write_csv(all_trips, "combined_data.csv")

colnames(all_trips)# List of column names
nrow(all_trips) # How many rows are in data frame?
dim(all_trips) # Dimensions of the data frame?
head(all_trips) # See the first 6 rows of data frame. 
tail(all_trips) # See the last 6 rows of data frame
str(all_trips) # See list of columns and data types (numeric, character, etc) 
summary(all_trips) # Statistical summary of data. Mainly for numerics

table(all_trips$member_casual)
# Preparing for analysis
# Add Column "ride_length" and calculated the length of each ride
# Add new columns to calculate the following for each ride.
# Date, Year, Month, Day, Day of the week
# These columns provide additional opportunities to aggregate the data.

all_trips$date <- as.Date(all_trips$started_at ) # The default format is yyyy-mm-dd
all_trips$month <- format(as.Date(all_trips$date), "%m")
all_trips$day <- format(as.Date(all_trips$date), "%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")
all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")

summary(all_trips)

all_trips$ride_length <- as_hms(difftime(all_trips$ended_at,all_trips$started_at))

head(all_trips)
str(all_trips)

# Check data for errors
all_trips <- all_trips %>%
              filter(ride_length > 0)

# Clean column names and checked for duplicate records in rows. 
all_trips <- all_trips %>%
              clean_names() %>%
              unique()
# Export cleaned all_trips to a new csv
write_csv(all_trips,"2023-2024_divvy-tripdata_cleaned.csv")
