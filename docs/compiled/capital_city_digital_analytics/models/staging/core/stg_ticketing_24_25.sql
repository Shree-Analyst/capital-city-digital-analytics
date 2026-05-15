WITH source AS (
    SELECT *
    FROM `capital-city-digital-analytics`.`capital_city_digital_analytics`.`ticketing_24_25`
),

renamed AS (
    SELECT Uuid AS fan_id,
      `Country _Aligned_` AS country,
      `Competition` AS competition,
      `Match` AS match,
      `Sale Date` AS purchased_on,
      `Order Num` AS order_id,
      Contingent AS contingent,
      `Seat Category` AS seat_category,
      `Ticket Num` AS ticket_number,
      `Primary Price` AS primary_price,
      `Secondary Price` AS secondary_price,
      `Entry Date` AS entry_timestamp
    FROM source
),

final AS (
    SELECT *,
      '24_25' AS season
    FROM renamed
)

SELECT *
FROM final