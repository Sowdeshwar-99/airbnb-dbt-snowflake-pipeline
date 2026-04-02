## Airbnb Data Engineering Pipeline (Snowflake + dbt + AWS S3)

### Overview
This project implements a scalable end-to-end ELT pipeline for Airbnb data using AWS S3, Snowflake, and dbt.  

The pipeline transforms raw data into analytics-ready datasets using a Medallion architecture (Bronze → Silver → Gold) with support for incremental processing, reusable transformations, and historical tracking.


## Tech Stack

- Storage: AWS S3  
- Data Warehouse: Snowflake  
- Transformation: dbt (SQL + Jinja)  
- Version Control: Git  

## Architecture

Source Data (CSV) → AWS S3 → Snowflake (Staging) → Bronze Layer → Silver Layer → Gold Layer
                                                           ↓              ↓           ↓
                                                      Raw Tables    Cleaned Data   Analytics

## Data Pipeline Design

### Bronze Layer
- Ingests raw data from staging tables  
- Implements incremental loading using timestamps  
- Preserves raw structure for traceability  


### Silver Layer
- Cleans and standardises datasets  
- Applies business logic transformations  
- Uses incremental models with upsert logic  
- Implements reusable transformations using dbt macros:
  - Price categorisation  
  - Booking value calculation  
  - String formatting  

### Gold Layer

#### Metadata-Driven OBT
- Built using Jinja-based configuration  
- Dynamically generates joins using metadata  
- Allows new tables to be added without modifying SQL logic  

This enables a scalable and maintainable transformation pipeline.


#### Data Modelling
- Fact and dimension tables based on star schema  
- Optimised for analytical queries  

#### Ephemeral Models
- Used for intermediate transformations  
- Avoid unnecessary storage by computing at runtime  


## Incremental Processing

- Implemented across Bronze and Silver layers  
- Processes only new or updated records  
- Improves performance and reduces compute cost  

## Reusable Transformations (Macros)

Custom dbt macros are used to standardise logic:

- Numeric calculations (total booking amount)  
- Business rules (price categorisation)  
- String cleaning  

This improves modularity, consistency, and maintainability.

## Slowly Changing Dimensions (SCD Type 2)

- Implemented using dbt snapshots  
- Tracks historical changes for bookings, hosts, and listings  
- Uses timestamp-based versioning and validity ranges  

## Key Features

- End-to-end ELT pipeline (S3 → Snowflake → dbt)  
- Incremental data processing  
- Metadata-driven dynamic SQL generation  
- Modular and reusable transformations  
- Historical data tracking (SCD Type 2)  
- Clear separation of data layers  

## Running the Project

```bash
dbt debug
dbt run
dbt snapshot
dbt test
dbt build
```
## Key Learnings

- Designing scalable and modular data pipelines
- Implementing incremental processing in dbt
- Building config-driven transformations using Jinja
- Applying Medallion architecture and data modelling principles
- Managing historical data with SCD Type 2
