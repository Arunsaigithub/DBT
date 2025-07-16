{{
    config(
        materialized='incremental',
        unique_key='doctor_id',
        schema = 'Dim_tables',
        tags = 'doctors'
    )
}}

select * from {{ ref('trans_doctors') }}