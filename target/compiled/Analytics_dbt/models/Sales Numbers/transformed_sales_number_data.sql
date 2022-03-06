/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/



with source_data as (

    select *, DATE_PART('week', to_date("Deal_created_at", 'DD/MM/YYYY')) as week,
    DATE_PART('year', to_date("Deal_created_at", 'DD/MM/YYYY')) as year,
    EXTRACT (QUARTER FROM to_date("Deal_created_at", 'DD/MM/YYYY')) as quarter

    from sales_table 

)

select "Deal_id" as id, "Deal_created_at" as Deal_created_at,
"Deal_Value" as deal_value, "Deal_Stage" as deal_stage,

    case when "Deal_Stage" = 'Meeting' then 1 else 0 end as deal_meeting_count,
    case when "Deal_Stage" = 'IO Sent' then 1 else 0 end as deal_iosent_count,
    case when "Deal_Stage" = 'RFP' then 1 else 0 end  as deal_rfp_count,
"Deal _Status" as deal_status, "Deal_Email_messages_count" as deal_email_messages_count,
"Deal_Total_activities" as deal_total_activities, "Deal_Currency" as deal_currency,
"Deal_Region" as deal_region, week,quarter, year,
CONCAT  (year, '_', week) AS year_week,
CONCAT  (year, '_', quarter) AS year_quarter
from source_data

ORDER BY year_week

 

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null