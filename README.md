# 🌿 Bellabeat-Smart-Device-Usage-Analysis
End-to-end data analysis case study analyzing smart fitness device data to uncover user behavior trends and deliver strategic marketing recommendations for Bellabeat, a women-focused health tech company. 


## 📌 Overview  

This is a data analysis case study completed as part of the Google Data Analytics Professional Certificate. The goal was to analyze smart device fitness data to uncover how users interact with their devices — and translate those insights into actionable marketing recommendations for Bellabeat, a health-focused tech company for women.  




## 🏢 About Bellabeat  

Bellabeat is a high-tech wellness company focused on empowering women through data-driven. It was founded in 2013 by Urška Sršen and Sando Mur. The company develops health-focused smart products that collect data on activity, sleep, stress, and reproductive health — empowering women with knowledge about their own wellness.  




## 🎯 Business Task

Bellabeat’s ecosystem enables users to better understand their habits and make informed lifestyle decisions. 
This project analyzes Fitbit smart device usage data to identify trends and behavioral patterns, and use those insights to guide Bellabeat's marketing strategy. 
Focus: How do daily steps relate to sedentary behavior among smart device users?




## 📂 Dataset

Source: Fitbit Fitness Tracker Data — Kaggle (Möbius)  

License: CCO Public Domain

Period: March – May 2016

Participants: 30–33 Fitbit users (via Amazon Mechanical Turk survey)

Files Used: dailyActivity_merged, dailyCalories_merged, dailyIntensities_merged, dailySteps_merged, sleepDay_merged, weightLogInfo_merged




## ⚠️ Data Limitations:

Small sample size

Outdated dataset (2016)

No demographic data (gender, age, location)

Not specific to Bellabeat’s target audience (women)




## 🛠️ Tools & Packages

Language: R, Tableau

Packages: tidyverse, lubridate, here, skimr, janitor, dplyr, ggplot2




## 🔄 Methodology (Data Analysis Process)

This project follows the 6-step data analysis framework:

- Ask
- Prepare
- Process
- Analyze
- Share
- Act




## 🧹 Data Cleaning

- Standardized column names using clean_names()
- Removed 3 duplicate rows from sleep_day
- Renamed date columns for consistency across all tables
- Converted date columns from char to Date format using lubridate
- Sorted all datasets by date



## 🔍 Exploratory Analysis

User Engagement:

- Total users: 33
- Average logins: 28


User segmentation:

- Active users: 81.8%
- Low-engagement users: 18.1%


### 🔢 Calculated average daily steps and average sedentary minutes per user

(Classified users by activity level based on WHO & NIH guidelines):

- Sedentary (<5,000 steps): 8 users
- Low Active (5,000–7,999): 11 users
- Somewhat Active (8,000–9,999): 7 users
- Active (10,000+): 4 users
- More Active (12,000+): 3 users


### Calculated average time in bed vs average minutes asleep per user
- Merged dataframes for visualization



## 📊 Key Findings

- 81.8% of users (27/33) were active users based on login frequency; 18.1% were light users
- 26 out of 33 users did not meet the recommended 10,000 daily steps
- Only 7 users consistently hit the active threshold


1. Steps vs Sedentary Time
   
- No strong relationship found between daily steps and sedentary minutes
- Suggesting sedentary behavior exists independently of step count


2. Sleep Patterns
- Strong positive relationship found between time spent in bed and minutes asleep
- Users who allocate more time for rest tend to achieve better sleep outcomes.



## 🔑 Key Insights

- Most users are not sufficiently active
- Engagement (logins) is high, but behavior change is limited
- Sleep habits are more consistent than physical activity
- Sedentary lifestyles remain common across users




## 💡Recommendation

1. Target Sedentary Users (Focus marketing on): 
- Office workers
- Remote workers
- Low-mobility lifestyles

2. In-app education:
- Provide tips on how walking and movement improve health outcomes
- Risks of sedentary behavior

3. Goal setting feature:
- Allow users to set daily, weekly, and monthly activity targets
- Progress tracking dashboards
   
4. Smart notifications:
- Prompt users when they fall short of their activity goals
- “Move alerts” during inactivity
- Motivational prompts
   
5. Women-focused features (Since Bellabeat targets women):
- Integrate menstrual cycle insights period tracking with activity guidance
- Provide tailored health recommendations
- Encourage activity during different cycle phases



## 🎯 Conclusion

This analysis highlights a critical opportunity for Bellabeat:
- While users are engaged with the app, many are not achieving optimal health outcomes.


By combining behavioral nudges, personalization, and targeted marketing, Bellabeat can:
- Increase user activity levels
- Improve retention
- Strengthen its position in the women’s wellness market




## 👤 Author: 
👤 Prince Owusu Agyare

📧 prince.agyare@gmail.com

🔗 https://www.linkedin.com/in/prince-o-agyare-data-bi-reporting-analyst/ 
