
# Bluestock Mutual Fund Analytics – Data Dictionary

## 1. Fund Master
**Source:** clean_fund_master.csv

| Column | Data Type | Description |
|---|---|---|
| amfi_code | TEXT | Unique mutual fund code |
| scheme_name | TEXT | Name of the mutual fund scheme |
| fund_house | TEXT | Name of the fund house |
| category | TEXT | Fund category |
| sub_category | TEXT | Fund sub-category |
| plan | TEXT | Investment plan |

## 2. NAV History
**Source:** clean_nav.csv

| Column | Data Type | Description |
|---|---|---|
| amfi_code | INTEGER | Mutual fund code |
| date | DATE | NAV record date |
| nav | REAL | Net Asset Value |

## 3. Investor Transactions
**Source:** clean_transactions.csv

| Column | Data Type | Description |
|---|---|---|
| investor_id | TEXT | Investor identifier |
| transaction_date | DATE | Transaction date |
| amfi_code | INTEGER | Mutual fund code |
| transaction_type | TEXT | SIP, Lumpsum or Redemption |
| amount_inr | REAL | Transaction amount in INR |
| state | TEXT | Investor state |
| city | TEXT | Investor city |
| city_tier | TEXT | City classification |
| age_group | TEXT | Investor age group |
| gender | TEXT | Investor gender |
| annual_income_lakh | REAL | Annual income in lakhs |
| payment_mode | TEXT | Payment method |
| kyc_status | TEXT | KYC verification status |

## 4. Scheme Performance
**Source:** clean_performance.csv

Contains fund returns, risk metrics, Sharpe ratio and expense ratio.

## 5. AUM by Fund House
**Source:** clean_aum.csv

Contains fund house, reporting date, AUM in lakh crore and crore, and number of schemes.

## 6. Monthly SIP Inflows
**Source:** clean_monthly_sip.csv

Contains monthly SIP inflow, active accounts, new accounts, SIP AUM and YoY growth.

## 7. Category Inflows
**Source:** clean_category_inflows.csv

Contains month, mutual fund category and net inflow.

## 8. Industry Folio Count
**Source:** clean_industry_folio_count.csv

Contains monthly total folios and equity, debt, hybrid and other folio counts.

## 9. Portfolio Holdings
**Source:** clean_portfolio_holdings.csv

Contains fund code, stock details, sector, portfolio weight, market value, price and portfolio date.

## 10. Benchmark Indices
**Source:** clean_benchmark_indices.csv

Contains benchmark date, index name and closing value.

## Data Source
Bluestock Mutual Fund Analytics Capstone Project datasets.
