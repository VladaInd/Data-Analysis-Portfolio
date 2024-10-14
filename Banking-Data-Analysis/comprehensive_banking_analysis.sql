-- Customer Segmentation by Account Balance

select id,
       balance,
       case
           when balance < 10000 then 'Low'
           when balance between 10000 and 100000 then 'Medium'
           when balance > 100000 then 'High'
           end as balance_segment
from banking_data_analysis
order by balance desc;

--Customer Segmentation by Credit Score

select credit_score,
       case
           when credit_score < 600 then 'Poor'
           when credit_score between 600 and 750 then 'Fair'
           else 'Excellent'
           end credit_segment
from banking_data_analysis;

--Loan Value Ration Analysis

select account_type,
       round(avg(loan_amount / (loan_amount + balance)), 2) * 100 as avg_ltv,
       round(max(loan_amount / (loan_amount + balance)), 2) * 100 as max_ltv,
       round(min(loan_amount / (loan_amount + balance)), 2) * 100 as min_ltv
from banking_data_analysis
where loan_amount > 0
  and balance > 0
group by account_type
order by account_type;

-- Top 10 Customers With The Highest Loan Amount

select id, loan_amount
from banking_data_analysis
order by loan_amount desc
limit 10;


--Analyzing Credit Limit Utilization:

select id,
       first_name,
       last_name,
       credit_limit,
       balance,
       ROUND((balance / credit_limit) * 100, 2) as credit_limit_utilization,
       case
           when (balance / credit_limit) * 100 > 30 then 'Low'
           when (balance / credit_limit) * 100 between 30 and 70 then 'Medium'
           when (balance / credit_limit) * 100 < 70 then 'High'
           else 'High'
           end                                  as utilization_category
from banking_data_analysis
where credit_limit > 0
  and balance > 0
order by utilization_category desc;

--The Most Popular Account Types And Loan Products

select account_type, count(*) as account_count
from banking_data_analysis
group by account_type
order by account_type desc;

select loan_type, count(*) as loan_count
from banking_data_analysis
group by loan_type
order by loan_type desc

















