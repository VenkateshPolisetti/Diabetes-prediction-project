create database diabetes_analysis;
use diabetes_analysis;
select * from diabetes;
select Patient_id,age from diabetes;
select EmployeeName, avg(bmi) as BMI 
from diabetes
 GROUP BY EmployeeName;
 
 select EmployeeName,Patient_id,blood_glucose_level from diabetes order by blood_glucose_level desc;
 select EmployeeName, hypertension, diabetes from diabetes where hypertension=1 and diabetes =1 ;
 
 select EmployeeName , Patient_id, heart_disease from diabetes where heart_disease=1;
 select count(*) as heart_disease from diabetes where heart_disease=1;
 
 select smoking_history, count(*) as patient_count from diabetes group by smoking_history;
 
 select EmployeeName, Patient_id ,bmi from diabetes where bmi>(select avg(bmi)from diabetes);
 
 select EmployeeName,HbA1c_level from diabetes where HbA1c_level=(select max(HbA1c_level) from diabetes) or HbA1c_level= (select min(HbA1c_level) from diabetes);
 
 select EmployeeName, (year(current_date()- D.O.B)) as age from diabetes;
 
 select Patient_id, EmployeeName,gender, blood_glucose_level, rank() over(partition by gender order by blood_glucose_level desc) as Glucose_Rank from diabetes;
 
 insert into diabetes (EmployeeName,Patient_id,gender,hypertension,heart_disease,smoking_history,bmi,HbA1c_level,blood_glucose_level,diabetes)
 values('priya','PT001','Female',0,1,'never',22,6.6,150,0); 
 select * from diabetes where Patient_id='PT001';
 
 select EmployeeName,Patient_id,gender,hypertension,diabetes from diabetes where hypertension=1
 except 
 select EmployeeName,Patient_id,gender,hypertension,diabetes from diabetes where diabetes=1;
 alter table diabetes modify column Patient_id varchar(150);
 alter table diabetes add constraint unique_id unique(Patient_id);
 
 create view Patient_Information as 
 select Patient_id,EmployeeName,bmi from diabetes ;
 select * from Patient_Information;
 
 select Patient_id, bmi from diabetes;
 
 select EmployeeName,gender,blood_glucose_level from diabetes where gender='Female' and blood_glucose_level>150;
 
 select DOB from diabetes;
 SELECT 
    year
FROM
    diabetes;
    select * from diabetes;
    select d.o.b from diabetes;
delete from diabetes where heart_disease=1;
 
 
