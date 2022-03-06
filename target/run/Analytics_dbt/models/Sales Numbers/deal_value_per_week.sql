

  create  table "adludio"."public"."deal_value_per_week__dbt_tmp"
  as (
    /*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/



with source_data as (
    select * from "adludio"."public"."transformed_sales_number_data"
)

select AVG(deal_value) as avg_deal_value, week
from source_data
group by week
ORDER BY week 

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
  );