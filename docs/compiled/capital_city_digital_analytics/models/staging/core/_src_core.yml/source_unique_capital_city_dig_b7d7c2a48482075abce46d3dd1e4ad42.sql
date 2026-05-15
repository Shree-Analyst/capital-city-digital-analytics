
    
    

with dbt_test__target as (

  select `Ticket Num` as unique_field
  from `capital-city-digital-analytics`.`capital_city_digital_analytics`.`ticketing_23_24`
  where `Ticket Num` is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


