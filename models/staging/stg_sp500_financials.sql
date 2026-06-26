with source as (
    select * from {{ source('raw', 'sp500_financials_raw') }}
)

select
    COMPANY,
    MAJOR_INDEX_MEMBERSHIP,
    
    case 
        when MARKET_CAPITALIZATION like '%B' 
        then cast(replace(MARKET_CAPITALIZATION,'B','') as float) * 1000000000
        when MARKET_CAPITALIZATION like '%M'
        then cast(replace(MARKET_CAPITALIZATION,'M','') as float) * 1000000
        else null
    end as MARKET_CAPITALIZATION,

    case 
        when INCOME_TTM_ like '%B' 
        then cast(replace(INCOME_TTM_,'B','') as float) * 1000000000
        when INCOME_TTM_ like '%M'
        then cast(replace(INCOME_TTM_,'M','') as float) * 1000000
        else null
    end as INCOME_TTM,

    case 
        when REVENUE_TTM_ like '%B' 
        then cast(replace(REVENUE_TTM_,'B','') as float) * 1000000000
        when REVENUE_TTM_ like '%M'
        then cast(replace(REVENUE_TTM_,'M','') as float) * 1000000
        else null
    end as REVENUE_TTM

from source