# ETL Data Pipeline – CSV to PostgreSQL

An **ETL pipeline** built in **Python** that extracts data from a CSV file, cleans and transforms it using **Pandas**, and loads the processed results into a **PostgreSQL** database.

---

## Overview
- **Extract:** Reads raw data from `Softwork.csv` into a Pandas DataFrame.  
- **Transform:** Removes duplicate entries, fills missing values (`education` → 'unknown', `previous_year_rating` → 0), and validates data quality.  
- **Load:** Connects to PostgreSQL via **SQLAlchemy** and loads the cleaned dataset into the `employee_table`.

 
