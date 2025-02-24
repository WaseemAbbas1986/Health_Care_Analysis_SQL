create database healthcare
use healthcare
select * from healthdata

-- find the total number of patients who are still admitted in the hospital.
select count([Patient_ID]) as Total_Count
from healthdata
where [Discharge_Date] is NULL

-- Find the average age of all admitted patients
select avg(Age) as Avg_Age
from healthdata
where Discharge_Date is null

-- Find the total number of patients for each diseas
select[Diagnosis], count([Patient_ID]) as Total_Count
from healthdata
group by [Diagnosis]
order by Total_Count desc

-- Find the total revenue generated from all discharged patients.
-- Assume there is a column named Billing_Amount that stores the
-- amount billed to each patient
select sum([Bill_Amount]) as Total_Amount
from healthdata
where Discharge_Date is not null

-- Find the top 5 diseases with the highest number of patients in
-- the dataset.
select top 5 [Diagnosis], count([Patient_ID]) as Total_Count
from healthdata
group by [Diagnosis]
order by Total_Count desc

-- Find the average hospital stay duration (in days) for
-- discharged patients.
select avg(DATEDIFF(day,[Admission_Date],[Discharge_Date]))
as Total_days
from healthdata
where Discharge_Date is not null

-- Find the month-wise total number of admissions. The output
-- should show the month name and the total number of patients
-- admitted in that month.
select DATEname(MONTH,[Admission_Date]) as Month,
count([Patient_ID]) as Total_Count
from healthdata
group by DATEname(MONTH,[Admission_Date]),
datepart(MONTH,[Admission_Date])
order by datepart(MONTH,[Admission_Date]) asc

-- Find the disease with the highest total billing amount.
select top 1 [Diagnosis], sum([Bill_Amount]) as Total_Billing
from healthdata
group by [Diagnosis]
order by Total_Billing desc

-- find the total number of male and female patients separately
select Gender, count([Patient_ID]) as Total_Count
from healthdata
group by Gender
order by Total_Count desc

-- Find the oldest patient’s age in the dataset
select  max(Age)as Max_Age
from healthdata

-- Find the top 3 doctors who have treated the most patients.
select top 3 Doctor, count([Patient_ID]) as Total_Count
from healthdata
group by Doctor
order by Total_Count desc

-- Find the total number of patients admitted in the last 30
-- days from today
SELECT COUNT([Patient_ID]) AS Total_Count
FROM healthdata
WHERE [Admission_Date] >= DATEADD(DAY, -30, GETDATE());

-- Find the hospital’s total revenue from patients who stayed
-- more than 7 days in the hospital
select Hospital, sum([Bill_Amount]) as Total_Revenue
from healthdata
where DATEDIFf(day,[Admission_Date],[Discharge_Date]) > 7
group by Hospital
order by Total_Revenue desc

-- Find the top 5 most common diagnoses among admitted patients
select top 5 [Diagnosis], count([Diagnosis]) as Total_Count
from healthdata
where [Discharge_Date] is null
group by [Diagnosis]
order by Total_Count desc

-- Find the average bill amount for each diagnosis.
select [Diagnosis], avg([Bill_Amount]) as Avg_Amount
from healthdata
group by [Diagnosis]
order by Avg_Amount desc

-- Find the month with the highest number of admissions.
select top 1 FORMAT([Admission_Date], 'yyyy-MMMM') AS YearMonth,
count([Patient_ID]) as Total_Count
from healthdata
group by FORMAT([Admission_Date], 'yyyy-MMMM')
order by Total_Count desc

-- Find the total number of patients who were admitted on weekends
SELECT COUNT([Patient_ID]) AS Total_Count
FROM healthdata
WHERE DATEPART(WEEKDAY, [Admission_Date]) IN (1, 7);

-- Find the doctor who treated the highest number of patients.
select top 1 Doctor,count([Patient_ID]) as Total_Count
from healthdata
group by Doctor
order by Total_Count desc

-- total number of patients who were admitted more than once
SELECT [Patient_ID], COUNT([Patient_ID]) AS Total_Admissions
FROM healthdata
GROUP BY [Patient_ID]
ORDER BY Total_Admissions DESC;

-- Find the doctor who generated the highest total bill amount
select top 1 doctor,sum([Bill_Amount]) as Total_Amount
from healthdata
group by Doctor
order by Total_Amount desc

-- Find the hospital that admitted the most patients
select top 1 [Hospital], Count([Patient_ID]) as Total_patients
from healthdata
group by [Hospital]
order by Total_patients desc

-- Find the month with the highest number of patient admissions.
select top 1 format([Admission_Date],'mmmm-yyyy') as month,
count([Patient_ID]) as total_Count
from healthdata
group by format([Admission_Date],'mmmm-yyyy')
order by total_Count desc
