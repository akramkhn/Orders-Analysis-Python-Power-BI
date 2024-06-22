ETL Project Overview
In this project, I implemented an ETL (Extract, Transform, Load) process to handle data from Kaggle, perform data transformation using Python and Pandas, and subsequently load the cleaned data into an SQL database. The final step involved using SQL queries to answer five business questions. The tech stack used for this project includes Python, SQL, and the Pandas library.

1. Extract
   
Data Source:

The data was sourced from Kaggle using the Kaggle API. Kaggle provides a vast repository of datasets across various domains, making it an ideal source for real-world data.
Steps:

API Integration: 

I set up API access by obtaining API credentials from Kaggle. This involved creating an API token on the Kaggle account and configuring it in the project.
Data Download: Using the Kaggle API, I downloaded the dataset directly into my Python environment. This streamlined the data acquisition process, ensuring I had the most recent version of the dataset.

2. Transform
   
Tools:

The transformation phase was executed using Python and the Pandas library, a powerful tool for data manipulation and analysis.

Steps:

Loading Data: 

The raw data was loaded into a Pandas DataFrame for preliminary inspection and cleaning.

Data Cleaning: 

This involved handling missing values, correcting data types, and removing or filling irrelevant or erroneous data.

Data Transformation: 

This included filtering specific columns, aggregating data, creating new derived columns, and normalizing values as needed to prepare the data for analysis.

3. Load
   
Tools:

The cleaned and transformed data was loaded into an SQL database. I used Microsoft SQL Server database management system to store the data.

Steps:

Database Connection: 

Establishing a connection to the SQL database using an appropriate Python library (e.g., SQLAlchemy, psycopg2).

Loading Data: 

Using the connection, the transformed DataFrame was loaded into an SQL table.

4. Analysis
   
Tools:

SQL was used to perform data analysis and answer business questions.

Steps:

Query Execution: I executed SQL queries on the loaded data to extract insights and answer the business questions.

Example Business Questions:

1)  Which product had the highest sales in the last quarter?
2)  Find top 10 Highest revenue generating products?
3)  Find top 5 Highest Selling Products in each region?
4)  Find month over month growth comparison for 2022 and 2023 sales eg Jan 2022 vs Jan 2023?
5)   Which sub_category had highest growth by profit in 2023 as compared to 2022?
