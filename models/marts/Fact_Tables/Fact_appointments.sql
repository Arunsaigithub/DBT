{{
    config(
        materialized = 'table',
        schema='Fact_table'
    )
}}

select
    a.SK_appointment as appointment_key,
    p.SK_Patient as patient_key,
    d.SK_doc as doctor_key,
    appointment_date,
    appointment_time,
    reason_for_visit,
    status,
    from {{ ref('trans_appointments') }} a
    join 
    {{ ref('Dim_patients') }} p 
    on a.patient_id = p.patient_id
    join
    {{ ref('Dim_doctors') }} d 
    on d.doctor_id = a.doctor_id


  