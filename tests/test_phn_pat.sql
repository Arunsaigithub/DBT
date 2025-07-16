select *
from {{ ref('Dim_patients') }}
where contact_number is not null and not regexp_like(contact_number, '^\+?[0-9]{10,15}$')