# ETL Data Pipeline – CSV to PostgreSQL

This project demonstrates a simple **ETL workflow** using **Python**. It reads employee data from a CSV file, cleans and prepares the dataset with **Pandas**, and then loads the final results into a **PostgreSQL** database for analysis.

---

## Overview
- **Extract:** Import the `Softwork.csv` dataset into a Pandas DataFrame.  
- **Transform:** Remove duplicate rows, handle missing values (`education` → 'unknown', `previous_year_rating` → 0), and ensure the data is consistent.  
- **Load:** Establish a database connection with **SQLAlchemy** and write the cleaned data to the `employee_table` in PostgreSQL.

 
