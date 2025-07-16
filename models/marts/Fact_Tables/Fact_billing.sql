{{
    config(
        materialized='table',
        schema = 'Fact_table'
    )
}}

select 
    b.SK_bill as bill_key,
    p.SK_Patient as patient_key,
    t.SK_Treatment as treatment_key,
    bill_date,
    amount,
    payment_method,
    payment_status
    from {{ ref('trans_billing') }} b
    join {{ ref('Dim_patients') }} p 
    on b.patient_id = p.patient_id
    join {{ ref('trans_treatment') }} t 
    on b.treatment_id = t.treatment_id