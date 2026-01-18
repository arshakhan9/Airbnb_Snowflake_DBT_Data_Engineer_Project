{{ config(
    severity = 'warning',
    ) }}
Select 
    1
from
    {{source('staging','bookings')}}
WHERE
    BOOKING_ID < 200
