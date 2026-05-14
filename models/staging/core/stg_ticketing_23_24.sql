WITH source AS (
    SELECT *
    FROM {{ source('capital_city_digital_analytics', 'ticketing_23_24') }}
),

renamed AS (
    SELECT Uuid AS fan_id,
      {{ adapter.quote("Country _Aligned_")}} AS country,
      {{ adapter.quote("Competition")}} AS competition,
      {{ adapter.quote("Match")}} AS match,
      {{ adapter.quote("Sale Date")}} AS purchased_on,
      {{ adapter.quote("Order Num")}} AS order_id,
      Contingent AS contingent,
      {{ adapter.quote("Seat Category")}} AS seat_category,
      {{ adapter.quote("Ticket Num")}} AS ticket_number,
      {{ adapter.quote("Primary Price")}} AS primary_price,
      {{ adapter.quote("Secondary Price")}} AS secondary_price,
      {{ adapter.quote("Entry Date")}} AS entry_timestamp
    FROM source
),

final AS (
    SELECT *,
      '23_24' AS season
    FROM renamed
)

SELECT *
FROM final