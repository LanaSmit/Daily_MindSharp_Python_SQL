-- 175. Combine Two Tables

SELECT p.firstName,p.lastName, a.city,a.state
FROM Person AS p
LEFT JOIN Address a
    ON p.personId = a.personId;

-- 176. Second Highest Salary

SELECT (SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1 ) AS SecondHighestSalary;

--181. Employees Earning More Than Their Managers
SELECT e.name AS Employee
FROM Employee e
JOIN Employee m
  ON e.managerId = m.id
WHERE e.salary > m.salary;

--183. Customers Who Never Order
SELECT c.name AS Customers
FROM Customers as c
LEFT JOIN Orders AS o
ON c.id=o.customerId
WHERE o.customerId IS NULL

--196. Delete Duplicate Emails
DELETE FROM Person
WHERE id NOT IN (
  SELECT * FROM (
    SELECT MIN(id)
    FROM Person
    GROUP BY email
  ) AS temp
);

--197. Rising Temperature
SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;

--511. Game Play Analysis I
SELECT player_id,
       MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;

--577. Employee Bonus
SELECT e.name, b.bonus
FROM Employee AS e
LEFT JOIN Bonus AS b
ON e.empId = b.empId 
WHERE b.bonus < 1000 OR b.bonus IS NULL;

--584. Find Customer Referee
SELECT name
FROM Customer AS c
WHERE c.referee_id != 2 OR c.referee_id IS NULL;

--607. Sales Person
SELECT s.name
FROM SalesPerson AS s
WHERE s.sales_id NOT IN (SELECT o.sales_id FROM Orders AS o
LEFT JOIN Company AS c
ON o.com_id = c.com_id
WHERE c.name = "RED");