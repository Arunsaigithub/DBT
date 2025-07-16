{% snapshot snapshot_pat %}
    {{
        config(
            target_schema='snapshot',
            unique_key='patient_id',
            tags = 'patients',
            strategy='check',
                check_cols=['first_name','last_name','gender','date_of_birth','contact_number',
                           'address','registration_date','insurance_provider','insurance_number',
                           'email','sk_patient']
        )
    }}

select * from {{ ref('trans_patients') }}
{% endsnapshot %}