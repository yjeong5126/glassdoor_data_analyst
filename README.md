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
The scraped data from the previous step is **glassdoor_data_analyst.csv**. The next step is to clean the data. *Jupyter Notebook* in *Python* is used again for cleaning the data. The code for cleaning the data is [glassdoor_data_cleaning.ipynb](https://github.com/yjeong5126/glassdoor_data_analyst/blob/master/glassdoor_data_cleaning.ipynb). In this step, not only cleaning the data but also converting the data to the relational database format are done. 

### Storing the Data in SQL
### Data Visualization using Tableau
