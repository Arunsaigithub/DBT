select *
from {{ ref("Dim_doctors") }}
where phone_number is not null and not regexp_like(phone_number, '^\+?[0-9]{10,15}$')


