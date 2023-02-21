{{ config(materialized='view') }}


SELECT *
FROM {{ source('staging', 'fhv_tripdata') }}
-- dbt var: is_test_run
{% if var('is_test_run', default=true) %}
    
    LIMIT 100

{% endif %}