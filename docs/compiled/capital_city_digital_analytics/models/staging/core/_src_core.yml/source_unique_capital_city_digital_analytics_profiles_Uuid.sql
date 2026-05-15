
    
    

with dbt_test__target as (

  select Uuid as unique_field
  from `capital-city-digital-analytics`.`capital_city_digital_analytics`.`profiles`
  where Uuid is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


