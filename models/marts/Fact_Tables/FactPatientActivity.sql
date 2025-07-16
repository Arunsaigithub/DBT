{{
    config(
        materialized='table',
        schema = 'Fact_table' 
    )
}}

with appointment as ( 
    select
    patient_key,
    count(*) as total_appointments,
    sum(case when status = 'No-show' then 1 end)as no_show_count,
    max (appointment_date) as first_appointment_date,
    min (appointment_date) as last_appointment_date
    from {{ ref('Fact_appointments') }}
    group by patient_key
),
billing as (
    select
    patient_key,
    sum(amount) as total_billed,
    sum(case when payment_status = 'Paid' then amount else 0 end) as total_paid
    from {{ ref('Fact_billing') }}
    group by patient_key 
)

select  
    coalesce(a.patient_key,b.patient_key) as patient_key,
    coalesce(total_appointments, 0) as total_appointments,
    coalesce(total_billed, 0) as total_billed,
    coalesce(total_paid, 0) as total_paid,
    coalesce(no_show_count,0) as no_show_count,
    first_appointment_date,
    last_appointment_date
    from appointment a
    full outer join billing b on 
    a.patient_key = b.patient_key