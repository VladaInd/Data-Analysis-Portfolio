CREATE TABLE banking_data_analysis (
    id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    gender VARCHAR(50),
    ip_address VARCHAR(50),
    account_number BIGINT,
    account_type VARCHAR(50),
    balance DECIMAL(15, 2),
    last_transaction_date DATE,
    interest_rate DECIMAL(5, 2),
    loan_amount DECIMAL(15, 2),
    loan_type VARCHAR(50),
    credit_score INT,
    credit_limit DECIMAL(15, 2),
    payment_due_date DATE
);
