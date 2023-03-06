{{ config (
            materialized='view'
        )
}}

WITH source_titles AS(

    SELECT * FROM {{source('av_step3_data', 'titles')}}

),

final AS (

      SELECT 
            CAST(title_id AS VARCHAR(16)) AS title_id,
            CAST(title AS VARCHAR(48)) AS role
      FROM source_titles
  
)

SELECT * FROM final