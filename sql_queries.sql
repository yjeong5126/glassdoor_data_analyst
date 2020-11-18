# Q1) Which industries, sectors or state have highest mean salaries?
## industry
SELECT 
    A.industry, ROUND(AVG(avg_salary), 0) AS avg_salary
FROM
    (SELECT 
    jp.jobpostingID,
    jp.title,
    jp.companyID,
    i.industry,
    se.sector,
    jp.lower_salary,
    jp.upper_salary,
    ROUND(((jp.lower_salary + jp.upper_salary) / 2),
            0) AS avg_salary,
    st.state
FROM
    jobpostings jp
        JOIN
    states st ON st.stateID = jp.stateID
        JOIN
    companies c ON c.companyID = jp.companyID
        JOIN
    industries i ON i.industryID = c.industryID
        JOIN
    sectors se ON se.sectorID = i.sectorID
WHERE
    jp.lower_salary > 0) A
GROUP BY A.industry
ORDER BY avg_salary DESC;

## Sector
SELECT 
    A.sector, ROUND(AVG(avg_salary), 0) AS avg_salary
FROM
    (SELECT 
        jp.jobpostingID,
            jp.title,
            jp.companyID,
            i.industry,
            se.sector,
            jp.lower_salary,
            jp.upper_salary,
            ROUND(((jp.lower_salary + jp.upper_salary) / 2), 0) AS avg_salary,
            st.state
    FROM
        jobpostings jp
    JOIN states st ON st.stateID = jp.stateID
    JOIN companies c ON c.companyID = jp.companyID
    JOIN industries i ON i.industryID = c.industryID
    JOIN sectors se ON se.sectorID = i.sectorID
    WHERE
        jp.lower_salary > 0) A
GROUP BY A.sector
ORDER BY avg_salary DESC;

## State
SELECT 
    A.state, ROUND(AVG(avg_salary), 0) AS avg_salary
FROM
    (SELECT 
        jp.jobpostingID,
            jp.title,
            jp.companyID,
            i.industry,
            jp.lower_salary,
            jp.upper_salary,
            ROUND(((jp.lower_salary + jp.upper_salary) / 2), 0) AS avg_salary,
            st.state
    FROM
        jobpostings jp
    JOIN states st ON st.stateID = jp.stateID
    JOIN companies c ON c.companyID = jp.companyID
    JOIN industries i ON i.industryID = c.industryID
    WHERE
        jp.lower_salary > 0) A
GROUP BY A.state
ORDER BY avg_salary DESC;

# Q2) Which companies offer highest salaries?
SELECT 
    jp.companyID,
    c.companyName,
    ROUND(AVG((jp.lower_salary + jp.upper_salary) / 2),
            0) AS avg_salary
FROM
    jobpostings jp
        JOIN
    companies c ON c.companyID = jp.companyID
WHERE
    jp.lower_salary > 0
GROUP BY jp.companyID
ORDER BY avg_salary DESC;

# Q3) Show the size, revenue, rating, and the average salary for each company

SELECT 
    c.companyName,
    si.size,
    r.revenue,
    c.rating,
    ROUND(AVG((jp.lower_salary + jp.upper_salary) / 2),
            0) AS avg_salary
FROM
    companies c
        JOIN
    sizes si ON si.sizeID = c.sizeID
        JOIN
    revenues r ON r.revenueID = c.revenueID
        JOIN
    jobpostings jp ON jp.companyID = c.companyID
WHERE
    (jp.lower_salary > 0)
        AND c.rating IS NOT NULL
GROUP BY c.companyID;

# Q4) Which software skills are most sought after?
SELECT 
    sk.skill, COUNT(sk.skillID) AS '# of postings'
FROM
    jobpostings_skills js
        JOIN
    skills sk ON sk.skillID = js.skillID
GROUP BY sk.skill
ORDER BY COUNT(sk.skillID) DESC;
    
# Q5) Show the number of skills required and avg_salary for each job posting
SELECT 
    jp.jobpostingID,
    jp.title,
    jp.companyID,
    ROUND((jp.lower_salary + jp.upper_salary) / 2,
            0) AS avg_salary,
    COUNT(js.skillID) AS Number_of_Skills
FROM
    jobpostings jp
        JOIN
    jobpostings_skills js ON js.jobpostingID = jp.jobpostingID
        JOIN
    companies c ON c.companyID = jp.companyID
WHERE
    jp.lower_salary > 0
        AND js.skillID NOT IN (5 , 11)
GROUP BY jp.jobpostingID;

# Q6) Create Dummies for each skill
    SELECT 
        jp.jobpostingID,
            jp.title,
            ROUND((jp.lower_salary + jp.upper_salary) / 2, 0) AS avg_salary,
            SUM(CASE
                WHEN js.skillID = 1 THEN 1
                ELSE 0
            END) AS R,
            SUM(CASE
                WHEN js.skillID = 2 THEN 1
                ELSE 0
            END) AS Agile,
            SUM(CASE
                WHEN js.skillID = 3 THEN 1
                ELSE 0
            END) AS AWS,
            SUM(CASE
                WHEN js.skillID = 4 THEN 1
                ELSE 0
            END) AS Azure,
            SUM(CASE
                WHEN js.skillID = 6 THEN 1
                ELSE 0
            END) AS Excel,
            SUM(CASE
                WHEN js.skillID = 7 THEN 1
                ELSE 0
            END) AS Java,
            SUM(CASE
                WHEN js.skillID = 8 THEN 1
                ELSE 0
            END) AS Oracle,
            SUM(CASE
                WHEN js.skillID = 9 THEN 1
                ELSE 0
            END) AS Power_BI,
            SUM(CASE
                WHEN js.skillID = 10 THEN 1
                ELSE 0
            END) AS Powerpoint,
            SUM(CASE
                WHEN js.skillID = 12 THEN 1
                ELSE 0
            END) AS Python,
            SUM(CASE
                WHEN js.skillID = 13 THEN 1
                ELSE 0
            END) AS SAP,
            SUM(CASE
                WHEN js.skillID = 14 THEN 1
                ELSE 0
            END) AS SAS,
            SUM(CASE
                WHEN js.skillID = 15 THEN 1
                ELSE 0
            END) AS 'SQL',
            SUM(CASE
                WHEN js.skillID = 16 THEN 1
                ELSE 0
            END) AS Tableau
    FROM
        jobpostings jp
    JOIN jobpostings_skills js ON js.jobpostingID = jp.jobpostingID
    JOIN skills sk ON sk.skillID = js.skillID
    WHERE
        jp.lower_salary > 0
    GROUP BY jp.jobpostingID;

# Q7) Create a View to show the original scraped data before inserting into SQL

CREATE VIEW v_original_table AS
    SELECT 
        jp.jobpostingID,
        jp.title,
        c.companyName,
        s.size,
        r.revenue,
        i.industry,
        se.sector,
        jp.lower_salary,
        jp.upper_salary,
        jp.city,
        st.state,
        sk.skill
    FROM
        jobpostings_skills js
            JOIN
        jobpostings jp ON jp.jobpostingID = js.jobpostingID
            JOIN
        skills sk ON sk.skillID = js.skillID
            JOIN
        companies c ON c.companyID = jp.companyID
            JOIN
        states st ON st.stateID = jp.stateID
            JOIN
        sizes s ON s.sizeID = c.sizeID
            JOIN
        revenues r ON r.revenueID = c.revenueID
            JOIN
        industries i ON i.industryID = c.industryID
            JOIN
        sectors se ON se.sectorID = i.sectorID
    ORDER BY jp.jobpostingID , sk.skillID;