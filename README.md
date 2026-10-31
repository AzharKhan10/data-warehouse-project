# End-to-End SQL Server Data Warehouse

## Project Overview

This project demonstrates the development of an end-to-end Data Warehouse using Microsoft SQL Server. It integrates data from CRM and ERP source systems, processes it through a Medallion Architecture (Bronze, Silver, and Gold), and prepares structured data for analytical reporting.

The project focuses on SQL-based ETL workflows, data cleaning, transformation, validation, and dimensional modelling.

## Tech Stack

- **Database:** Microsoft SQL Server
- **Language:** T-SQL
- **Source Data:** CSV files
- **Data Modelling:** Draw.io
- **Documentation & Planning:** Notion

## Architecture

The Data Warehouse follows a three-layer Medallion Architecture:

- **Bronze:** Loads raw CRM and ERP data from six CSV files.
- **Silver:** Cleans, standardizes, validates, and transforms the raw data.
- **Gold:** Provides business-ready SQL views following a Star Schema.

For detailed architecture and data movement, see the documentation in the `docs/` folder.

## ETL Workflow

1. **Database Initialization:** Creates the `DataWarehouse` database and Bronze, Silver, and Gold schemas.
2. **Bronze Loading:** Uses `BULK INSERT` to load source CSV files into Bronze tables.
3. **Silver Transformation:** Applies data cleaning, standardization, data type conversions, and business rules.
4. **Gold Modelling:** Creates dimension and fact views for analytical use.
5. **Data Validation:** Uses SQL validation scripts to check the data across the three layers.

## Gold Layer – Star Schema

The Gold layer contains three analytical views:

- `gold.dim_customers`
- `gold.dim_products`
- `gold.fact_sales`

These views organize customer, product, and sales information for analytical queries.

See the Star Schema documentation in `docs/` for the data model and relationships.

## Key Features

- Medallion Architecture (Bronze, Silver, Gold).
- ETL pipelines implemented using stored procedures.
- Full-refresh loading strategy using `TRUNCATE` and `INSERT`.
- Data cleaning and standardization.
- SQL error handling using `TRY...CATCH`.
- Execution-time logging for loading procedures.
- Data validation scripts for all three layers.
- Dimensional modelling using a Star Schema.

## How to Run

1. Install Microsoft SQL Server and SQL Server Management Studio (SSMS).
2. Clone this repository.
3. Update the CSV file paths in the Bronze loading procedure to match your local environment.
4. Execute the database initialization script.
5. Execute the Bronze and Silver DDL scripts.
6. Run `bronze.load_bronze` to ingest the source data.
7. Run `silver.load_silver` to transform the data.
8. Execute the Gold view creation scripts.
9. Run the validation scripts from the `tests/` folder.

**Warning:** The database initialization script drops and recreates the existing `DataWarehouse` database. Back up any important data before running it.

## Documentation

Detailed project documentation is available in the `docs/` folder:

- Architecture Diagram
- Data Flow and Lineage
- Star Schema and Data Model

## Project Limitations

- Uses full-refresh loading rather than incremental loading.
- Does not maintain historical snapshots.
- Surrogate keys in Gold dimensions are generated dynamically using `ROW_NUMBER()`.

## Project Outcome

Built an end-to-end SQL Server Data Warehouse that integrates CRM and ERP data, implements a multi-layer ETL pipeline, and provides business-ready analytical views using dimensional modelling.
