{{
    config(
        schema='Transformation',
        tags = 'doctors'
    )
}}
select
    coalesce(doctor_id,'unknown') as doctor_id,
    coalesce(first_name,'unknown') as first_name,
    coalesce(last_name,'unknown') as last_name,
    coalesce(specialization,'unknown') as specialization,
    case
        when LENGTH(phone_number) = 10 then phone_number
        else 0
    end as phone_number,
    CASE 
        WHEN COALESCE(years_experience, 0) = 1 THEN '1 year'
        ELSE COALESCE(years_experience, 0)::STRING || ' years'
    END AS years_experience,
    coalesce(hospital_branch,'unknown') as hospital_branch,
    case
        when email ilike '%@hospital.com' then email
        else 'Incorrect Email'
    end as email,
    current_timestamp() as last_updated_date
from {{ ref('stg_doctors') }}