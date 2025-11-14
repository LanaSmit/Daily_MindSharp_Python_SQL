# ETL Data Pipeline – CSV to PostgreSQL

This project demonstrates a simple **ETL workflow** using **Python**. It reads employee data from a CSV file, cleans and prepares the dataset with **Pandas**, and then loads the final results into a **PostgreSQL** database for analysis.

---

## Overview
- **Extract:** Import the Softwork.csv dataset into a Pandas DataFrame.  
- **Transform:** Remove duplicate rows, handle missing values , and ensure the data is consistent.  
- **Load:** Establish a database connection with **SQLAlchemy** and write the cleaned data to the employee_table in PostgreSQL.

# Setup Instructions

 ## 1. Create Your Project Folder
 ```bash
mkdir ETL_Pipeline
cd ETL_Pipeline
```
## 2. Add Your CSV File

Place Softwork.csv inside the project folder.

## 3. Install Required Packages

Run this inside your terminal:
```bash
pip install pandas psycopg2 sqlalchemy
```
## 5. Start PostgreSQL

Open pgAdmin or start your local database service.

Create a database named: postgres

## 6. Update Database Credentials

Inside main.py, update:

username = 'postgres'
password = 'your_password_here'
host = 'localhost'
port = 5432
db_name = 'postgres'

## 7. Run the ETL Script
```bash
python main.py
```
