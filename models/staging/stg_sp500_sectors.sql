with source as (
    select * from {{ source('raw', 'sp500_companies_with_sectors') }}
)

select
    SYMBOL,
    SECURITY,
    GICS_SECTOR,
    GICS_SUB_INDUSTRY,
    HEADQUARTERS_LOCATION,
    DATE_ADDED

from source