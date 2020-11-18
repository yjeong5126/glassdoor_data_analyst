SELECT 
    jp.jobpostingID,
    jp.title,
    ROUND((jp.lower_salary + jp.upper_salary) / 2,
            0) AS avg_salary,
    sk.skill,
    jp.city,
    st.state,
    c.companyName,
    si.size,
    r.revenue,
    i.industry,
    se.sector
FROM
    jobpostings jp
        JOIN
    companies c ON c.companyID = jp.companyID
        JOIN
    states st ON st.stateID = jp.stateID
        JOIN
    sizes si ON si.sizeID = c.sizeID
        JOIN
    revenues r ON r.revenueID = c.revenueID
        JOIN
    industries i ON i.industryID = c.industryID
        JOIN
    sectors se ON se.sectorID = i.sectorID
        JOIN
    jobpostings_skills js ON js.jobpostingID = jp.jobpostingID
        JOIN
    skills sk ON sk.skillID = js.skillID
ORDER BY jp.jobpostingID;