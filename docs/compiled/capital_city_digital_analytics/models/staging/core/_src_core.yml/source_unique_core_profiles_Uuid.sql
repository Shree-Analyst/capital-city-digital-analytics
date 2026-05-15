
    
    

with dbt_test__target as (

  select Uuid as unique_field
  from `CCFC-case-study-490221`.`core`.`profiles`
  where Uuid is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


