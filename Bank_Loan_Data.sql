

--(to fetch total rows and columns of table)--

select * from financial_loan


--(to fetch No. of total loan application of table)--


select count(id)as Total_Loan_Application from financial_loan


--(to fetch total No. of prevoius loan application  of table)--

select count(id) as PMTD_Total_loan_application from financial_loan
where MONTH(issue_date)=11 and YEAR(issue_date)=2021

--(to find total funded amount of  loan application)--

select sum(loan_amount)as Total_Funded_Amount from financial_loan


--(to find total funded amount of  loan application by month to date)--

select sum(loan_amount)as MTDTotal_Funded_Amount from financial_loan
where MONTH(issue_date)=12 and YEAR(issue_date)=2021


--(to find total funded amount of  loan application by prevoius month to date)--

select sum(loan_amount)as PMTDTotal_Funded_Amount from financial_loan
where MONTH(issue_date)=11 and YEAR(issue_date)=2021


--(to find total amount received by the customers)--

select sum(total_payment)as Total_Amount_Received from financial_loan


--(to find total amount received month to date by the customers)--

select sum(total_payment)as MTDTotal_Amount_Received from financial_loan
where MONTH(issue_date)=12 and YEAR(issue_date)=2021

--(to find total amount received previous month to date by the customers)--

select sum(total_payment)as PMTDTotal_Amount_Received from financial_loan
where MONTH(issue_date)=11 and YEAR(issue_date)=2021

--(Average Interest Rate)-----------------

select ROUND(AVG(int_rate), 4) * 100 as AVG_INT_RATE from financial_loan


--(Average Interest Rate by MTD)-----------------

select ROUND(AVG(int_rate), 4) * 100 as MTDAVG_INT_RATE from financial_loan
where MONTH(issue_date)=12 and YEAR(issue_date)=2021


--(Average Interest Rate by PMTD)-----------------

select ROUND(AVG(int_rate), 4) * 100 as PMTDAVG_INT_RATE from financial_loan
where MONTH(issue_date)=11 and YEAR(issue_date)=2021

--(Average Dept to income ratio)-----------------

select  round(avg(dti),4) * 100 as AVG_DTI from financial_loan


--(Average Dept to income ratio by month do date )-----------------

select  round(avg(dti),4) * 100 as MTDAVG_DTI from financial_loan
where MONTH(issue_date)=12 and YEAR(issue_date)=2021


--(Average Dept to income ratio by previous month to date)-----------------

select  round(avg(dti),4) * 100 as PMTDAVG_DTI from financial_loan
where MONTH(issue_date)=11 and YEAR(issue_date)=2021


----(Good Loan Application %)----

select loan_status from financial_loan

select (count(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end )*100) 
/
count (id) as Good_Loan_Percentage from financial_loan


----(count of Good Loan Application )----

select count(id) Good_Loan_Applications from financial_loan where loan_status='Fully Paid' or loan_status='Current'


----(Total Good Loan Funded Amount)----

select sum(loan_amount) Good_Loan_Funded_Amount from financial_loan where loan_status='Fully Paid' or loan_status='Current'


----(Total Good Loan Received Amount)----

select sum(total_payment) Good_Loan_Payment_Received from financial_loan where loan_status='Fully Paid' or loan_status='Current'


----(Total Bad Loan Percentage Amount)----

select (count(case when loan_status = 'Charged Off' then id end )*100.0) 
/
count (id) as Bad_Loan_Percentage from financial_loan


----(Total Bad Loan Applications)----

select count(id) as Bad_Loan_Applications from financial_loan where loan_status='Charged Off'


----(Total Bad Loan Funded Amount)----

select sum(loan_amount) as Bad_Loan_Funded_Amount from financial_loan where loan_status='Charged Off'


----(Total Bad Loan Amount Received)----

select sum(total_payment) as Bad_Loan_Amount_Received from financial_loan where loan_status='Charged Off'


----(Total_Loan_Aplications,Amount_Received,Funded_Amount, Interest_Rate and DTI)----

select loan_status,
count(id) as Total_Loan_Aplications,
sum(total_payment) as Total_Amount_Received,
sum(loan_amount) as Total_Funded_Amount,
avg(int_rate * 100) as Interest_Rate,
avg(dti * 100) as DTI from financial_loan group by loan_status



----(MTD_Total_Amount_Received,MTD_Total_Funded_Amount)----

select loan_status,
sum(total_payment) as MTD_Total_Amount_Received,
sum(loan_amount)as MTD_Total_Funded_Amount
from financial_loan where MONTH(issue_date)=12 group by loan_status


----(Total_Loan_Applications,Total_Funded_Amount,Total_Received_Amount)----

select MONTH(issue_date) as Month_Number,
DATENAME(month,issue_date) as Month_Name ,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from financial_loan group by DATENAME(month,issue_date),MONTH(issue_date)
order by  MONTH(issue_date)


----(Total_Loan_Applications,Total_Funded_Amount,Total_Received_Amount)----

select address_state,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from financial_loan group by address_state
order by sum(loan_amount) desc


----(Total_Loan_Applications,Total_Funded_Amount,Total_Received_Amount order by count id)----

select address_state,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from financial_loan group by address_state
order by count(id) desc



----(Total_Loan_Applications,Total_Funded_Amount,Total_Received_Amount order by term)----

select term,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from financial_loan group by term
order by term


----(Total_Loan_Applications,Total_Funded_Amount,Total_Received_Amount order by emp_length)----

select emp_length,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from financial_loan group by emp_length
order by emp_length



----(Total_Loan_Applications,Total_Funded_Amount,Total_Received_Amount order by count id)----

select emp_length,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from financial_loan group by emp_length
order by count (id) desc


----(Total_Loan_Applications,Total_Funded_Amount,Total_Received_Amount group by purpose)----

select purpose,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from financial_loan group by purpose
order by count (id) desc



----(Total_Loan_Applications,Total_Funded_Amount,Total_Received_Amount group by home ownership)----

select home_ownership,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from financial_loan group by home_ownership
order by count (id) desc



----(Total_Loan_Applications,Total_Funded_Amount,Total_Received_Amount by grade 'A')----

select home_ownership,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from financial_loan where  grade='A' group by home_ownership
order by count (id) desc



----(Total_Loan_Applications,Total_Funded_Amount,Total_Received_Amount by grade 'A' and Address_State='CA')----

select home_ownership,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from financial_loan where  grade='A' and address_state='CA' group by home_ownership
order by count (id) desc






