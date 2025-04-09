# CareerHub_Databse
this is a database connection between pycharm and ssms mssql sever the database and attributes 
Repository structure
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
