-- Write a SQL query to find all duplicate emails in a table named Person.

-- +----+---------+
-- | Id | Email   |
-- +----+---------+
-- | 1  | a@b.com |
-- | 2  | c@d.com |
-- | 3  | a@b.com |
-- +----+---------+
-- For example, your query should return the following for the above table:

-- +---------+
-- | Email   |
-- +---------+
-- | a@b.com |
-- +---------+


SELECT DISTINCT
    Email
FROM
    Person
WHERE
    Email NOT IN (SELECT P1.Email, COUNT(P1.Email)
                  FROM Person AS P1 JOIN Person AS P2 ON (P1.Email = P2.Email)
                  GROUP BY P1.Email
                  HAVING COUNT(P1.Email) = 1)
