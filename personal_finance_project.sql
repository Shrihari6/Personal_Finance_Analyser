

use personalfinancehealth;



select users.User_name, sum(Income.amount) - sum(Expense.amount) as Net_monthly_Income from users left join income on Users.User_id = Income.User_id left join Expense on Users.User_id = Expense.User_id where Income.date between '2023-10-01' and '2023-10-31' group by Users.User_id;

select users.User_name, debts.type, debts.amount, debts.interest_rate from debts inner join users on debts.user_id = users.user_id where debts.interest_rate > 10 order by debts.interest_rate desc;

Select users.user_id, (sum(income.amount) - sum(expense.amount) - sum(debts.amount)) / sum(income.amount) * 100 as Score, Now() from users left join Income on users.user_id = income.user_id left join Expense on users.user_id = expense.user_id left join debts on users.user_id = debts.user_id group by users.user_id;


SELECT users.user_name, expense.category, avg(expense.amount) as AVG_Spending from expense inner join Users on users.user_id = expense.user_id group by users.user_id  Expense.category having AVG_Spending > (Select avg(amount) from expense where category = ‘Entertainment’);


select users.User_name, savings.account_type, (savings.amount ) (select sum(amount) from savings where user_id = savings.user_id) * 100 as SAVINGS_GROWTH_RATE from savings inner join users on savings.user_id = users.user_id;




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
