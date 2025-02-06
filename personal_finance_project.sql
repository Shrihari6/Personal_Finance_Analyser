

CREATE DATABASE PersonalFinanceHealth;
USE PersonalFinanceHealth;



CREATE TABLE Users (
    User_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_name VARCHAR(50) NOT NULL UNIQUE,
    Role ENUM('Admin', 'User') NOT NULL,
    Password VARCHAR(255) NOT NULL
);

CREATE TABLE Income (
    Income_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Source VARCHAR(100) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Date DATE NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE
);

CREATE TABLE Expenses (
    Expense_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Category VARCHAR(100) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Date DATE NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE
);

CREATE TABLE Savings (
    Saving_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Account_type VARCHAR(50) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Date DATE NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE
);


CREATE TABLE Investments (
    Investment_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Type VARCHAR(50) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Return_rate DECIMAL(5,2) NOT NULL,
    Date DATE NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE
);

CREATE TABLE Debts (
    Debt_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Type VARCHAR(50) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Interest_rate DECIMAL(5,2) NOT NULL,
    Due_date DATE NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE
);

CREATE TABLE FinancialHealth (
    Health_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Score INT NOT NULL CHECK (Score BETWEEN 0 AND 100),
    Date DATE NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE
);

INSERT INTO Users (Username, Role, Password) VALUES
('Alice', 'Admin', 'password123'),
('Bob', 'User', 'securepass'),
('Charlie', 'User', 'charliepass'),
('David', 'User', 'davidpass'),
('Emma', 'User', 'emmapass'),
('Frank', 'User', 'frankpass'),
('Grace', 'User', 'gracepass'),
('Hannah', 'User', 'hannahpass'),
('Isaac', 'User', 'isaacpass'),
('Jack', 'User', 'jackpass');


INSERT INTO Income (User_ID, Source, Amount, Date) VALUES
(2, 'Salary', 5000, '2025-01-01'),
(3, 'Freelance', 2000, '2025-01-10'),
(4, 'Business', 8000, '2025-01-15'),
(5, 'Salary', 6000, '2025-01-20'),
(6, 'Freelance', 3000, '2025-01-25'),
(7, 'Business', 9000, '2025-01-28'),
(8, 'Salary', 5500, '2025-02-01'),
(9, 'Freelance', 2500, '2025-02-05'),
(10, 'Business', 7000, '2025-02-10'),
(3, 'Salary', 4800, '2025-02-15');

INSERT INTO Expenses (User_ID, Category, Amount, Date) VALUES
(2, 'Rent', 1200, '2025-01-05'),
(3, 'Groceries', 500, '2025-01-08'),
(4, 'Transport', 300, '2025-01-12'),
(5, 'Shopping', 800, '2025-01-18'),
(6, 'Healthcare', 400, '2025-01-22'),
(7, 'Entertainment', 600, '2025-01-26'),
(8, 'Rent', 1300, '2025-02-02'),
(9, 'Groceries', 550, '2025-02-06'),
(10, 'Transport', 350, '2025-02-11'),
(3, 'Shopping', 900, '2025-02-16');

INSERT INTO Savings (User_ID, Account_type, Amount, Date) VALUES
(2, 'Bank Savings', 5000, '2025-01-07'),
(3, 'Fixed Deposit', 7000, '2025-01-14'),
(4, 'Bank Savings', 6000, '2025-01-20'),
(5, 'Mutual Funds', 8000, '2025-01-25'),
(6, 'Bank Savings', 7500, '2025-01-30'),
(7, 'Fixed Deposit', 9000, '2025-02-03'),
(8, 'Mutual Funds', 8500, '2025-02-07'),
(9, 'Bank Savings', 7000, '2025-02-10'),
(10, 'Fixed Deposit', 9500, '2025-02-15'),
(3, 'Mutual Funds', 8800, '2025-02-18');

INSERT INTO Investments (User_ID, Type, Amount, Return_rate, Date) VALUES
(2, 'Stocks', 5000, 8.5, '2025-01-09'),
(3, 'Bonds', 3000, 6.2, '2025-01-16'),
(4, 'Real Estate', 10000, 10.0, '2025-01-22'),
(5, 'Mutual Funds', 7000, 7.5, '2025-01-27'),
(6, 'Stocks', 6000, 9.0, '2025-02-01'),
(7, 'Bonds', 4000, 5.8, '2025-02-04'),
(8, 'Real Estate', 12000, 11.2, '2025-02-08'),
(9, 'Mutual Funds', 7500, 7.0, '2025-02-12'),
(10, 'Stocks', 5500, 8.0, '2025-02-17'),
(3, 'Bonds', 3500, 6.5, '2025-02-19');

INSERT INTO Debts (User_ID, Type, Amount, Interest_rate, Due_date) VALUES
(2, 'Credit Card', 2000, 15.0, '2025-02-01'),
(3, 'Student Loan', 5000, 5.5, '2025-06-01'),
(4, 'Home Loan', 15000, 7.0, '2025-12-01'),
(5, 'Car Loan', 10000, 6.5, '2025-09-01'),
(6, 'Credit Card', 2500, 14.0, '2025-02-20'),
(7, 'Student Loan', 6000, 5.8, '2025-07-01'),
(8, 'Home Loan', 14000, 7.2, '2025-11-01'),
(9, 'Car Loan', 9500, 6.0, '2025-08-01'),
(10, 'Credit Card', 1800, 16.0, '2025-03-01'),
(3, 'Personal Loan', 4000, 9.0, '2025-04-01');

INSERT INTO FinancialHealth (User_ID, Score, Date) VALUES
(2, 85, '2025-01-31'),
(3, 75, '2025-01-31'),
(4, 90, '2025-01-31'),
(5, 80, '2025-01-31'),
(6, 70, '2025-01-31'),
(7, 95, '2025-01-31'),
(8, 78, '2025-01-31'),
(9, 88, '2025-01-31'),
(10, 83, '2025-01-31'),
(3, 76, '2025-02-01');




select users.User_name, sum(Income.amount) - sum(Expense.amount) as Net_monthly_Income 
from users left join income on Users.User_id = Income.User_id 
left join Expense on Users.User_id = Expense.User_id 
where Income.date between '2023-10-01' and '2023-10-31' 
group by Users.User_id;


select users.User_name, debts.type, debts.amount, debts.interest_rate 
from debts inner join users on debts.user_id = users.user_id 
where debts.interest_rate > 10 
order by debts.interest_rate desc;


Select users.user_id, (sum(income.amount) - sum(expense.amount) - sum(debts.amount)) / sum(income.amount) * 100 as Score, Now() 
from users left join Income on users.user_id = income.user_id 
left join Expense on users.user_id = expense.user_id 
left join debts on users.user_id = debts.user_id 
group by users.user_id;


SELECT users.user_name, expense.category, avg(expense.amount) as AVG_Spending 
from expense inner join Users on users.user_id = expense.user_id 
group by users.user_id  Expense.category having AVG_Spending > (Select avg(amount) 
from expense where category = ‘Entertainment’);


select users.User_name, savings.account_type, (savings.amount ) (select sum(amount) 
from savings where user_id = savings.user_id) * 100 as SAVINGS_GROWTH_RATE from savings 
inner join users on savings.user_id = users.user_id;

Create user ‘admin’@’localhost’ identified by ‘admin123’;
Show grants for ‘admin’@’localhost’;
Grant all privileges on personalfinancehealth .* to ‘admin’@’localhost’ with grant option;
Select users, host from mysql user;
create user 'user'@'localhost' identified by'user123';
grant select on personalfinancehealth.* to 'user'@'localhost';



start transaction;
select * from savings;
select * from debts;
SAVEPOINT s3;
update savings set amount = amount - 1000.00 where user_id = 1 and Account_type = 'emergency fund';
SAVEPOINT s4;
update debts set amount = amount - 1000.00 where user_id = 1;
COMMIT;





start transaction;
select * from savings;
select * from income;
SAVEPOINT s1;
insert into income (User_id, source, amount, date) values (1, ‘Side-Hustle’, 9000, ‘2023-10-09’):
SAVEPOINT s2;
update savings set amount=amount + 9000.00 where User_id =1 and Account_type = ‘Emergency Funds’;
COMMIT;





start transaction;
select * from savings;
SAVEPOINT s5;
update savings set amount = amount - 5000.00 where user_id = 1 and Account_type = 'emergency fund';
SAVEPOINT s6;
update savings set amount = amount + 5000.00 where user_id = 1 and Account_type = 'Retirement';
COMMIT;






start transaction;
select * from savings;
select * from investment;
SAVEPOINT s7;
update savings set amount = amount - 2000.00 where user_id = 1 and Account_type = 'Emergency fund';
SAVEPOINT s8;
insert into investments (user_id, type, amount, Return_rate, date) values (1,'Mutual Funds',2000.00, 600, '2023-10-13');
COMMIT;
