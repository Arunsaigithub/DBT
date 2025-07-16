select * from {{ source('src_hospital', 'doctors') }}
