{{ 
    config(
        target_database='dbt-cloud',
        target_schema='dbt_shussain',
        materialized='table'
    ) 
}}
with 

source as (

    select * from {{ source('dbt-data', 'order_reviews') }}

),

renamed as (

    select
        review_id,
        order_id,
        review_score,
        review_comment_title,
        review_comment_message,
        review_creation_date,
        review_answer_timestamp

    from source

)

select * from renamed
