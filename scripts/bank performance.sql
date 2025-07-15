-- ============================================================
-- Project: Bank Loan Performance Dashboard
-- File: performance_indicators.sql
-- Description: SQL queries used to generate KPIs and summaries
--              for Tableau dashboard reporting.
-- Author: Kingsley Momanyi
-- Date: [Insert date]
-- ============================================================

---------------------------------------------------------------
-- 1. Total number of loan applications
---------------------------------------------------------------
SELECT
    COUNT(id) AS total_application
FROM 
    financial_loan;

---------------------------------------------------------------
-- 2. Total funded loan amount
---------------------------------------------------------------
SELECT 
    SUM(loan_amount) AS total_funded_amnt
FROM
    financial_loan;

---------------------------------------------------------------
-- 3. Total amount received from repayments
---------------------------------------------------------------
SELECT  
    SUM(total_payment) AS total_received
FROM
    financial_loan;

---------------------------------------------------------------
-- 4. Average interest rate (as percentage)
---------------------------------------------------------------
SELECT 
    ROUND(AVG(int_rate) * 100, 2) AS average_interest
FROM 
    financial_loan;

---------------------------------------------------------------
-- 5. Average Debt-to-Income (DTI) ratio (as percentage)
---------------------------------------------------------------
SELECT 
    ROUND(AVG(dti) * 100, 2) AS avg_dti
FROM
    financial_loan;

---------------------------------------------------------------
-- 6. Percentage of good loan applications (Fully Paid or Current)
---------------------------------------------------------------
SELECT
    ROUND((CAST(good_loan AS FLOAT) / total_application) * 100, 2) AS good_loan_percentage
FROM (
    SELECT 
        COUNT(id) AS total_application,
        COUNT(CASE 
                  WHEN loan_status = 'Fully Paid' OR loan_status = 'Current'
                  THEN id 
             END) AS good_loan
    FROM financial_loan
) t;

---------------------------------------------------------------
-- 7. Total count of good loans
---------------------------------------------------------------
SELECT
    COUNT(CASE 
              WHEN loan_status = 'Fully Paid' OR loan_status = 'Current'
              THEN id 
         END) AS good_loan
FROM financial_loan;

---------------------------------------------------------------
-- 8. Percentage of bad loans (Charged Off)
---------------------------------------------------------------
SELECT
    ROUND((CAST(bad_loan AS FLOAT) / total_application) * 100, 2) AS bad_loan_percentage
FROM (
    SELECT 
        COUNT(id) AS total_application,
        COUNT(CASE 
                  WHEN loan_status = 'Charged Off'
                  THEN id 
             END) AS bad_loan
    FROM financial_loan
) t;

---------------------------------------------------------------
-- 9. Total count of bad loans
---------------------------------------------------------------
SELECT 
    COUNT(CASE 
              WHEN loan_status = 'Charged Off'
              THEN id 
         END) AS bad_loan
FROM financial_loan;

---------------------------------------------------------------
-- 10. Loan summary grouped by loan status
-- Includes counts, funding, repayment, interest, and DTI
---------------------------------------------------------------
SELECT
    loan_status,
    COUNT(id) AS total_application,
    SUM(total_payment) AS total_received,
    SUM(loan_amount) AS total_funded,
    AVG(int_rate * 100) AS average_interest,
    AVG(dti * 100) AS average_dti
FROM 
    financial_loan
GROUP BY 
    loan_status;

---------------------------------------------------------------
-- 11. Monthly trend analysis for loan activity
---------------------------------------------------------------
SELECT
    MONTH(issue_date) AS month_number,
    DATENAME(month, issue_date) AS transaction_month,
    COUNT(id) AS total_applications,
    SUM(loan_amount) AS total_funded,
    SUM(total_payment) AS total_received
FROM 
    financial_loan
GROUP BY 
    MONTH(issue_date), DATENAME(month, issue_date)
ORDER BY 
    MONTH(issue_date);

---------------------------------------------------------------
-- 12. Loan report grouped by U.S. state
---------------------------------------------------------------
SELECT
    address_state,
    COUNT(id) AS total_applications,
    SUM(loan_amount) AS total_funded,
    SUM(total_payment) AS total_received
FROM 
    financial_loan
GROUP BY 
    address_state
ORDER BY 
    SUM(loan_amount) DESC;

---------------------------------------------------------------
-- 13. Loan summary by term (36 or 60 months)
---------------------------------------------------------------
SELECT
    term,
    COUNT(id) AS total_applications,
    SUM(loan_amount) AS total_funded,
    SUM(total_payment) AS total_received
FROM 
    financial_loan
GROUP BY 
    term
ORDER BY 
    SUM(loan_amount) DESC;

---------------------------------------------------------------
-- 14. Loan report by employment length
---------------------------------------------------------------
SELECT
    emp_length,
    COUNT(id) AS total_applications,
    SUM(loan_amount) AS total_funded,
    SUM(total_payment) AS total_received
FROM 
    financial_loan
GROUP BY 
    emp_length
ORDER BY 
    SUM(loan_amount) DESC;

---------------------------------------------------------------
-- 15. Loan summary by loan purpose
---------------------------------------------------------------
SELECT
    purpose,
    COUNT(id) AS total_applications,
    SUM(loan_amount) AS total_funded,
    SUM(total_payment) AS total_received
FROM 
    financial_loan
GROUP BY 
    purpose
ORDER BY 
    SUM(loan_amount) DESC;

---------------------------------------------------------------
-- 16. Loan summary by home ownership
---------------------------------------------------------------
SELECT
    home_ownership,
    COUNT(id) AS total_applications,
    SUM(loan_amount) AS total_funded,
    SUM(total_payment) AS total_received
FROM 
    financial_loan
GROUP BY 
    home_ownership
ORDER BY 
    SUM(loan_amount) DESC;
