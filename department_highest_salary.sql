/* Write your T-SQL query statement below */

SELECT
    *,
    DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY salary DESC) RANKED
FROM
    Employee


| id | name  | salary | departmentId | RANKED |
| -- | ----- | ------ | ------------ | ------ |
| 2  | Jim   | 90000  | 1            | 1      |
| 5  | Max   | 90000  | 1            | 1      |
| 1  | Joe   | 70000  | 1            | 2      |
| 3  | Henry | 80000  | 2            | 1      |
| 4  | Sam   | 60000  | 2            | 2      |

/* Write an SQL query to find employees who have the highest salary in each of the departments. */



WITH CTE AS (SELECT
    *,
    DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY salary DESC) RANKED
FROM
    Employee
)

SELECT 
    d.name Department ,
    c.name Employee,
    c.salary
FROM CTE c
INNER JOIN
    Department d on c.departmentid = d.id
WHERE
      c.ranked = 1
 
 Employee =
| id | name  | salary | departmentId |
| -- | ----- | ------ | ------------ |
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |

Department =
| id | name  |
| -- | ----- |
| 1  | IT    |
| 2  | Sales |

Output
| Department | Employee | salary |
| ---------- | -------- | ------ |
| IT         | Jim      | 90000  |
| IT         | Max      | 90000  |
| Sales      | Henry    | 80000  |
