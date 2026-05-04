# setting up the environment
# install and load tidyverse package for data data manipulation, exploration, and visualization

install.packages("tidyverse")
library(tidyverse)



# installing and loading other packages relevant for the activity

install.packages("here")
library(here)

install.packages("skimr")
library(skimr)

install.packages("janitor")
library(janitor)

install.packages("dplyr")
library(dplyr)



# setting up work directory while using R studio desktop
# import and load 6 relevant datasets from the root directory

setwd("C:/Users/MyPC/Desktop/CASE STUDY")
read.csv("dailyActivity_merged.csv")
read.csv("dailyCalories_merged.csv")
read.csv("dailyIntensities_merged.csv")
read.csv("dailySteps_merged.csv")
read.csv("sleepDay_merged.csv")
read.csv("weightLogInfo_merged.csv")



# assign datasets to dataframes
# preview data
# view column names

daily_activity <- read.csv("dailyActivity_merged.csv")
head(daily_activity)
View(daily_activity)
colnames(daily_activity)

daily_calories <- read.csv("dailyCalories_merged.csv")
head(daily_calories)
View(daily_calories)
colnames(daily_calories)

daily_intensities <- read.csv("dailyIntensities_merged.csv")
head(daily_intensities)
View(daily_intensities)
colnames(daily_intensities)

daily_steps <- read.csv("dailySteps_merged.csv")
head(daily_steps)
View(daily_steps)
colnames(daily_steps)

sleep_day <- read.csv("sleepDay_merged.csv")
head(sleep_day)
View(sleep_day)
colnames(sleep_day)

weight_log <- read.csv("weightLogInfo_merged.csv")
head(weight_log)
View(weight_log)
colnames(weight_log)



# ensure that the data column names are unique and consistent, that there's only characters, numbers, and underscores in the names
# reassign to dataframes

clean_names(daily_activity)
clean_names(daily_calories)
clean_names(daily_intensities)
clean_names(daily_steps)
clean_names(sleep_day)
clean_names(weight_log)

daily_activity <- clean_names(daily_activity)
daily_calories <- clean_names(daily_calories)
daily_intensities <- clean_names(daily_intensities)
daily_steps <- clean_names(daily_steps)
sleep_day <- clean_names(sleep_day)
weight_log <- clean_names(weight_log)



# confirm number of users by id as stated as participants

n_distinct(daily_activity$id)
n_distinct(daily_calories$id)
n_distinct(daily_intensities$id)
n_distinct(daily_steps$id)
n_distinct(sleep_day$id)
n_distinct(weight_log$id)



# check for comprehensive summary of the datasets

skim_without_charts(daily_activity)
skim_without_charts(daily_calories)
skim_without_charts(daily_intensities)
skim_without_charts(daily_steps)
skim_without_charts(sleep_day)
skim_without_charts(weight_log)



# summarize dataframe

glimpse(daily_activity)
glimpse(daily_calories)
glimpse(daily_intensities)
glimpse(daily_steps)
glimpse(sleep_day)
glimpse(weight_log)


# check for duplicates and delete irrelevant data

nrow(daily_activity[duplicated(daily_activity), ])
nrow(daily_calories[duplicated(daily_calories), ])
nrow(daily_intensities[duplicated(daily_intensities), ])
nrow(daily_steps[duplicated(daily_steps), ])
nrow(sleep_day[duplicated(sleep_day), ])
nrow(weight_log[duplicated(weight_log), ])

# rows that were found duplicate in the sleep_day table got deleted

sleep_day <- sleep_day[!duplicated(sleep_day), ]


# date columns renamed as date as well as few columns

daily_activity <- rename(daily_activity, date = activity_date)
daily_calories <- rename(daily_calories, date = activity_day)
daily_intensities <- rename(daily_intensities, date = activity_day)
daily_steps <- rename(daily_steps, date = activity_day, total_steps = step_total)
sleep_day <- rename(sleep_day, date = sleep_day)


# load relevant package for date column manipulation

library(lubridate)

# sorted the data by activity dates

daily_activity <- daily_activity %>% arrange(date)
daily_calories <- daily_calories %>% arrange(date)
daily_intensities <- daily_intensities %>% arrange(date)
daily_steps <- daily_steps %>% arrange(date)
sleep_day <- sleep_day %>% arrange(date)
weight_log <- weight_log %>%  arrange(date)

# check the data type of date columns for the tables

class(daily_activity$date)
class(daily_calories$date)
class(daily_intensities$date)
class(daily_steps$date)
class(sleep_day$date)
class(weight_log$date)

# convert data type of date columns to data and mdy format 

daily_activity$date <- mdy(daily_activity$date)
daily_calories$date <- mdy(daily_calories$date)
daily_intensities$date <- mdy(daily_intensities$date)
daily_steps$date <- mdy(daily_steps$date)
sleep_day$date <- mdy_hms(sleep_day$date)
weight_log$date <- mdy_hms(weight_log$date)

# confirm with a data preview

View(daily_activity)
View(daily_calories)
View(daily_intensities)
View(daily_steps)
View(sleep_day)
View(weight_log)



#Beginning of the Analysis Process
#Explore the data by gathering some statistics


# confirm number of users by id

n_distinct(daily_activity$id)
n_distinct(daily_calories$id)
n_distinct(daily_intensities$id)
n_distinct(daily_steps$id)
n_distinct(sleep_day$id)
n_distinct(weight_log$id)



# explore column names

colnames(daily_activity)
colnames(daily_calories)
colnames(daily_intensities)
colnames(daily_steps)




# performed data aggregation to make comparisons

compare_df_cols(daily_activity)
compare_df_cols(daily_calories, daily_intensities, daily_steps)
compare_df_cols(daily_activity, daily_calories, daily_intensities, daily_steps)



# 12 similar columns found among the 4 tables
# used daily_activity table to represent all tables with daily data collection

# find the number of unique users in the data for analysis

n_distinct(daily_activity$id)
n_distinct(sleep_day$id)
n_distinct(weight_log$id)



# maintain tables with higher number of participants for analysis (33, 24)
# check number of rows of each table

nrow(daily_activity)
nrow(sleep_day)



# check number of logins made by each user id

user_logs <- count(daily_activity,id) %>% 
  arrange(n)
View(user_logs)
user_logs <- rename(user_logs, logins = n)



# confirm user login counts as observations

sum(user_logs$logins)
summary(user_logs$logins)



# We need find trend and relationship between steps made and sedentary of each id in other to recommend insights to the marketing department.

# finding average total steps as average_steps for all ids
# average summarised, arranged and grouped by id in a new column as mean_steps

average_steps <- daily_activity %>% 
  select(id, total_steps) %>% 
  arrange(id) %>%
  group_by(id) %>% 
  summarise(mean_steps = round(mean(total_steps), digits = 0))
  View(average_steps)

  
  
# finding average total sedentary as average_sedentary for all ids
# average summarised, arranged and grouped by id in a new column as mean_sedentary
  
average_sedentary <- daily_activity %>% 
  select(id, sedentary_minutes) %>% 
  arrange(id) %>% 
  group_by(id) %>% 
  summarise(mean_sedentary = round(mean(sedentary_minutes), digits = 2))
View(average_sedentary)



# merging average_steps and average_sedentary as new_daily_activity to find trends and relationship
# merge by id and mean columns 

new_daily_activity <- merge(average_steps, average_sedentary, by = "id")
View(new_daily_activity)



# We can also find trend and relationship between time in bed and sleep time of each id

# finding average time in bed as average_time_in_bed for all ids
# average summarised, arranged and grouped by id in a new column as mean_bed_time

average_time_in_bed <- sleep_day %>% 
  select(id, total_time_in_bed) %>% 
  arrange(id) %>% 
  group_by(id) %>% 
  summarise(mean_bed_time = round(mean(total_time_in_bed), digits = 0))
view(average_time_in_bed)



# finding average minutes asleep as average_min_asleep for all ids
# average summarised, arranged and grouped by id in a new column as mean_min_steps


average_min_asleep <- sleep_day %>% 
  select(id, total_minutes_asleep) %>% 
  arrange(id) %>% 
  group_by(id) %>% 
  summarise(mean_min_asleep = round(mean(total_minutes_asleep), digits = 0))
View(average_min_asleep)
        


# merging average_time_in_bed and average_min_asleep as new_sleep_day to find trends and relationship
# merge by id and mean columns 

new_sleep_day <- merge(average_time_in_bed, average_min_asleep, by = "id")
View(new_sleep_day)



# Creating plots to find relationship and trends
# Scatter plots to be used since we want to find a relationship between two variables
# drawing smooth line to find trend

ggplot(data = new_daily_activity) + 
  geom_point(mapping = aes(x = mean_steps, y = mean_sedentary),color = 'purple') +
  geom_smooth(mapping = aes(x = mean_steps, y = mean_sedentary))



# Creating plots to find relationship and trends
# with scatter plots
# drawing smooth line to find trend

ggplot(data = new_sleep_day) + 
  geom_point(mapping = aes(x = mean_bed_time, y = mean_min_asleep), color = 'red')+
  geom_smooth(mapping = aes(x = mean_bed_time, y = mean_min_asleep))
