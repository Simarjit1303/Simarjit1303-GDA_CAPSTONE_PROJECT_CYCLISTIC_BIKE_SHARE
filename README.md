# Case Study: Cyclistic Bike-Share

_This document is created as part of the capstone project of the Google Data Analytics Professional Certificate._

## Introduction and Scenario
You are a junior data analyst in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The marketing director believes the company’s future success depends on maximizing the number of annual memberships. Therefore, your team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve your recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## About the Company
In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geo-tracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system at any time.

The project follows the six-step data analysis process: **Ask, Prepare, Process, Analyze, Share, and Act**.

## STAGE 1: Ask 
Three questions will guide the future marketing program:
 1. How do annual members and casual riders use Cyclistic bikes
    differently? 
 2. why would casual riders buy Cyclistic annual memberships?
 3. How can Cyclistic use digital media to influence casual
        riders to become members?
        
Lily Moreno(Marketing Director) has assigned you the first question to answer: 
**How do annual members and casual riders use Cyclistic bikes differently?**

### Summary of Business Task

The goal of this case study is to identify how annual members and casual riders use Cyclistic bikes differently.

This comparison along with other tasks will later be used by the marketing department for developing strategies aimed at converting casual riders into members

### Stakeholders:
1. Primary stakeholders: The director of marketing and the Cyclistic executive team
2. Secondary stakeholders: Cyclistic marketing analytics team

## STAGE 2: Data Preparation 

The data that we will be using is Cyclistic’s historical trip data from the last 12 months (June 2023 to May 2024). The data has been made available by Motivate International Inc. on this [link](https://divvy-tripdata.s3.amazonaws.com/index.html) under this [license](https://www.divvybikes.com/data-license-agreement).

The dataset consists of 12 CSV files (each for a month) with 13 columns and more than 4 million rows.

ROCCC approach is used to determine the credibility of the data

-   **R**eliable – It is complete and accurate and it represents all bike rides taken in the city of Chicago for the selected duration of our analysis.
-   **O**riginal - The data is made available by Motivate International Inc. which operates the city of Chicago’s Divvy bicycle-sharing service which is powered by Lyft.
-   **C**omprehensive - the data includes all information about ride details including starting time, ending time, station name, station ID, type of membership and many more.
-   **C**urrent – It is up-to-date as it includes data until the end of May 2021
-   **C**ited - The data is cited and is available under the Data License Agreement.

<!-- **Data Limitation**

A quick filtering and checking data for completeness shows that the “start station name and ID” and “end station name and ID” for some rides are missing. Further observations suggest that the most missing data about “start station name” belongs to “electric bikes” as 201,975 out of 888,490 electric ride-shares have missing data and it accounts for 22% of total electric-bike ride shares.

This limitation could slightly affect our analysis for finding stations where most electric bikes are taken but we can use “end station names” to locate our customers and this can be used for further analysis and potential marketing campaigns. -->

## PHASE 3: Process

Performed data processing using R programming.
- Click [here]() to view the R script and the summary of complete data processing.

## PHASE 4: Analyzing Data
Performed data aggregation using R Programming.
- Click [here](https://github.com/skramazan/GDA_Capstone_Project_Cyclistic_Bike-share/blob/main/02.%20Analysis/analysis_script.R) to view the R script and the summary of the complete analysis process.

Further analysis were carried out to perform calculations and identify trends and relationships using PivotTable and Charts on Microsoft Excel.

 - Click [here](https://github.com/skramazan/GDA_Capstone_Project_Cyclistic_Bike-share/tree/main/02.%20Analysis) to view individual Excel files used for analysis

## PHASE 5: Share
Microsoft PowerPoint is used for data visualization and presenting key insights.
- Click [here](https://github.com/skramazan/GDA_Capstone_Project_Cyclistic_Bike-share/tree/main/03.%20Presentation) to download the presentation.

## PHASE 6: Act
After analyzing, we reached to the following conclusion:
- Casual riders take less number of rides but for longer durations.
- Casual Riders are most active on weekends, and the months of June and July.
- Casual riders mostly use bikes for recreational purposes.

Here are my top 3 recommendations based on the above key findings:
1. Design riding packages by keeping recreational activities, weekend contests, and summer events in mind and offer special discounts and coupons on such events to encourage casual riders to get an annual membership.

2. Design seasonal packages, It allows flexibility and encourages casual riders to get membership for specific periods if they are not willing to pay for an annual subscription.

3. Effective and efficient promotions by targeting casual riders at the busiest times and stations:
	- Days: Weekends
	- Months: February, June, and July
	- Stations: Streeter Dr & Grand Ave, Lake Shore Dr & Monroe St, Millennium Park


***Thanks for reading and Happy Analyzing!*** :smiley: :bar_chart:
