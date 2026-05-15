
    
    

with dbt_test__target as (

  select `Numéro de Billet` as unique_field
  from `CCFC-case-study-490221`.`core`.`ticketing_24_25`
  where `Numéro de Billet` is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


