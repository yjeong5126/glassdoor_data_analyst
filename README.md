# The Analysis for Glassdoor Job Postings - From Scraping to Visualization
>  Scraping, cleaning, and visualizing the data from Glassdoor

## The Goal of this Project
In this project, I scraped over 3000 job postings for data analysts from Glassdoor. Since the website for Glassdoor is dynamic, I scraped the jobpostings using Selenium in Python.
After finishing scraping the data, I cleaned it using Python and rearranged the data in the format for the relational database in order to store it in the SQL.
Then, I made some visualization for the data using Tableua. Through the process, I showed how to scrape, clean, store, and visualize the data. 

## Contents
### Scraping Job Postings from Glassdoor
The first thing to do for this project is to collect data. Instead of using the data from other sources, I collected the data by scraping. Since the website *Glassdoor* is dynamic, I use the **Selenium** library in Python to scrape the site. The code used for scraping is [glassdoor_scraping_selenium.ipynb](https://github.com/yjeong5126/glassdoor_data_analyst/blob/master/glassdoor_scraping_selenium.ipynb). The key word for job searching is 'Data Analyst', and I collected about 90 or less job postings for each state. The elements about job postings which were scraped are *company name, job title, location, salary, rating, size, industry, sector, revenue, job description*.

### Cleaning the Data
The scraped data from the previous step is **glassdoor_data_analyst.csv**. The next step is to clean the data. *Jupyter Notebook* in *Python* is used again for cleaning the data. The code for cleaning the data is [glassdoor_data_cleaning.ipynb](https://github.com/yjeong5126/glassdoor_data_analyst/blob/master/glassdoor_data_cleaning.ipynb). In this step, not only cleaning the data but also converting the data to the relational database format are done. The Entity Relational Diagram (ERD) that I created for designing the database is [Entity_Relational_Diagram.PNG](https://github.com/yjeong5126/glassdoor_data_analyst/blob/master/Entity_Relational_Diagram.PNG). The scraped data was in a spreadsheet. But I converted the data into several tables following the ERD I created. 

### Storing the Data in SQL
Based on the ERD, the data is stored in the multiple csv files, which are stored in the [table_csv_files](https://github.com/yjeong5126/glassdoor_data_analyst/tree/master/table_csv_files) folder. The relational database management system (RDMS) used here is *MySQL*. The SQL statements for creating tables are [creating_tables.sql](https://github.com/yjeong5126/glassdoor_data_analyst/blob/master/creating_tables.sql). After creating a database and the tables, I inserted the jobposting data, which are the csv files in [table_csv_files](https://github.com/yjeong5126/glassdoor_data_analyst/tree/master/table_csv_files), by using the SQL statements in [inserting_records.sql](https://github.com/yjeong5126/glassdoor_data_analyst/blob/master/inserting_records.sql). [sql_queries.sql](https://github.com/yjeong5126/glassdoor_data_analyst/blob/master/sql_queries.sql) shows some of my SQL queries related to this data.

### Data Visualization using Tableau
The final step of this project is to visualize the data. What I tried to do in this analysis is to show the average salaries by state, city, and the distributions of the salaries by sectors and the required skills and to make the visualization interactive with users in Tableau. The data for this visualization is **glassdoor_all.csv**, and [jobposting_for_tableau.sql](https://github.com/yjeong5126/glassdoor_data_analyst/blob/master/jobposting_for_tableau.sql) shows how to retrieve the data from the database created in the previous step. The created tableau dashboard for this project is [Here](https://public.tableau.com/profile/yohan.jeong#!/vizhome/Glassdoor_DataAnalyst/Dashboard). 


