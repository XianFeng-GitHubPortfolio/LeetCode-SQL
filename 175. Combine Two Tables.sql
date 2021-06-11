-- Table: Person

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | PersonId    | int     |
-- | FirstName   | varchar |
-- | LastName    | varchar |
-- +-------------+---------+
-- PersonId is the primary key column for this table.
-- Table: Address

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | AddressId   | int     |
-- | PersonId    | int     |
-- | City        | varchar |
-- | State       | varchar |
-- +-------------+---------+
-- AddressId is the primary key column for this table.
 

-- Write a SQL query for a report that provides the following information for each person in the Person table, regardless if there is an address for each of those people:
-- FirstName, LastName, City, State


SELECT
    p.FirstName, 
    p.LastName, 
    IFNULL(a.City, NULL) AS City,
    IFNULL(a.State, NULL) AS State 
FROM 
    Person AS p LEFT JOIN Address AS a ON p.PersonId = a.PersonId
    

-- We use LEft JOIN because we want to provide the information for EACH person in the person table.
