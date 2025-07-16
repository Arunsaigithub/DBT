{{
    config(
        materialized = 'table',
        schema='Dim_tables',
        tags = 'patients'
       
    )
}}
select 
    SK_Patient,
    patient_id,
    first_name,
    last_name,
    gender,
    date_of_birth,
    contact_number,
    address,
    insurance_provider,
    insurance_number,
    email,
    registration_date,
    DBT_VALID_FROM as effective_start_date,
    DBT_VALID_TO as effective_end_date,
    case
        when DBT_VALID_TO is null then 'Y'
        else 'N'
    end as is_current
from {{ ref('snapshot_pat') }}