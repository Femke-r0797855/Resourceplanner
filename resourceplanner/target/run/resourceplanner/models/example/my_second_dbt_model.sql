

  create or replace view `oef-stage`.`TestRecoursePlanner`.`my_second_dbt_model`
  OPTIONS()
  as -- Use the `ref` function to select from other models

select *
from `oef-stage`.`TestRecoursePlanner`.`my_first_dbt_model`;

