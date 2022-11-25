library(tidyverse)
library(lubridate)


#Date Prepare and Process
#Import Data
aggregate_data_from_folder<-function(){
  all_month_data <- tibble()
  date_list <- c(202110, 202111, 202112, 202201, 202202, 202203, 202204, 202205, 202206, 202207, 202208, 202209, 202210)
  for(month in date_list){
    print(month)
    one_month_data<- read_csv(paste0("Data/origin data/",month,"-divvy-tripdata/",month,"-divvy-tripdata.csv"))
    all_month_data <- rbind(all_month_data, one_month_data)
  }
  all_month_data
}
bike_share_data <- aggregate_data_from_folder()

#Quick view the data
glimpse(bike_share_data)

#Check data quality
column_name <- bike_share_data %>% names
column_info <- tibble()
for (column in column_name) {
  count <- bike_share_data %>% select(column)  %>% nrow()
  unique_count <- bike_share_data %>% select(column) %>% unique() %>% nrow()
  na_count <- bike_share_data %>% select(column) %>% is.na() %>% sum()
  column_info<- rbind(column_info, tibble(column, count, unique_count, na_count))
}
column_info

#Filter the reocrd with missing value
bike_share_data_complete <- bike_share_data %>% filter(complete.cases(.))

#Add ride length and day of the week columns
bike_share_data_complete <- bike_share_data_complete %>% 
  mutate(ride_length = ended_at - started_at, day_of_week = wday(started_at) ) 

#Data Analyze
#Descriptive statistics
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
bike_share_data_complete$ride_length %>% mean
bike_share_data_complete$ride_length %>% max
bike_share_data_complete$day_of_week %>% getmode

bike_share_data_complete_with_season <- bike_share_data_complete %>% 
  mutate(season = floor_date(started_at, unit = 'season') %>% as.character() %>% substr(6,7))


#without season
bike_share_data_complete_with_season %>% 
  group_by(member_casual) %>% 
  summarise(average_ride_length = mean(ride_length))

bike_share_data_complete_with_season %>% 
  group_by(day_of_week) %>% 
  summarise(average_ride_length = mean(ride_length))

bike_share_data_complete_with_season %>% 
  group_by(day_of_week) %>% 
  summarise( number_of_rider = length(ride_id ))

#with season
bike_share_data_complete_with_season %>% 
  group_by(member_casual, season) %>% 
  summarise(average_ride_length = mean(ride_length))

bike_share_data_complete_with_season %>% 
  group_by(day_of_week, season) %>% 
  summarise(average_ride_length = mean(ride_length))

bike_share_data_complete_with_season %>% 
  group_by(day_of_week, season) %>% 
  summarise( number_of_rider = length(ride_id ))
