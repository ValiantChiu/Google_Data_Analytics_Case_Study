library(tidyverse)
library(lubridate)


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