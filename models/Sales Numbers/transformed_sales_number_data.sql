
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

    select *, DATE_PART('week', to_date("Deal_created_at", 'DD/MM/YYYY')) as week from sales_table
)

select "Deal_id" as id, "Deal_created_at" as Deal_created_at,
"Deal_Value" as deal_value, "Deal_Stage" as deal_Stage,
"Deal _Status" as deal_status, "Deal_Email_messages_count" as deal_email_messages_count,
"Deal_Total_activities" as deal_total_activities, "Deal_Currency" as deal_currency,
"Deal_Region" as deal_region, week
from source_data
ORDER BY week
 

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
