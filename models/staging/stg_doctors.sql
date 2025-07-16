{{
    config(
        materialized='table',
        schema = 'stage',
        tags = 'doctors'
    )
}}
select * from {{ source('src_hospital', 'doctors') }}  
  