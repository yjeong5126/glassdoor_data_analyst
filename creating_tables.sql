
CREATE TABLE states (
    stateID INT NOT NULL AUTO_INCREMENT,
    state VARCHAR(7),
    PRIMARY KEY (stateID)
);

CREATE TABLE sectors (
    sectorID INT NOT NULL AUTO_INCREMENT,
    sector VARCHAR(50),
    PRIMARY KEY (sectorID)
);

CREATE TABLE revenues (
    revenueID INT NOT NULL AUTO_INCREMENT,
    revenue VARCHAR(50),
    PRIMARY KEY (revenueID)
);

CREATE TABLE sizes (
    sizeID INT NOT NULL AUTO_INCREMENT,
    size VARCHAR(50),
    PRIMARY KEY (sizeID)
);

CREATE TABLE skills (
    skillID INT NOT NULL AUTO_INCREMENT,
    skill VARCHAR(30),
    PRIMARY KEY (skillID)
);

CREATE TABLE industries (
    industryID INT NOT NULL AUTO_INCREMENT,
    industry VARCHAR(50),
    sectorID INT,
    PRIMARY KEY (industryID),
    FOREIGN KEY (sectorID)
        REFERENCES sectors (sectorID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE companies (
    companyID INT NOT NULL AUTO_INCREMENT,
    companyName VARCHAR(60),
    sizeID INT,
    revenueID INT,
    industryID INT,
    rating FLOAT,
    PRIMARY KEY (companyID),
    FOREIGN KEY (sizeID)
        REFERENCES sizes (sizeID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (revenueID)
        REFERENCES revenues (revenueID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (industryID)
        REFERENCES industries (industryID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE jobpostings (
    jobpostingID INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(150),
    companyID INT,
    lower_salary INT,
    upper_salary INT,
    job_description TEXT,
    city VARCHAR(30),
    stateID INT,
    PRIMARY KEY (jobpostingID),
    FOREIGN KEY (companyID)
        REFERENCES companies (companyID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (stateID)
        REFERENCES states (stateID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE jobpostings_skills (
    jobpostingID INT NOT NULL,
    skillID INT NOT NULL,
    companyID INT,
    PRIMARY KEY (jobpostingID , skillID),
    FOREIGN KEY (jobpostingID)
        REFERENCES jobpostings (jobpostingID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (skillID)
        REFERENCES skills (skillID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (companyID)
        REFERENCES companies (companyID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
