# SQL Database Projects Repository

Welcome to the SQL Database Projects Repository! This repository houses a collection of SQL scripts and datasets for various data analysis and database management tasks. Each project is self-contained and demonstrates different aspects of SQL usage, from data definition and manipulation to complex querying and analysis.

## Projects

This repository includes the following projects:

1.  [Starbucks Store Analysis](#starbucks-store-analysis)
2.  [Hospital Information System](#hospital-information-system)
3.  [HR Management System](#hr-management-system)

---

## Starbucks Store Analysis

This project focuses on analyzing a dataset of Starbucks store locations worldwide. The SQL script (`Starbucks.sql`) performs various data cleaning, transformation, and analytical queries to extract insights from the `Starbucks_dataset.csv` file.

**Files:**

*   `Starbucks.sql`: The SQL script containing queries for data manipulation and analysis.
*   `Starbucks_dataset.csv`: The dataset with information about Starbucks stores, including brand, store number, name, ownership type, city, state/province, and country.

**Key Analyses and Operations:**

*   **Data Cleaning:**
    *   Renaming columns for consistency (e.g., `store_name` to `Store_Name`).
    *   Dropping irrelevant columns (e.g., `Street Address`, `Postcode`, `Phone Number`).
*   **Exploratory Data Analysis (EDA):**
    *   Identifying distinct ownership types and their counts.
    *   Determining the number of stores under each ownership type.
    *   Listing unique brands and the number of stores per brand.
*   **Focused Analysis on Starbucks Brand:**
    *   Counting Starbucks stores by country and categorizing them based on store density (Very High, High, Moderate, Adequate, Low, Scarce).
    *   Calculating the total number of Starbucks stores in the United States.
    *   Identifying the top 10 and bottom 15 cities in the US with the highest and lowest numbers of Starbucks stores, respectively.

**How to Use:**

1.  **Set up a database environment:** Use a SQL database system like MySQL, PostgreSQL, or SQL Server.
2.  **Create a database:** For example, `superstore` (as used in the script).
3.  **Import the data:** Create a table (e.g., `starbucks_directory`) and import the data from `Starbucks_dataset.csv` into this table. The script assumes the table is named `starbucks_directory`.
    *   Example table structure (deduced from the script):
        ```sql
        CREATE TABLE starbucks_directory (
            Brand VARCHAR(255),
            Store_Number VARCHAR(255),
            Store_Name VARCHAR(255),
            Ownership_Type VARCHAR(255),
            Street_Address VARCHAR(255), -- Will be dropped
            City VARCHAR(255),
            State_Province VARCHAR(255), -- Will be renamed to State
            Country VARCHAR(255),
            Postcode VARCHAR(255),       -- Will be dropped
            Phone_Number VARCHAR(255),   -- Will be dropped
            Timezone VARCHAR(255),       -- Will be dropped
            Longitude VARCHAR(255),      -- Will be dropped
            Latitude VARCHAR(255)        -- Will be dropped
        );
        ```
4.  **Run the SQL script:** Execute the queries in `Starbucks.sql` against your database to perform the analysis. You may need to adapt the script slightly based on the specific SQL dialect of your chosen database system.

This project is a good example of how SQL can be used for data cleaning, initial exploration, and answering specific business questions using a real-world dataset. Keywords: Starbucks data analysis, SQL for data analytics, store location analysis, customer distribution, market analysis.

---

## Hospital Information System

This project provides a basic SQL schema for a Hospital Information System. The `hospitalIs.sql` script defines the necessary tables, establishes relationships between them using foreign keys, and inserts sample data to illustrate the system's structure.

**Files:**

*   `hospitalIs.sql`: The SQL script containing Data Definition Language (DDL) for creating tables and Data Manipulation Language (DML) for inserting sample data.

**Database Schema:**

The system consists of the following tables:

*   **`WARDS`**: Stores information about hospital wards.
    *   `WARDID` (INT, Primary Key): Unique identifier for the ward.
    *   `WARDNAME` (VARCHAR): Name of the ward (e.g., "Medical Ward", "Surgical Ward").

*   **`NURSES`**: Stores information about nurses.
    *   `NURSEID` (INT, Primary Key): Unique identifier for the nurse.
    *   `NURSENAME` (VARCHAR): Name of the nurse.
    *   `WARDID` (INT, Foreign Key): References `WARDID` in the `WARDS` table, indicating the ward a nurse is assigned to.

*   **`DRUGS`**: Stores information about drugs.
    *   `DRUGID` (INT, Primary Key): Unique identifier for the drug.
    *   `DRUGNAME` (VARCHAR): Name of the drug (e.g., "Paracetamol", "Ibuprofen").

*   **`PATIENTS`**: Stores information about patients.
    *   `PID` (INT, Primary Key): Unique identifier for the patient.
    *   `NAME` (VARCHAR): Name of the patient.
    *   `DISTRICT` (VARCHAR): District where the patient resides.
    *   `DRUGID` (INT, Foreign Key): References `DRUGID` in the `DRUGS` table, indicating the drug prescribed to the patient.
    *   `NURSED` (INT, Foreign Key): References `NURSEID` in the `NURSES` table, indicating the nurse attending to the patient.
    *   `WARDID` (INT, Foreign Key): References `WARDID` in the `WARDS` table, indicating the ward the patient is admitted to.

**Relationships:**

*   A `PATIENT` is assigned a `DRUG`, attended by a `NURSE`, and admitted to a `WARD`.
*   A `NURSE` is assigned to a `WARD`.

**How to Use:**

1.  **Set up a database environment:** Use a SQL database system that supports foreign key constraints (e.g., MySQL, PostgreSQL, SQL Server).
2.  **Execute the SQL script:** Run the `hospitalIs.sql` script in your database environment. This will:
    *   Create the `WARDS`, `NURSES`, `DRUGS`, and `PATIENTS` tables with the specified schema and relationships.
    *   Insert sample data into each table.
    *   Run a sample query to generate a report showing patient names, their prescribed drugs, attending nurses, and ward names.

This project serves as a foundational example of relational database design for a healthcare context. It demonstrates table creation, primary and foreign key definitions, and basic data insertion and querying. Keywords: hospital database schema, SQL for healthcare, patient management system SQL, relational database design example, ERD SQL.

---

## HR Management System

This project demonstrates SQL queries for managing and analyzing Human Resources data. It uses two CSV files, `employees.csv` and `offices.csv`, which are presumably imported into a database. The `hr.sql` script then performs various queries to retrieve and analyze employee and office information.

**Files:**

*   `hr.sql`: The SQL script containing queries for HR data analysis.
*   `employees.csv`: Dataset with employee information (e.g., ID, name, job title, salary, office ID).
*   `offices.csv`: Dataset with office information (e.g., office ID, address, city, state).

**Key Analyses and Operations:**

The `hr.sql` script (assuming the data from `employees.csv` and `offices.csv` is loaded into `employees` and `offices` tables respectively) performs operations such as:

*   Listing all employees with their full name, job title, and salary.
*   Counting the total number of employees.
*   Counting the total number of distinct offices.
*   Listing distinct office locations by state and city.
*   **Joining Data:**
    *   Combining `employees` and `offices` tables to display employee details along with their office address, city, and state, ordered by salary.
*   **Advanced Querying with CTEs (Common Table Expressions):**
    *   Filtering employees located in a specific state (e.g., 'NY') and ordering them by salary.
    *   Calculating aggregate salary statistics: highest salary, lowest salary, mean salary, and total salary expenditure.
    *   Counting the number of employees in each city.

**How to Use:**

1.  **Set up a database environment:** Use a SQL database system like MySQL, PostgreSQL, or SQL Server.
2.  **Create a database:** For example, `sql_hr` (as used in the script).
3.  **Create tables and import data:**
    *   Create an `employees` table and import data from `employees.csv`.
        *   Deduced schema for `employees`:
            ```sql
            CREATE TABLE employees (
                employee_id INT PRIMARY KEY,
                first_name VARCHAR(255),
                last_name VARCHAR(255),
                job_title VARCHAR(255),
                salary DECIMAL,
                reports_to INT,
                office_id INT
            );
            ```
    *   Create an `offices` table and import data from `offices.csv`.
        *   Deduced schema for `offices`:
            ```sql
            CREATE TABLE offices (
                office_id INT PRIMARY KEY,
                address VARCHAR(255),
                city VARCHAR(255),
                state VARCHAR(255)
            );
            ```
    *   Ensure `employees.office_id` can be used to join with `offices.office_id`.
4.  **Run the SQL script:** Execute the queries in `hr.sql` against your database. You might need to adjust table and column names if they differ from what the script expects.

This project illustrates practical SQL queries for HR data analysis, including joins, aggregate functions, and CTEs, providing insights into employee demographics, salary distributions, and office locations. Keywords: HR SQL queries, employee database analysis, SQL for human resources, office data management, salary analysis SQL.

---

## Contributing

Contributions to this repository are welcome! If you have suggestions for improvements, new analyses, or additional datasets, please feel free to:

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Make your changes.
4.  Submit a pull request with a clear description of your changes.

Alternatively, you can open an issue to discuss potential changes or report bugs.

## License

This project is licensed under the terms of the [LICENSE](LICENSE) file. Please review the license for more details on usage and distribution.

## Contact

For any questions, feedback, or if you'd like to discuss these projects further, please open an issue in this repository.
(If you have specific contact information you'd like to add, please replace the line above.)
