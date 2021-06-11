-- Table: Weather

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | recordDate    | date    |
-- | temperature   | int     |
-- +---------------+---------+
-- id is the primary key for this table.
-- This table contains information about the temperature in a certain day.
 

-- Write an SQL query to find all dates' id with higher temperature compared to its previous dates (yesterday).

-- Return the result table in any order.

-- The query result format is in the following example:

-- Weather
-- +----+------------+-------------+
-- | id | recordDate | Temperature |
-- +----+------------+-------------+
-- | 1  | 2015-01-01 | 10          |
-- | 2  | 2015-01-02 | 25          |
-- | 3  | 2015-01-03 | 20          |
-- | 4  | 2015-01-04 | 30          |
-- +----+------------+-------------+

-- Result table:
-- +----+
-- | id |
-- +----+
-- | 2  |
-- | 4  |
-- +----+


-- Solution 1: 

WITH A AS
(SELECT
    id,
    temperature - LAG(temperature,1) OVER (ORDER BY recordDate) AS temp,
    DATEDIFF(recordDate, LAG(recordDate,1) OVER (ORDER BY recordDate)) AS daydiff
FROM
    Weather)
    
SELECT 
    id
FROM
    A 
WHERE
    temp > 0 AND daydiff = 1;

             
-- Solution 2: 
             
SELECT
    weather.id AS 'Id'
FROM
    weather
        JOIN
    weather w ON DATEDIFF(weather.recordDate, w.recordDate) = 1
        AND weather.Temperature > w.Temperature;
