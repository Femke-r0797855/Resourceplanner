/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/



with source_data as (

    select 1 as id
    union all
    select null as id

)

select M.ID, E.EmployeeID, CU.CustomerID,CO.CompanyID
from oef-stage.TestRecoursePlanner.MainData M
INNER JOIN oef-stage.TestRecoursePlanner.Employee E
ON M.Employee = E.Firstname
INNER JOIN oef-stage.TestRecoursePlanner.Customer CU
ON M.Customer = CU.Customername
INNER JOIN oef-stage.TestRecoursePlanner.Company CO
ON M.Company = CO.Companyname
ORDER BY M.ID

/*
    Uncomment the line below to remove records with null `id` values
*/