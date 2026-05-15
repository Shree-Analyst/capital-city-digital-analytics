WITH source AS (
    SELECT *
    FROM `capital-city-digital-analytics`.`capital_city_digital_analytics`.`audiences`
),

renamed AS (
    SELECT `Uuid` AS fan_id,
      Category AS subscription_category,
      `Max_ Activation Date` AS start_date,
      `Max_ Deactivation Date` AS end_date
    FROM source
),

final AS (
    SELECT *
    FROM renamed
)

SELECT *
FROM final