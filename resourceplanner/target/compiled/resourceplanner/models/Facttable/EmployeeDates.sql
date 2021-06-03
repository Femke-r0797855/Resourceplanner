

SELECT DISTINCT E.EmployeeID,E.Firstname, T.full_date
FROM oef-stage.TestRecoursePlanner.Time T
CROSS JOIN oef-stage.TestRecoursePlanner.Employee E
ORDER BY T.full_date