{{
    config(
        materialized='incremental',
        unique_key='doctor_id',
        schema = 'Dim_tables',
        tags = 'doctors'
    )
}}

select 
    concat('D_0', row_number() over (order by doctor_id)) as SK_doc,
    doctor_id,
    first_name,
    last_name,
    specialization,
    phone_number,
    years_experience,
    hospital_branch,
    email,
    last_updated_date
from {{ ref('trans_doctors') }}