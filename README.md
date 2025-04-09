# CareerHub_Database
this is a database connection between pycharm and ssms mssql sever the database and attributes 
Directory structure
![image](https://github.com/user-attachments/assets/da2b5c40-35c5-4d23-9a2f-85f43da9b29e)

CareerHub/
├── entity/
│   └── model/
│       ├── __init__.py
│       ├── JobListing.py
│       ├── Company.py
│       ├── Applicant.py
│       └── JobApplication.py
├── dao/
│   ├── __init__.py
│   ├── ICareerHubService.py
│   └── CareerHubServiceImpl.py
├── exception/
│   ├── __init__.py
│   ├── ApplicationDeadlineException.py
│   ├── DatabaseConnectionException.py
│   ├── FileUploadException.py
│   ├── InvalidEmailException.py
│   └── SalaryCalculationException.py
├── util/
│   ├── __init__.py
│   ├── DBPropertyUtil.py
│   └── DBConnUtil.py
└── Main/
    ├── __init__.py
    └── MainModule.py
