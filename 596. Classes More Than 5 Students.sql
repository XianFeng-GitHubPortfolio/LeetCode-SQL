-- We had to make sure duplicate students' courses was not counted

-- There is a table courses with columns: student and class
-- Please list out all classes which have more than or equal to 5 students.

-- For example, the table:

-- +---------+------------+
-- | student | class      |
-- +---------+------------+
-- | A       | Math       |
-- | B       | English    |
-- | C       | Math       |
-- | D       | Biology    |
-- | E       | Math       |
-- | F       | Computer   |
-- | G       | Math       |
-- | H       | Math       |
-- | I       | Math       |
-- +---------+------------+
-- Should output:

-- +---------+
-- | class   |
-- +---------+
-- | Math    |
-- +---------+
 

-- Note:
-- The students should not be counted duplicate in each course.

-- Solution 1:

WITH A AS
(SELECT
    DISTINCT student, 
    class
 FROM 
    courses
),

B AS
(SELECT
    class,
    COUNT(class) AS num
 FROM
    A
 GROUP BY 
    class
)
    
SELECT 
    class
FROM
    B
WHERE
    num >= 5
    
-- Solution 2: 

SELECT
    class
FROM
    courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5
;
