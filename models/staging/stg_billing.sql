{{
    config(
        materialized='table',
        schema = 'stage',
        tags = 'billing'
    )
}}


select * from {{ source('src_hospital', 'BILLINGS') }}