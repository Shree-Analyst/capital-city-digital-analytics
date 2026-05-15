
    
    

with dbt_test__target as (

  select N_Billet as unique_field
  from `CCFC-case-study-490221`.`core`.`ticketing_23_24`
  where N_Billet is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


