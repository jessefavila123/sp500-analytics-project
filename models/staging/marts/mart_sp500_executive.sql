with joined as (
    select * from {{ ref('int_sp500_joined') }}
)

select
    SYMBOL,
    SECURITY,
    GICS_SECTOR,
    GICS_SUB_INDUSTRY,
    HEADQUARTERS_LOCATION,
    MARKET_CAPITALIZATION,
    REVENUE_TTM,
    INCOME_TTM,
    
    case
        when REVENUE_TTM > 0
        then round((INCOME_TTM / REVENUE_TTM) * 100, 2)
        else null
    end as PROFIT_MARGIN_PCT,

    case
        when MARKET_CAPITALIZATION >= 200000000000 then 'Mega Cap'
        when MARKET_CAPITALIZATION >= 10000000000 then 'Large Cap'
        when MARKET_CAPITALIZATION >= 2000000000 then 'Mid Cap'
        else 'Small Cap'
    end as MARKET_CAP_CATEGORY

from joined