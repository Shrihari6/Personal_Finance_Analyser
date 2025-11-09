


# Personal Finance Analyser

**Personal Finance Analyser** helps users assess their financial health by tracking income, expenses, savings, and budgets. The project calculates a **financial health score** based on user data to provide insights on improving their financial 
well-being.

<img width="1355" height="785" alt="Screenshot 2025-11-09 182846" src="https://github.com/user-attachments/assets/cd0855a5-ee98-4ec6-92e2-604a5ec38cee" />

## Features
- **Income and Expense Tracking**: Record and categorize income and expenses.
- **Budget Management**: Set and track monthly/yearly budgets.
- **Financial Health Score**: A score reflecting overall financial health based on your data.
- **Reports and Analytics**: View financial health reports and track progress.
- **Database-Driven**: Utilizes MySQL for data storage and management.

## Tech Stack
- **MySQL**: Database for secure data storage and management.
- **SQL**: `.sql` file containing all database commands for setting up the schema and structure.

## Installation

### Prerequisites
- MySQL (or MariaDB) installed on your machine.

### Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/Shrihari6/Personal_Finance_Analyser.git
   cd Personal_Finance_Analyser
   ```

2. Create the MySQL database:
   ```sql
   CREATE DATABASE personalfinancehealth;
   ```

3. Import the database schema using the provided `.sql` file:
   ```bash
   mysql -u root -p personalfinancehealth < personal_finance_project.sql
   ```

4. Configure your backend logic to connect to the `personalfinancehealth` database using your preferred programming language or tools.

### Usage
1. Set up a backend system (e.g., Node.js, Python, etc.) to interact with the MySQL database.
2. Log and categorize income, expenses, savings, debts and investments.
3. Calculate and analyze your **financial health score** based on entered data.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
