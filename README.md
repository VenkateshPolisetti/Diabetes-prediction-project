-- Create database
CREATE DATABASE diabetes_analysis;
USE diabetes_analysis;

-- Select all columns from diabetes table
SELECT * FROM diabetes;

-- Select specific columns (Patient_id, age) from diabetes table
SELECT Patient_id, age FROM diabetes;

-- Select EmployeeName and average BMI, grouped by EmployeeName
SELECT EmployeeName, AVG(bmi) AS 🌟BMI 
FROM diabetes
GROUP BY EmployeeName;

-- Select EmployeeName, Patient_id, and blood_glucose_level, ordered by blood_glucose_level descending
SELECT EmployeeName, Patient_id, blood_glucose_level 
FROM diabetes 
ORDER BY blood_glucose_level DESC;

-- Select EmployeeName, hypertension, and diabetes where hypertension and diabetes are both true
SELECT EmployeeName, hypertension, diabetes 
FROM diabetes 
WHERE hypertension = 1 AND diabetes = 1;

-- Select EmployeeName, Patient_id, and heart_disease where heart_disease is true
SELECT EmployeeName, Patient_id, heart_disease 
FROM diabetes 
WHERE heart_disease = 1;

-- Count the number of patients with heart disease
SELECT COUNT(*) AS ❤️heart_disease_count 
FROM diabetes 
WHERE heart_disease = 1;

-- Count patients by smoking history
SELECT smoking_history, COUNT(*) AS patient_count 
FROM diabetes 
GROUP BY smoking_history;

-- Select EmployeeName, Patient_id, and BMI where BMI is above the average BMI
SELECT EmployeeName, Patient_id, bmi 
FROM diabetes 
WHERE bmi > (SELECT AVG(bmi) FROM diabetes);

-- Select EmployeeName and HbA1c_level where HbA1c_level is either the maximum or minimum in the dataset
SELECT EmployeeName, HbA1c_level 
FROM diabetes 
WHERE HbA1c_level = (SELECT MAX(HbA1c_level) FROM diabetes) 
   OR HbA1c_level = (SELECT MIN(HbA1c_level) FROM diabetes);

-- Calculate age from date of birth
SELECT EmployeeName, TIMESTAMPDIFF(YEAR, D.O.B, CURRENT_DATE()) AS 🎂age 
FROM diabetes;

-- Rank patients by blood glucose level within each gender group
SELECT Patient_id, EmployeeName, gender, blood_glucose_level, 
       RANK() OVER(PARTITION BY gender ORDER BY blood_glucose_level DESC) AS Glucose_Rank 
FROM diabetes;

-- Insert a new record into the diabetes table
INSERT INTO diabetes (EmployeeName, Patient_id, gender, hypertension, heart_disease, smoking_history, bmi, HbA1c_level, blood_glucose_level, diabetes)
VALUES ('priya', 'PT001', 'Female', 0, 1, 'never', 22, 6.6, 150, 0);

-- Select the newly inserted record
SELECT * FROM diabetes WHERE Patient_id = 'PT001';

-- Select patients with hypertension but not diabetes
SELECT EmployeeName, Patient_id, gender, hypertension, diabetes 
FROM diabetes 
WHERE hypertension = 1
EXCEPT
SELECT EmployeeName, Patient_id, gender, hypertension, diabetes 
FROM diabetes 
WHERE diabetes = 1;

-- Modify column type and add a unique constraint to Patient_id
ALTER TABLE diabetes MODIFY COLUMN Patient_id VARCHAR(150);
ALTER TABLE diabetes ADD CONSTRAINT unique_id UNIQUE(Patient_id);

-- Create a view to display Patient_id, EmployeeName, and BMI
CREATE VIEW Patient_Information AS
SELECT Patient_id, EmployeeName, bmi 
FROM diabetes;

-- Select all records from the Patient_Information view
SELECT * FROM Patient_Information;

-- Select Patient_id and BMI from diabetes table
SELECT Patient_id, bmi FROM diabetes;

-- Select EmployeeName, gender, and blood_glucose_level for female patients with blood glucose level above 150
SELECT EmployeeName, gender, blood_glucose_level 
FROM diabetes 
WHERE gender = 'Female' AND blood_glucose_level > 150;

-- Select date of birth from diabetes table
SELECT DOB FROM diabetes;

-- Select the year from the date of birth column
SELECT YEAR(DOB) FROM diabetes;

-- Delete records where heart_disease is true
DELETE FROM diabetes WHERE heart_disease = 1;
