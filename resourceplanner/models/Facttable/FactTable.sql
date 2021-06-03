


{{ config(materialized='table') }}


SELECT
  T.id,
  TD.ID AS ProjectID,
  TD.EmployeeID,
  TD.CompanyID,
  TD.CustomerID,
  T.PM_AM,
  T.full_date,
  T.day_name,
  CASE
    WHEN T.day_name = "Monday" THEN IF (TD.Monday = 'Available', '0', IF (TD.Monday = 'Full', '0,5', IF (PM_AM = TD.Monday, '0,5', '0') ))
    WHEN T.day_name = "Tuesday" THEN IF (TD.Tuesday = 'Available', '0', IF (TD.Tuesday = 'Full', '0,5', IF (PM_AM = TD.Tuesday, '0,5', '0') ))
    WHEN T.day_name = "Wednesday" THEN IF (TD.Wednesday = 'Available', '0', IF (TD.Wednesday = 'Full', '0,5', IF (PM_AM = TD.Wednesday, '0,5', '0') ))
    WHEN T.day_name = "Thursday" THEN IF (TD.Thursday = 'Available', '0', IF (TD.Thursday = 'Full', '0,5', IF (PM_AM = TD.Thursday, '0,5', '0') ))
    WHEN T.day_name = "Friday" THEN IF (TD.Friday = 'Available', '0', IF (TD.Friday  = 'Full', '0,5', IF (PM_AM = TD.Friday , '0,5', '0') ))
  ELSE
  '0'
END
  AS Is_Booked
FROM
  `oef-stage.TestRecoursePlanner.Time` T
CROSS JOIN
  `oef-stage.TestRecoursePlanner.trydates` TD

WHERE T.full_Date  BETWEEN TD.DateStart
  AND TD.DateEnd
ORDER BY
  T.full_date 
