

  create or replace table `oef-stage`.`TestRecoursePlanner`.`EmployeeDates`
  
  
  OPTIONS()
  as (
    

SELECT DISTINCT E.EmployeeID,E.Firstname, T.full_date
FROM oef-stage.TestRecoursePlanner.Time T
CROSS JOIN oef-stage.TestRecoursePlanner.Employee E
ORDER BY T.full_date
  );
    