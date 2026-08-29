# Bank Transaction Analysis Using MySQL

## 📌 Project Overview

This project analyses **2,512 banking transaction records** using MySQL to understand transaction behaviour, customer segments, account activity, channel performance and location-level transaction patterns.

The project follows a complete SQL data-analysis workflow:

**Data Validation → EDA → Business Analysis → Insights → Recommendations**

The analysis was designed to demonstrate practical SQL skills and the ability to translate transaction data into meaningful business findings.

---

## 🎯 Business Objective

The main objective of this project is to understand how transactions vary across:

* Transaction types
* Customer occupations
* Customer age groups
* Transaction channels
* Locations
* Customer accounts
* Transaction values
* Login attempts and potentially unusual activity

The analysis aims to identify patterns that could help a banking business better understand customer behaviour and areas that may require further investigation.

---

## 📊 Dataset

The dataset contains **2,512 transaction records** and includes 16 fields.

Important fields include:

| Column                  | Description                            |
| ----------------------- | -------------------------------------- |
| TransactionID           | Unique identifier for each transaction |
| AccountID               | Customer account identifier            |
| TransactionAmount       | Monetary value of the transaction      |
| TransactionDate         | Date of the transaction                |
| TransactionType         | Credit or Debit                        |
| Location                | Transaction location                   |
| Channel                 | ATM, Branch or Online                  |
| CustomerAge             | Customer age                           |
| CustomerOccupation      | Customer occupation                    |
| TransactionDuration     | Duration of the transaction            |
| LoginAttempts           | Number of login attempts               |
| AccountBalance          | Account balance                        |
| PreviousTransactionDate | Date of the previous transaction       |

---

## 🧹 Data Cleaning & Validation

Before performing the analysis, data-quality checks were carried out to validate the dataset.

The checks included:

* Duplicate Transaction IDs
* NULL values
* Negative transaction amounts
* Invalid customer ages
* Invalid login attempts
* Invalid transaction durations
* General data consistency checks

Duplicate Transaction IDs were checked and no duplicates were identified.

The validation checks were completed before proceeding with the exploratory and business analysis.

---

## 🔎 Exploratory Data Analysis (EDA)

Initial exploratory analysis was performed to understand the overall transaction dataset.

The EDA covered:

* Total transaction count
* Total transaction value
* Average transaction amount
* Highest and lowest transaction amounts
* Transaction type distribution
* Transaction value by location
* Transaction activity by occupation
* Average transaction amount by occupation
* Average account balance by occupation
* Channel performance
* Age-group transaction behaviour
* Account activity
* High-value transactions
* Login-attempt patterns
* Transaction-duration patterns

### Overall Dataset Metrics

| Metric                     |     Result |
| -------------------------- | ---------: |
| Total Transactions         |      2,512 |
| Total Transaction Value    | 747,555.57 |
| Average Transaction Amount |     297.59 |
| Highest Transaction Amount |   1,919.11 |
| Lowest Transaction Amount  |       0.26 |

---

## 💼 Business Analysis

After the initial EDA, a series of business questions were developed to investigate transaction and customer behaviour.

The analysis examined:

1. Top high-value transactions
2. Transaction-type performance
3. Channel performance
4. Highest-value accounts
5. Most active accounts
6. Occupation performance
7. Age-group behaviour
8. Transaction-value categories
9. High-value transactions relative to the overall average
10. Potentially unusual transactions using transaction amount and login attempts

The complete SQL queries are available in the `sql` folder.

---

## 🛠️ SQL Techniques Used

### Basic SQL

* `SELECT`
* `WHERE`
* `ORDER BY`
* `LIMIT`
* `GROUP BY`
* `HAVING`

### Aggregate Functions

* `COUNT()`
* `SUM()`
* `AVG()`
* `MAX()`
* `MIN()`

### Conditional Analysis

* `CASE`

### Advanced SQL

* Subqueries
* Common Table Expressions (CTEs)
* JOINs
* Window functions

### Window Functions

* `RANK()`
* `DENSE_RANK()`
* `ROW_NUMBER()`
* `LAG()`
* `SUM() OVER()`
* `AVG() OVER()`

These techniques were used to analyse account activity, transaction rankings, account-level totals, running transaction values, previous transactions and transaction performance.

---

# 📈 Key Business Insights

## 1. Debit transactions dominate transaction activity

Debit transactions accounted for **1,944 of the 2,512 transactions**, while credit transactions accounted for 568.

Debit transactions also generated the majority of total transaction value.

However, credit transactions had a slightly higher average transaction amount:

* Debit average: **294.99**
* Credit average: **306.50**

This suggests that debit transactions are more frequent, while credit transactions have a slightly higher average value.

---

## 2. ATM generated the highest average transaction amount

Among the three analysed channels:

| Channel | Transactions | Total Value | Average Amount |
| ------- | -----------: | ----------: | -------------: |
| ATM     |          833 |  256,331.43 |         307.72 |
| Branch  |          868 |  250,183.00 |         288.23 |
| Online  |          811 |  241,041.14 |         297.21 |

ATM transactions recorded the **highest average transaction amount at 307.72**.

Branch transactions had the highest transaction volume, with 868 transactions.

This shows that transaction frequency and transaction value do not necessarily follow the same pattern.

---

## 3. Students generated the highest transaction activity by occupation

Students recorded:

* **657 transactions**
* **205,786.03 total transaction value**
* **313.22 average transaction amount**
* **1,570.21 average account balance**

Among the occupations analysed, students generated the highest transaction volume and total transaction value.

At the same time, their average account balance was considerably lower than the other occupation groups.

This indicates that high transaction activity does not necessarily correspond to having the highest account balance.

---

## 4. Transaction behaviour varies across age groups

The 55+ age group generated the highest transaction volume:

* **868 transactions**
* **259,811.66 total transaction value**

However, the 18–24 group had the highest average transaction amount:

* **315.88 average transaction amount**

This demonstrates that the age group with the highest transaction frequency is not necessarily the group with the highest average transaction value.

---

## 5. Austin recorded the highest transaction value among locations

Austin recorded:

* **59 transactions**
* **22,740.90 total transaction value**
* **385.44 average transaction amount**

Although Austin did not have the highest transaction count, it generated the highest total transaction value among the locations analysed.

This suggests that transaction value can be driven by transaction size rather than simply transaction volume.

---

## 6. Low-value transactions dominate transaction volume

Transactions were classified into Low and Medium categories based on transaction amount.

| Category | Transactions | Total Value | Average Amount |
| -------- | -----------: | ----------: | -------------: |
| Low      |        2,422 |  634,439.41 |         261.95 |
| Medium   |           90 |  113,116.16 |       1,256.85 |

Low-value transactions represented the overwhelming majority of transactions.

However, medium-value transactions had a much higher average transaction amount.

This demonstrates why analysing both transaction **volume** and transaction **value** is important.

---

## 7. Potentially unusual transactions were identified

The analysis also examined transactions where the transaction amount was relatively high and login attempts were elevated.

These transactions should **not automatically be classified as fraudulent**.

Instead, they represent potentially unusual patterns that could be selected for further investigation in a real banking environment.

---

# 💡 Business Recommendations

Based on the analysis, the following areas could be investigated further:

### 1. Investigate high-activity customer segments

Students generated the highest transaction activity despite having the lowest average account balance among the analysed occupations.

Further segmentation could help understand the products and services most relevant to this customer group.

### 2. Investigate ATM transaction behaviour

ATM transactions had the highest average transaction amount.

The bank could investigate whether transaction type, customer segment or location is driving this higher average.

### 3. Investigate high-value locations

Austin generated the highest total transaction value and highest average transaction amount among the locations analysed.

Further analysis could investigate what customer and transaction characteristics contribute to this performance.

### 4. Monitor potentially unusual transactions

Transactions combining relatively high transaction amounts with elevated login attempts could be flagged for additional review.

This could form part of a broader transaction-risk monitoring process.

### 5. Analyse transaction value separately from transaction frequency

The analysis shows that the most frequent transactions, highest-value transactions and highest-average transactions can belong to different customer segments or channels.

Therefore, banking performance should be evaluated using multiple measures rather than transaction count alone.

---

# 📁 Project Structure

```text
bank-transaction-analysis-mysql/
│
├── data/
│   └── bank_transactions_data_2.csv
│
├── sql/
│   ├── 01_data_cleaning.sql
│   ├── 02_eda.sql
│   └── 03_business_analysis.sql
│
├── results/
│   └── Q1_Q15_results.xlsx
│
└── README.md
```

---

# 📂 Project Files

### `data/`

Contains the transaction dataset used for the analysis.

### `sql/`

Contains the SQL scripts for:

* Data cleaning and validation
* Exploratory Data Analysis
* Business analysis questions

### `results/`

Contains the Excel workbook with the results from the 15 business-analysis queries.

### `README.md`

Documents the project objective, methodology, SQL techniques, findings and recommendations.

---

# 🏁 Conclusion

This project demonstrates how MySQL can be used to transform transaction-level data into meaningful business insights.

The analysis covers the complete workflow from data validation and exploratory analysis to advanced SQL-based business analysis.

By combining aggregation, conditional logic, subqueries, CTEs and window functions, the project investigates customer behaviour, account activity, transaction patterns, channel performance and location-level differences.

The project demonstrates not only SQL query-writing ability but also the ability to interpret analytical results and translate them into potential business recommendations.
