
-- Enable Foreign Key Constraints
PRAGMA foreign_keys = ON;


-- 1. Fund Dimension Table
-- Stores basic information about mutual fund schemes,
-- including scheme name, fund house, category and plan.

CREATE TABLE IF NOT EXISTS dim_fund (
    amfi_code TEXT PRIMARY KEY,
    scheme_name TEXT NOT NULL,
    fund_house TEXT,
    category TEXT,
    sub_category TEXT,
    plan TEXT
);


-- 2. Date Dimension Table
-- Stores calendar information such as date, day, month,
-- quarter and year for time-based analysis.

CREATE TABLE IF NOT EXISTS dim_date (
    date_id INTEGER PRIMARY KEY,
    full_date DATE NOT NULL UNIQUE,
    day INTEGER,
    month INTEGER,
    month_name TEXT,
    quarter INTEGER,
    year INTEGER
);


-- 3. NAV Fact Table
-- Stores daily Net Asset Value (NAV) records for each
-- mutual fund scheme along with daily returns.

CREATE TABLE IF NOT EXISTS fact_nav (
    nav_id INTEGER PRIMARY KEY AUTOINCREMENT,
    amfi_code TEXT NOT NULL,
    nav_date DATE NOT NULL,
    nav REAL NOT NULL CHECK (nav > 0),
    daily_return REAL,

    FOREIGN KEY (amfi_code)
        REFERENCES dim_fund(amfi_code),

    FOREIGN KEY (nav_date)
        REFERENCES dim_date(full_date),

    UNIQUE (amfi_code, nav_date)
);


-- 4. Transactions Fact Table
-- Stores investor transaction details, including SIP,
-- Lumpsum, Redemption, amount and investor information.

CREATE TABLE IF NOT EXISTS fact_transactions (
    transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,
    investor_id TEXT NOT NULL,
    transaction_date DATE NOT NULL,
    amfi_code TEXT NOT NULL,
    transaction_type TEXT NOT NULL
        CHECK (transaction_type IN ('SIP', 'Lumpsum', 'Redemption')),
    amount_inr REAL NOT NULL CHECK (amount_inr > 0),
    state TEXT,
    city TEXT,
    city_tier TEXT,
    age_group TEXT,
    gender TEXT,
    annual_income_lakh REAL,
    payment_mode TEXT,
    kyc_status TEXT,

    FOREIGN KEY (amfi_code)
        REFERENCES dim_fund(amfi_code),

    FOREIGN KEY (transaction_date)
        REFERENCES dim_date(full_date)
);


-- 5. Performance Fact Table
-- Stores mutual fund performance and risk metrics,
-- including returns, Sharpe ratio, beta and expense ratio.

CREATE TABLE IF NOT EXISTS fact_performance (
    performance_id INTEGER PRIMARY KEY AUTOINCREMENT,
    amfi_code TEXT NOT NULL,
    return_1yr_pct REAL,
    return_3yr_pct REAL,
    return_5yr_pct REAL,
    benchmark_3yr_pct REAL,
    alpha REAL,
    beta REAL,
    sharpe_ratio REAL,
    sortino_ratio REAL,
    std_dev_ann_pct REAL,
    max_drawdown_pct REAL,
    aum_crore REAL,
    expense_ratio_pct REAL,
    morningstar_rating INTEGER,
    risk_grade TEXT,

    FOREIGN KEY (amfi_code)
        REFERENCES dim_fund(amfi_code),

    UNIQUE (amfi_code)
);


-- 6. AUM Fact Table
-- Stores Assets Under Management (AUM) for different
-- fund houses across reporting years.

CREATE TABLE IF NOT EXISTS fact_aum (
    aum_id INTEGER PRIMARY KEY AUTOINCREMENT,
    fund_house TEXT NOT NULL,
    report_year INTEGER NOT NULL,
    aum_crore REAL NOT NULL,

    
);
