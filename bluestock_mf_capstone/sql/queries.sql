

-- Question: Find the top five mutual funds
-- with the highest Assets Under Management (AUM).

-- Query 1: Top 5 Funds by AUM

SELECT
    f.scheme_name,
    a.fund_house,
    a.aum_crore
FROM fact_aum a
JOIN dim_fund f
    ON a.fund_house = f.fund_house
ORDER BY a.aum_crore DESC
LIMIT 5;


-- Query 2: Average NAV per Month
SELECT
    strftime('%Y-%m', nav_date) AS month,
    ROUND(AVG(nav), 2) AS average_nav
FROM fact_nav
GROUP BY strftime('%Y-%m', nav_date)
ORDER BY month;


-- Query 3: SIP Inflow YoY Growth
SELECT
    month,
    sip_inflow_crore,
    yoy_growth_pct
FROM monthly_sip_inflows
WHERE yoy_growth_pct IS NOT NULL
ORDER BY month;


-- Query 4: Transactions by State
SELECT state,
       COUNT(*) AS total_transactions,
       ROUND(SUM(amount_inr), 2) AS total_amount
FROM fact_transactions
GROUP BY state
ORDER BY total_transactions DESC;


-- Query 5: Funds with Expense Ratio Below 1%
SELECT f.scheme_name,
       f.fund_house,
       p.expense_ratio
FROM dim_fund f
JOIN fact_performance p ON f.amfi_code = p.amfi_code
WHERE p.expense_ratio < 1
ORDER BY p.expense_ratio;


-- Query 6: Top 10 Funds by 1-Year Returns
SELECT f.scheme_name,
       p.return_1y
FROM dim_fund f
JOIN fact_performance p ON f.amfi_code = p.amfi_code
ORDER BY p.return_1y DESC
LIMIT 10;


-- Query 7: Total SIP Inflow by Month
SELECT month,
       sip_inflow_crore
FROM monthly_sip_inflows
ORDER BY month;


-- Query 8: Category-wise Net Inflow
SELECT category,
       ROUND(SUM(net_inflow_crore), 2) AS total_net_inflow
FROM category_inflows
GROUP BY category
ORDER BY total_net_inflow DESC;


-- Query 9: Top 10 Stocks by Portfolio Weight
SELECT stock_name,
       stock_symbol,
       sector,
       ROUND(AVG(weight_pct), 2) AS average_weight
FROM portfolio_holdings
GROUP BY stock_name, stock_symbol, sector
ORDER BY average_weight DESC
LIMIT 10;


-- Query 10: Benchmark Index Performance by Year
SELECT index_name,
       strftime('%Y', date) AS year,
       ROUND(AVG(close_value), 2) AS average_close_value
FROM benchmark_indices
GROUP BY index_name, strftime('%Y', date)
ORDER BY year, index_name;


-- Query 11: Top 5 Fund Houses by AUM
SELECT
    fund_house,
    ROUND(MAX(aum_crore), 2) AS total_aum_crore
FROM fact_aum
GROUP BY fund_house
ORDER BY total_aum_crore DESC
LIMIT 5;


-- Query 12: Transaction Type-wise Analysis
SELECT
    transaction_type,
    COUNT(*) AS total_transactions,
    ROUND(SUM(amount_inr), 2) AS total_amount
FROM fact_transactions
GROUP BY transaction_type
ORDER BY total_amount DESC;


-- Query 13: Average Returns by Fund Category
SELECT
    f.category,
    ROUND(AVG(p.return_1y), 2) AS average_1y_return
FROM dim_fund f
JOIN fact_performance p
    ON f.amfi_code = p.amfi_code
GROUP BY f.category
ORDER BY average_1y_return DESC;


-- Query 14: Monthly Benchmark Index Performance
SELECT
    index_name,
    strftime('%Y-%m', date) AS month,
    ROUND(AVG(close_value), 2) AS average_close_value
FROM benchmark_indices
GROUP BY index_name, strftime('%Y-%m', date)
ORDER BY month, index_name;


-- Query 15: Sector-wise Portfolio Allocation
SELECT
    sector,
    ROUND(SUM(weight_pct), 2) AS total_weight_pct
FROM portfolio_holdings
GROUP BY sector
ORDER BY total_weight_pct DESC;