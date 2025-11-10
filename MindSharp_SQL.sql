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

-- 586. Customer Placing the Largest Number of Orders
SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(customer_number) DESC
LIMIT 1;

-- 595. Big Countries
SELECT name
From World
WHERE area>= 3000000 OR population>=25000000

-- 596. Classes With at Least 5 Students
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;

-- 610. Triangle Judgement
SELECT x, y, z,
       CASE
           WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
           ELSE 'No'
       END AS triangle
FROM Triangle;

-- 619. Biggest Single Number
SELECT 
    IFNULL(
        (SELECT num
         FROM MyNumbers
         GROUP BY num
         HAVING COUNT(num) = 1
         ORDER BY num DESC
         LIMIT 1),
        NULL
    ) AS num;

-- 620. Not Boring Movies
SELECT id, movie, description, rating
FROM Cinema
WHERE id MOD 2 != 0
  AND description != 'boring'
ORDER BY rating DESC;

-- 627. Swap Salary
UPDATE Salary
SET sex = CASE
             WHEN sex = 'm' THEN 'f'
             ELSE 'm'
          END;

-- 1050. Actors and Directors Who Cooperated At Least Three Times
SELECT actor_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(timestamp) > 2;

-- 1068. Product Sales Analysis I
SELECT p.product_name, s.year, s.price
FROM Product AS p
JOIN Sales AS s 
ON p.product_id = s.product_id;

-- 1075. Project Employees I
SELECT p.project_id ,  AVG(s.experience_years) AS average_years
FROM Product AS p
JOIN Employee AS s 
ON p.employee_id = s.employee_id;

-- 1075. Project Employees I
SELECT 
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project AS p
JOIN Employee AS e
ON p.employee_id = e.employee_id
GROUP BY p.project_id;

-- 1084. Sales Analysis III
SELECT p.product_id, p.product_name
FROM Product AS p
JOIN Sales AS s
  ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name
HAVING 
  MIN(s.sale_date) >= '2019-01-01'
  AND MAX(s.sale_date) <= '2019-03-31';


-- 1141. User Activity for the Past 30 Days I
SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;

-- 1148. Article Views I
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id;


-- 1179. Reformat Department Table
SELECT 
  id,
  SUM(CASE WHEN month = 'Jan' THEN revenue END) AS Jan_Revenue,
  SUM(CASE WHEN month = 'Feb' THEN revenue END) AS Feb_Revenue,
  SUM(CASE WHEN month = 'Mar' THEN revenue END) AS Mar_Revenue,
  SUM(CASE WHEN month = 'Apr' THEN revenue END) AS Apr_Revenue,
  SUM(CASE WHEN month = 'May' THEN revenue END) AS May_Revenue,
  SUM(CASE WHEN month = 'Jun' THEN revenue END) AS Jun_Revenue,
  SUM(CASE WHEN month = 'Jul' THEN revenue END) AS Jul_Revenue,
  SUM(CASE WHEN month = 'Aug' THEN revenue END) AS Aug_Revenue,
  SUM(CASE WHEN month = 'Sep' THEN revenue END) AS Sep_Revenue,
  SUM(CASE WHEN month = 'Oct' THEN revenue END) AS Oct_Revenue,
  SUM(CASE WHEN month = 'Nov' THEN revenue END) AS Nov_Revenue,
  SUM(CASE WHEN month = 'Dec' THEN revenue END) AS Dec_Revenue
FROM Department
GROUP BY id;

-- 1211. Queries Quality and Percentage
SELECT
  query_name,
  ROUND(AVG(rating * 1.0 / position), 2) AS quality,
  ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;

-- 1251. Average Selling Price
SELECT 
  p.product_id,
  ROUND(
    IFNULL(SUM(p.price * u.units) / SUM(u.units), 0),
  2) AS average_price
FROM Prices AS p
LEFT JOIN UnitsSold AS u
  ON p.product_id = u.product_id
  AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;

-- 1280. Students and Examinations
SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM Students AS s
CROSS JOIN Subjects AS sub
LEFT JOIN Examinations AS e
    ON s.student_id = e.student_id 
    AND sub.subject_name = e.subject_name
GROUP BY 
    s.student_id, s.student_name, sub.subject_name
ORDER BY 
    s.student_id, sub.subject_name;

-- 1327. List the Products Ordered in a Period
SELECT 
    p.product_name,
    SUM(o.unit) AS unit
FROM Products AS p
JOIN Orders AS o
    ON p.product_id = o.product_id
WHERE 
    o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY 
    p.product_name
HAVING 
    SUM(o.unit) >= 100;

-- 1378. Replace Employee ID With The Unique Identifier
SELECT u.unique_id, e.name
FROM Employees AS e
LEFT JOIN EmployeeUNI AS u
ON e.id = u.id;

-- 1407. Top Travellers
SELECT 
    u.name,
    COALESCE(SUM(r.distance), 0) AS travelled_distance
FROM Users AS u
LEFT JOIN Rides AS r
    ON u.id = r.user_id
GROUP BY u.name
ORDER BY travelled_distance DESC, u.name ASC;

-- 1484. Group Sold Products By The Date
SELECT 
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(DISTINCT product ORDER BY product ASC) AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;

-- 1517. Find Users With Valid E-Mails
SELECT user_id, name, mail
FROM Users
WHERE mail REGEXP '^[A-Za-z][A-Za-z0-9._-]*@leetcode\\.com$'
  AND BINARY RIGHT(mail, 13) = '@leetcode.com';

-- 1527. Patients With a Condition
SELECT patient_id, patient_name, conditions 
FROM Patients 
WHERE conditions LIKE 'DIAB1%' 
   OR conditions LIKE '% DIAB1%';

--1581. Customer Who Visited but Did Not Make Any Transactions
SELECT 
    v.customer_id,
    COUNT(v.visit_id) AS count_no_trans
FROM Visits AS v
LEFT JOIN Transactions AS t
    ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;

-- 1341. Movie Rating
(
  SELECT u.name AS results
  FROM MovieRating m
  JOIN Users u  ON u.user_id = m.user_id
  GROUP BY u.user_id, u.name
  ORDER BY COUNT(*) DESC, u.name ASC
  LIMIT 1
)
UNION ALL
(
  SELECT o.title AS results
  FROM MovieRating m
  JOIN Movies o ON o.movie_id = m.movie_id
  WHERE m.created_at >= '2020-02-01' AND m.created_at < '2020-03-01'
  GROUP BY o.movie_id, o.title
  ORDER BY AVG(m.rating) DESC, o.title ASC
  LIMIT 1
);



