-- Create Database
CREATE DATABASE CareerHub;
GO

USE CareerHub;
GO

-- Create Companies Table
CREATE TABLE Companies (
    CompanyID INT PRIMARY KEY IDENTITY(1,1),
    CompanyName NVARCHAR(100) NOT NULL,
    Location NVARCHAR(100) NOT NULL
);

-- Create Jobs Table
CREATE TABLE Jobs (
    JobID INT PRIMARY KEY IDENTITY(1,1),
    CompanyID INT NOT NULL,
    JobTitle NVARCHAR(100) NOT NULL,
    JobDescription TEXT NOT NULL,
    JobLocation NVARCHAR(100) NOT NULL,
    Salary DECIMAL(10,2) CHECK (Salary >= 0),
    JobType NVARCHAR(50) NOT NULL,
    PostedDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID) ON DELETE CASCADE
);

-- Create Applicants Table
CREATE TABLE Applicants (
    ApplicantID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Phone NVARCHAR(20) NOT NULL,
    Resume TEXT NOT NULL
);

-- Create Applications Table
CREATE TABLE Applications (
    ApplicationID INT PRIMARY KEY IDENTITY(1,1),
    JobID INT NOT NULL,
    ApplicantID INT NOT NULL,
    ApplicationDate DATETIME DEFAULT GETDATE(),
    CoverLetter TEXT NOT NULL,
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID) ON DELETE CASCADE,
    FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID) ON DELETE CASCADE
);

USE CareerHub;
GO

-- Insert 10 Companies
INSERT INTO Companies (CompanyName, Location) VALUES
('Tech Innovators', 'New York'),
('DataWorks', 'San Francisco'),
('CloudNet', 'Austin'),
('FutureTech', 'Boston'),
('CodeCrafters', 'Seattle'),
('Digital Solutions', 'Chicago'),
('InfoSystems', 'Los Angeles'),
('ByteMasters', 'Dallas'),
('NextGen Apps', 'Denver'),
('SmartDev', 'Atlanta');
GO

-- Insert 10 Jobs
INSERT INTO Jobs (CompanyID, JobTitle, JobDescription, JobLocation, Salary, JobType) VALUES
(1, 'Senior Software Engineer', 'Develop high-performance applications', 'New York', 120000.00, 'Full-time'),
(2, 'Data Analyst', 'Analyze data sets and provide insights', 'San Francisco', 85000.00, 'Contract'),
(3, 'Cloud Architect', 'Design and implement cloud solutions', 'Austin', 130000.00, 'Full-time'),
(4, 'Machine Learning Engineer', 'Build ML models for predictive analytics', 'Boston', 110000.00, 'Full-time'),
(5, 'Frontend Developer', 'Create responsive web interfaces', 'Seattle', 95000.00, 'Part-time'),
(6, 'IT Support Specialist', 'Provide technical support and troubleshooting', 'Chicago', 60000.00, 'Contract'),
(7, 'Database Administrator', 'Manage and optimize database systems', 'Los Angeles', 98000.00, 'Full-time'),
(8, 'Cybersecurity Analyst', 'Protect systems from security threats', 'Dallas', 105000.00, 'Full-time'),
(9, 'Mobile App Developer', 'Develop iOS and Android applications', 'Denver', 115000.00, 'Contract'),
(10, 'UX/UI Designer', 'Design user-friendly interfaces', 'Atlanta', 90000.00, 'Full-time');
GO

-- Insert 10 Applicants
INSERT INTO Applicants (FirstName, LastName, Email, Phone, Resume) VALUES
('Alice', 'Johnson', 'alice.johnson@email.com', '111-222-3333', 'Experienced software developer with 5 years in Java.'),
('Bob', 'Smith', 'bob.smith@email.com', '222-333-4444', 'Data analyst skilled in Python and SQL.'),
('Charlie', 'Brown', 'charlie.brown@email.com', '333-444-5555', 'Cloud solutions architect with AWS certification.'),
('Diana', 'Miller', 'diana.miller@email.com', '444-555-6666', 'Machine learning enthusiast with a focus on NLP.'),
('Ethan', 'Davis', 'ethan.davis@email.com', '555-666-7777', 'Frontend developer specializing in React.js.'),
('Fiona', 'Wilson', 'fiona.wilson@email.com', '666-777-8888', 'IT support with 3 years of experience.'),
('George', 'Moore', 'george.moore@email.com', '777-888-9999', 'Database administrator proficient in MySQL and Oracle.'),
('Hannah', 'Taylor', 'hannah.taylor@email.com', '888-999-0000', 'Cybersecurity expert with CISSP certification.'),
('Ian', 'Anderson', 'ian.anderson@email.com', '999-000-1111', 'Mobile app developer with published apps on Play Store.'),
('Jessica', 'Thomas', 'jessica.thomas@email.com', '000-111-2222', 'UX/UI designer with a portfolio in Figma.');
GO

-- Insert 10 Applications
INSERT INTO Applications (JobID, ApplicantID, CoverLetter) VALUES
(1, 1, 'Excited to apply for the Senior Software Engineer role at Tech Innovators...'),
(2, 2, 'Interested in contributing my data analysis skills to DataWorks...'),
(3, 3, 'Eager to implement cloud solutions for CloudNet...'),
(4, 4, 'Passionate about developing ML models at FutureTech...'),
(5, 5, 'Ready to create engaging interfaces for CodeCrafters...'),
(6, 6, 'Experienced in providing IT support for Digital Solutions...'),
(7, 7, 'Proficient in database optimization for InfoSystems...'),
(8, 8, 'Cybersecurity professional ready to protect ByteMasters...'),
(9, 9, 'Mobile development expertise for NextGen Apps...'),
(10, 10, 'Creative UX/UI solutions for SmartDev...');
GO
select * from Applicants
select * from JobListings

SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
AND TABLE_NAME = 'Jobs';  -- Replace 'JobListings' with the table you're searching for

EXEC sp_rename 'dbo.Jobs', 'JobListings';
WITH CTE AS (
    SELECT 
        JobID, 
        CompanyID, 
        JobTitle, 
        JobDescription, 
        JobLocation, 
        Salary, 
        JobType, 
        PostedDate,
        ROW_NUMBER() OVER (PARTITION BY CompanyID, JobTitle, JobLocation ORDER BY JobID) AS row_num
    FROM dbo.JobListings
)
DELETE FROM CTE WHERE row_num > 1;

select * from Companies
select* from Applicants
INSERT INTO JobListings (JobID, JobTitle, JobDescription, PostedDate)
VALUES (1, 'Software Engineer', 'Responsible for developing software applications', GETDATE());
INSERT INTO Applicants (ApplicantID, FirstName, LastName, Email)
VALUES (1001, 'John', 'Doe', 'john.doe@example.com');

select * from Applications
