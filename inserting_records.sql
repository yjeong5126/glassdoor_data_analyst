drop database glassdoor_data_analyst;
create database glassdoor_data_analyst;
use glassdoor_data_analyst;

load data infile '/ProgramData/MySQL/MySQL Server 8.0/Uploads/glassdoor_data_analyst/states.csv' 
into table states 
fields terminated by ','  
lines terminated by '\r\n' 
(state);

load data infile '/ProgramData/MySQL/MySQL Server 8.0/Uploads/glassdoor_data_analyst/sectors.csv' 
into table sectors 
fields terminated by ',' 
optionally enclosed by '"' 
lines terminated by '\r\n' 
(sector);

load data infile '/ProgramData/MySQL/MySQL Server 8.0/Uploads/glassdoor_data_analyst/revenues.csv' 
into table revenues 
fields terminated by ',' 
optionally enclosed by '"' 
lines terminated by '\r\n' 
(revenue);

load data infile '/ProgramData/MySQL/MySQL Server 8.0/Uploads/glassdoor_data_analyst/sizes.csv' 
into table sizes 
fields terminated by ',' 
optionally enclosed by '"' 
lines terminated by '\r\n' 
(size);

load data infile '/ProgramData/MySQL/MySQL Server 8.0/Uploads/glassdoor_data_analyst/skills.csv' 
into table skills 
fields terminated by ',' 
optionally enclosed by '"' 
lines terminated by '\r\n' 
(skill);

load data infile '/ProgramData/MySQL/MySQL Server 8.0/Uploads/glassdoor_data_analyst/industries.csv' 
into table industries 
fields terminated by ',' 
optionally enclosed by '"' 
lines terminated by '\r\n' 
(industry, sectorID);

load data infile '/ProgramData/MySQL/MySQL Server 8.0/Uploads/glassdoor_data_analyst/companies.csv' 
into table companies 
fields terminated by ',' 
optionally enclosed by '"' 
lines terminated by '\r\n' 
(companyName, sizeID, revenueID, industryID, @rating)
SET rating = IF(char_length(trim(@rating)) = 0, NULL, @rating);

load data infile '/ProgramData/MySQL/MySQL Server 8.0/Uploads/glassdoor_data_analyst/jobpostings.csv' 
into table jobpostings 
fields terminated by ',' 
optionally enclosed by '"' 
lines terminated by '\r\n' 
(title, companyID, lower_salary, upper_salary, job_description, city, stateID);

load data infile '/ProgramData/MySQL/MySQL Server 8.0/Uploads/glassdoor_data_analyst/jobpostings_skills.csv' 
into table jobpostings_skills 
fields terminated by ',' 
lines terminated by '\r\n' 
(jobpostingID, skillID, companyID);