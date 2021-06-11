- Write a SQL query to get the second highest salary from the Employee table.

-- +----+--------+
-- | Id | Salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
-- For example, given the above Employee table, the query should return 200 as the second highest salary. If there is no second highest salary, then the query should return null.

-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | 200                 |
-- +---------------------+


-- Solution 1:

SELECT 
    IFNULL((SELECT
                DISTINCT Salary 
            FROM
                (SELECT 
                    Salary,
                    RANK() OVER(ORDER BY Salary DESC) AS ranking
                  FROM 
                    Employee) AS A
            WHERE 
                ranking = 2), NULL) AS SecondHighestSalary

-- Solution 2:

SELECT
  MAX(Salary) AS SecondHighestSalary
FROM
  Employee
WHERE
  Salary < (SELECT
              MAX(Salary) 
            FROM
              Employee
           )
