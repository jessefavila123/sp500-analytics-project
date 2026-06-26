with financials as (
    select * from {{ ref('stg_sp500_financials') }}
),

sectors as (
    select * from {{ ref('stg_sp500_sectors') }}
)

select
    s.SYMBOL,
    s.SECURITY,
    s.GICS_SECTOR,
    s.GICS_SUB_INDUSTRY,
    s.HEADQUARTERS_LOCATION,
    f.MARKET_CAPITALIZATION,
    f.INCOME_TTM,
    f.REVENUE_TTM,

from sectors s
left join financials f
    on s.SYMBOL = f.COMPANY