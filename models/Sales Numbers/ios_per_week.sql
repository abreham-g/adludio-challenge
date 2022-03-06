
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (
    select * from {{ref('transformed_sales_number_data')}}
)

select AVG(deal_iosent_count)*7 as avg_iosent_count, year_quarter
from source_data
group by year_quarter
ORDER BY year_quarter

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
