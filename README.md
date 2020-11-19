# The Analysis for Glassdoor Job Postings
>  From Scraping to Visualization

## The Summary of this Project
In this project, I scraped over 3000 job postings for '*Data Analyst*' from the *Glassdoor* website. Since the *Glassdoor* website is dynamic, I used the **Selenium** library in the **Python** to scrape the job postings related to '*Data Analyst*'. 
After scraping the job postings, I cleaned the scraped data using the **Python** and converted the data to the format for the *Relational Database* to store it in the **SQL** format.
Lastly, I visualized the data using **Tableau**, showing the salary distributions by state, city, sector, and skills.

## Contents
### Scraping Job Postings from Glassdoor
The first thing to do for this project is to collect data. Instead of using the existing data from other sources, I collected the data by scraping. Since the *Glassdoor* website is dynamic, I use the **Selenium** library in Python to scrape the job postings. The code created for scraping is in [glassdoor_scraping_selenium.ipynb](https://github.com/yjeong5126/glassdoor_data_analyst/blob/master/glassdoor_scraping_selenium.ipynb). The key word for job searching was '*Data Analyst*', and I collected about 90 or less job postings for each state. The elements scraped from the site were **company name, job title, location, salary, rating, size, industry, sector, revenue, and job description**.

### Cleaning the Data
The scraped data from the previous step is in the **glassdoor_data_analyst.csv** file. The next step is to clean the data. *Jupyter Notebook* in the *Python* is used again for this cleaning process. The code for cleaning the data is in [glassdoor_data_cleaning.ipynb](https://github.com/yjeong5126/glassdoor_data_analyst/blob/master/glassdoor_data_cleaning.ipynb). 

In this step, not only cleaning the data but also converting the data to the relational database format are done. Converting the data in a spreadsheet to the relational database requires the skill for designing a database using the *Entity Relationship Diagram (ERD)*. The *ERD* I created for this practice is [Entity_Relational_Diagram.PNG](https://github.com/yjeong5126/glassdoor_data_analyst/blob/master/Entity_Relational_Diagram.PNG). Based on the *ERD* I created, I created tables for each entity and stored the tables in the *csv* files. The *csv* files are in the [table_csv_files](https://github.com/yjeong5126/glassdoor_data_analyst/tree/master/table_csv_files) folder. 

### Storing the Data in SQL
The relational database management system (RDMS) used here is *MySQL*. The SQL statements for creating tables are in [creating_tables.sql](https://github.com/yjeong5126/glassdoor_data_analyst/blob/master/creating_tables.sql). After creating a database and the tables, I inserted the data for each table by using the SQL statements in [inserting_records.sql](https://github.com/yjeong5126/glassdoor_data_analyst/blob/master/inserting_records.sql). Then, the original job posting data is stored following the relational database format. 

In [sql_queries.sql](https://github.com/yjeong5126/glassdoor_data_analyst/blob/master/sql_queries.sql), I practiced some sql querries related to this data.

### Data Visualization using Tableau
The final step of this project is to visualize the data. What I tried to do in this analysis is to show the distributions of average salaries by state, city, sectors, and skills using an interactive visualization tool. The visualization tool used in this practice is *Tableau*. The data used for this visualization is **glassdoor_all.csv**, and [jobposting_for_tableau.sql](https://github.com/yjeong5126/glassdoor_data_analyst/blob/master/jobposting_for_tableau.sql) shows how to retrieve this data from the database created in the previous step. 

The created tableau dashboard for this project is [Here](https://public.tableau.com/profile/yohan.jeong#!/vizhome/Glassdoor_DataAnalyst/Dashboard). 


