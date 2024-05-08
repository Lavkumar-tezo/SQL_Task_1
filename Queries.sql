use Lavdb;

-- Select firstname, lastname, title, age, salary for everyone in your employee table
SELECT * from Employee;

-- Select firstname, age and salary for everyone in your employee table
SELECT FirstName, Age, Salary FROM Employee;

--Selct firstname and display as 'Name' for everyone in your employee table
SELECT FirstName as [Name] FROM Employee;

--Select firstname and lastname as 'Name' for everyone. Use " " (space) to separate firstname and last.
SELECT CONCAT(FirstName,' ',LastName) as [Name] FROM Employee;

-- Select all columns for everyone with a salary over 38000. 
SELECT * FROM Employee WHERE Salary > 38000;

-- Select first and last names for everyone that's under 24 years old.
SELECT FirstName, LastName FROM Employee WHERE Age< 24;

-- Select first name, last name, and salary for anyone with "Programmer" in their title. 
SELECT FirstName,LastName, Salary FROM Employee WHERE Title = 'Programmer';

-- Select all columns for everyone whose last name contains "O".
SELECT * FROM Employee WHERE LastName LIKE '%o%';

--  Select the lastname for everyone whose first name equals "Kelly". 
SELECT LastName FROM Employee WHERE FirstName='Kelly';

-- Select all columns for everyone whose last name ends in "Moore"
SELECT * FROM Employee WHERE LastName LIKE '%Moore';

-- 11. Select all columns for everyone who are 35 and above.
SELECT * FROM Employee WHERE Age >= 35;

-- Select firstname ,lastname,age and salary of everyone whose age is above 24 and below 43.
SELECT FirstName ,LastName,Age , Salary FROM Employee WHERE Age BETWEEN 25 AND 42;

-- Select firstname, title and lastname whose age is in the range 28 and 62 and salary greater than 31250
SELECT FirstName,Title,LastName FROM Employee WHERE (AGE BETWEEN 28 AND 62) AND Salary > 31250;

-- Select all columns for everyone whose age is not more than 48 and salary not less than 21520
SELECT * FROM Employee WHERE AGE<=48 AND Salary >= 21520;

-- Select firstname and age of everyone whose firstname starts with "John" and salary in the range 25000 and 35000
SELECT FirstName,Age FROM Employee WHERE FirstName LIKE 'John%' AND (Salary BETWEEN 25000 AND 35000);

-- Select all columns for everyone by their ages in descending order.
SELECT * FROM Employee ORDER BY Age DESC;

-- Select all columns for everyone by their ages in ascending order.
SELECT * FROM Employee ORDER BY Age;

-- Select all columns for everyone by their salaries in descending order.
SELECT * FROM Employee ORDER BY Salary DESC;

-- Select all columns for everyone by their salaries in ascending order.
SELECT * FROM Employee ORDER BY Salary;

-- Select all columns for everyone by their salaries in ascending order whose age not less than 17.
SELECT * FROM Employee WHERE Age >= 17 ORDER BY Salary;

-- Select all columns for everyone by their salaries in descending order whose age not more than 34
SELECT * FROM Employee WHERE Age > 34 ORDER BY Salary DESC;

-- Select all columns for everyone by their length of firstname in ascending order.
SELECT * FROM Employee ORDER BY LEN(FirstName);

-- Select the number of employees whose age is above 45
SELECT COUNT(*) as [EmployeeCount] from Employee WHERE Age > 45;

-- Show the results by adding 5 to ages and removing 250 from salaries of all employees
SELECT FirstName,LastName,Title,Age+5 as [Age],Salary-250 as [Salary]  FROM Employee;

-- Select the number of employees whose lastname ends with "re" or "ri" or "ks"
SELECT COUNT(*) as [EmployeeCount] FROM Employee WHERE LastName LIKE '%re' OR LastName LIKE '%ri' OR LastName LIKE '%ks';

-- Select the average salary of all your employees
SELECT AVG(Salary) as [AvgSalary] FROM Employee;

-- Select the average salary of Freshers
SELECT AVG(Salary) as [AvgSalary] FROM Employee WHERE Title='Fresher';

-- Select the average age of Programmers
SELECT AVG(Age) as [AvgAge] FROM Employee WHERE Title='Programmer';

-- Select the average salary of employees whose age is not less than 35 and not more than 50
SELECT AVG(Salary) as [AvgSalary] FROM Employee WHERE Age BETWEEN 35 AND 50;

-- Select the number of Freshers
SELECT COUNT(Title) FROM Employee WHERE Title='Fresher';

-- What percentage of programmers constitute your employees-- improvemnt
SELECT COUNT(*) * 100 / (SELECT COUNT(*) FROM Employee) FROM Employee WHERE Title='Programmer';

-- What is the combined salary that you need to pay to the employees whose age is not less than 40
SELECT SUM(Salary) as [CombinedSalary] FROM Employee WHERE Age>=40;

-- What is the combined salary that you need to pay to all the Freshers and Programmers for 1 month
SELECT SUM(Salary)/ 12 as [CombinedSalary] FROM Employee WHERE Title='Fresher' OR Title='Programmer';

-- What is the combined salary that you need to pay to all the Freshers whose age is greater than 27 for 3years 
SELECT SUM(Salary) * 3 as [Combined_Salary] FROM Employee WHERE Age > 27 AND Title='Fresher';

-- Select the eldest employee 's firstname, lastname and age whose salary is less than 35000
SELECT TOP 1 FirstName,LastName,Age FROM Employee Where Salary<35000 ORDER BY Age DESC;

-- Who is the youngest General Manager
SELECT TOP 1 * FROM Employee WHERE Title='General Manager' ORDER BY Age;

-- Select the eldest fresher whose salary is less than 35000
SELECT TOP 1 * FROM Employee WHERE Salary < 35000 AND Title='Fresher' ORDER BY Age DESC;

-- Select firstname and age of everyone whose firstname starts with "John" or "Michael" and salary in the  range 17000 and 26000
SELECT FirstName,Age from Employee WHERE FirstName Like 'John%' OR FirstName Like 'Michael%' AND Salary BETWEEN 17000 AND 26000;

-- How many employees are having each unique title. Select the title and display the number of employees present in ascending order
SELECT Title,COUNT(*) as [TotalEmployee]  FROM Employee GROUP BY Title ORDER BY TotalEmployee; 

-- What is the average salary of each unique title of the employees. Select the title and display the average salary of employees in each
SELECT Title,AVG(Salary) as [AvgSalary]  FROM Employee GROUP BY Title;

-- What is the average salary of employees excluding Freshers
SELECT AVG(Salary) as [AvgSalary] FROM Employee WHERE Title  != 'Fresher';

-- What is the average age of employees of each unique title.
SELECT Title,AVG(Age) as [AvgAge]  FROM Employee GROUP BY Title;

-- In the age range of 25 to 40 get the number of employees under each unique title.
SELECT Title,Count(*) as [EmployeeCount]  FROM Employee WHERE Age BETWEEN 25 AND 40 GROUP BY Title;

-- Show the average salary of each unique title of employees only if the average salary is not less than 25000
SELECT Title,AVG(Salary) as [AvgSalary] FROM Employee GROUP BY Title HAVING AVG(Salary) >= 25000;

-- Show the sum of ages of each unique title of employee only if the sum of age is greater than 30
SELECT SUM(Age) as [TotalAge] FROM Employee GROUP BY Title HAVING SUM(Age) >= 30;

-- Using 'Update'
-- Lisa Ray just got married to Michael Moore. She has requested that her last name be updated to Moore.
UPDATE Employee SET LastName='Moore' WHERE FirstName='Lisa' AND LastName='Ray';
SELECT * FROM Employee;

-- Ginger Finger's birthday is today, add 1 to his age and a bonus of 5000
UPDATE Employee SET Age=Age+1,Salary=Salary+ 5000 WHERE FirstName='Ginger' AND LastName='Finger';
SELECT * FROM Employee;

-- All 'Programmer's are now called "Engineer"s. Update all titles accordingly. 
UPDATE Employee SET Title='Engineer' WHERE Title='Programmer';
SELECT * FROM Employee;

-- Everyone whose making under 30000 are to receive a 3500 bonus. 
UPDATE Employee SET Salary=Salary+ 3500 WHERE Salary < 30000;
SELECT * FROM Employee;

-- Everyone whose making over 35500 are to be deducted 15% of their salaries
UPDATE Employee SET Salary=Salary - (Salary * 15 /100) WHERE Salary > 35000;
SELECT * FROM Employee;