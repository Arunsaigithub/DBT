{{
    config(
        materialized='incremental',
        unique_key='doctor_id',
        schema = 'Dim_tables'
    )
}}

select * from {{ ref('trans_doctors') }}