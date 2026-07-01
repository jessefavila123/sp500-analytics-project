# S&P 500 Executive Analytics Dashboard

## Overview
End-to-end data analytics pipeline and executive dashboard built on 
S&P 500 financial data. This project demonstrates a full modern data 
stack — from raw data ingestion through cloud transformation to 
business intelligence visualization.

## Business Questions Answered
- Which sectors dominate the S&P 500 by total market capitalization?
- Which sectors generate the highest average profit margins?
- How is market cap distributed across company size categories?
- Who are the top 10 S&P 500 companies by revenue?

## Tech Stack
| Tool | Purpose |
|------|---------|
| Snowflake | Cloud data warehouse |
| dbt Cloud | Data transformation and modeling |
| Power BI Desktop | Business intelligence dashboard |
| GitHub | Version control |

## Pipeline Architecture
Kaggle CSV → Snowflake (RAW) → dbt Staging → dbt Intermediate → dbt Marts → Power BI

## Data Sources
- S&P 500 Companies Financial Description (Kaggle)
- S&P 500 Companies List with Sectors (Kaggle)

## dbt Model Structure
models/
├── staging/
│   ├── sources.yml
│   ├── stg_sp500_financials.sql    # Cleans raw financial data, converts B/M notation to FLOAT
│   └── stg_sp500_sectors.sql       # Cleans sector and company reference data
├── intermediate/
│   └── int_sp500_joined.sql        # Joins financials to sectors on ticker symbol
└── marts/
└── mart_sp500_executive.sql    # Final model with profit margin % and market cap categorization
## Key Transformations
- Converted financial string values (e.g. "41.05B", "127.00M") to FLOAT using SQL CASE statements
- Joined two independent datasets on ticker symbol
- Calculated profit margin percentage (Income / Revenue)
- Categorized companies into Mega Cap / Large Cap / Mid Cap / Small Cap tiers

<img width="749" height="148" alt="DAG" src="https://github.com/user-attachments/assets/8179d41b-3a28-4b2b-a0a7-6b476902d747" />

## Dashboard Highlights
- **503** S&P 500 companies analyzed
- **$34.2T** total index market cap
- **13.90%** average profit margin across the index
- Information Technology dominates market cap at $8T+
- Real Estate leads all sectors in average profit margin (~28%)
- Mega Cap companies hold 53.95% of total S&P 500 market value

<img width="583" height="326" alt="Screenshot 2026-07-01 132403" src="https://github.com/user-attachments/assets/74d8255d-cbf9-4deb-9647-4acaeac3e179" />

## Data Notes
- ~441 of 503 companies have complete financial data
- Profit margin calculated only for companies with both income and revenue data
- Data sourced from Kaggle static datasets; pipeline architecture mirrors production-grade ELT workflows
- Scheduled dbt Cloud jobs configured to run daily, mimicking automated pipeline refresh

## Setup
1. Clone this repository
2. Load raw CSVs into Snowflake RAW schema
3. Connect dbt Cloud to Snowflake and GitHub
4. Run `dbt run` to execute all models
5. Connect Power BI Desktop to Snowflake `DBT_JFAVILA` schema
