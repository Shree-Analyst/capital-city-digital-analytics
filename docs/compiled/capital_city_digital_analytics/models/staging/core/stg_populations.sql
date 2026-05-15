WITH source AS (
    SELECT *
    FROM `CCFC-case-study-490221`.`core`.`populations`
),

renamed AS (
    SELECT `Uuid` AS fan_id,
      Population AS subscription_category,
      `Max_ Date d'activation` AS start_date,
      `Max_ Date de désactivation` AS end_date
    FROM source
),

final AS (
    SELECT *
    FROM renamed
)

SELECT *
FROM final