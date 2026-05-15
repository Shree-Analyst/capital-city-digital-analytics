WITH source AS (
    SELECT *
    FROM `capital-city-digital-analytics`.`capital_city_dev_ss`.`stg_audiences`
),

-- Select SUB & CRP subscription categories & fan_id

sub_type AS (
    SELECT fan_id,
      subscription_category AS sub_type_1
    FROM `capital-city-digital-analytics`.`capital_city_dev_ss`.`stg_audiences`
    WHERE subscription_category IN ('SUB', 'CRP')
),

-- Add column to indicate fan status by joining source to sub_type

pop_type AS (
    SELECT *
    FROM source
    LEFT JOIN sub_type
      USING (fan_id)
),

-- Exclude SUB & CRP from subscription_category

sub_cat_excluded AS (
    SELECT *
    FROM pop_type
    WHERE subscription_category NOT IN ('SUB', 'CRP')
),

-- Augment sub_type_1 to include hospitality, premium (myclub, family).

augmented AS (
    SELECT *,
      CASE WHEN subscription_category IN ('MYCLUB', 'FAMILY') THEN 'premium'
        WHEN subscription_category IN ('HOSPITALITY') THEN 'hospitality'
        ELSE sub_type_1
        END AS subscription_type
    FROM sub_cat_excluded
),

-- Replace SUB & CRP with appropriate categories.

final AS (
    SELECT fan_id,
      subscription_category,
      start_date,
      end_date,
      CASE WHEN subscription_type = 'SUB' THEN 'individuel'
        WHEN subscription_type = 'CRP' THEN 'corporate'
        ELSE subscription_type
        END AS subscription_type
    FROM augmented
)

SELECT *
FROM final