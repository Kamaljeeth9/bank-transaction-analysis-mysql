-- =====================================================
-- BANK TRANSACTION ANALYSIS
-- DATA CLEANING & VALIDATION
-- MySQL
-- =====================================================
##-- creating a 2nd table and inserting raw data to perform  the operations like data cleaning 
create table bank_transaction_data_2_cleaning
like bank_transactions_data_2;

select * from bank_transaction_data_2_cleaning;

insert bank_transaction_data_2_cleaning
select * from bank_transactions_data_2;
 
 ##-----------------------------------------------------------------------
 ## understanding and inspecting what each columns means
select * from bank_transaction_data_2_cleaning
limit 10;

describe bank_transaction_data_2_cleaning; 

-- =====================================================
-- NULL VALUE CHECKS
-- =====================================================
select count(*) as total_rows,
		sum(TransactionID is null) as missing_transaction_id,
        sum(AccountID is null) as missing_account_id,
        sum(TransactionAmount is null) as missing_transaction_amount
from bank_transaction_data_2_cleaning;

-- =====================================================
-- DUPLICATE CHECKS
-- =====================================================
select TransactionID, count(*) from bank_transaction_data_2_cleaning
group by TransactionID
having count(*) > 1;

## or 

with finding_duplicates as (
select *,
row_number() over(partition by TransactionID) as row_num
from bank_transaction_data_2_cleaning)
select * from finding_duplicates 
where row_num > 1;
-- =====================================================
-- TRANSACTION AMOUNT VALIDATION
-- =====================================================

# checking negative transaction amount values

select *
from bank_transaction_data_2_cleaning
where TransactionAmount < 0; 
-- =====================================================
-- CUSTOMER DATA VALIDATION
-- =====================================================
# Check unusual ages
SELECT *
FROM bank_transaction_data_2_cleaning
WHERE CustomerAge < 18
   OR CustomerAge > 100;

-- =====================================================
-- TRANSACTION BEHAVIOUR VALIDATION
-- =====================================================
   
# Check login attempts
select * from bank_transaction_data_2_cleaning
where LoginAttempts < 0;

# Check transaction duration
select * from bank_transaction_data_2_cleaning
where TransactionDuration < 0;

-- =====================================================
	-- FINDING UNIQUE RECORDS
-- =====================================================

# Check text consistency OR finding unique records
select distinct TransactionType from bank_transaction_data_2_cleaning;

select distinct Location from bank_transaction_data_2_cleaning;

select distinct `Channel` from bank_transaction_data_2_cleaning;

create table bank_transaction_clean
like bank_transaction_data_2_cleaning;

select * from bank_transaction_clean;

insert bank_transaction_clean
select * from bank_transaction_data_2_cleaning;

drop table bank_transactions_data_2;
