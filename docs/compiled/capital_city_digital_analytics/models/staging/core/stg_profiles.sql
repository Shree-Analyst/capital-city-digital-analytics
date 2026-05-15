WITH source AS (
    SELECT *
    FROM `capital-city-digital-analytics`.`capital_city_digital_analytics`.`profiles`
),

renamed AS (
    SELECT Uuid AS fan_id,
      'Gender' AS gender,
      `Country Code` AS country_code,
      `Date of birth` AS birthday,
      `Optin: Partners` AS consent_partners,
      `Optin: CC` AS consent_CC
    FROM source
),

final AS (
    SELECT *
    FROM renamed
)

SELECT *
FROM final