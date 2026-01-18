{{
  config(
    materialized='incremental',
    unique_key='BOOKING_ID',
    on_schema_change='sync_all_columns'
  )
}}



SELECT 
    BOOKING_ID,
    LISTING_ID,
    BOOKING_DATE,
    {{ multiply('NIGHTS_BOOKED', 'BOOKING_AMOUNT',2) }} AS TOTAL_AMOUNT,
    SERVICE_FEE, 
    CLEANING_FEE, 
    BOOKING_STATUS,
    CREATED_AT
FROM 
    {{ ref('bronze_bookings') }}