# Write an SQL query to report all customers who never order anything.

select name as Customers
 from 
Customers where 
id not in (select customerId 
from Orders )

#  Another solution

SELECT *
FROM Customers c left JOIN Orders o 
ON c.id=o.customerId 

| id | name  | id   | customerId |
| -- | ----- | ---- | ---------- |
| 1  | Joe   | 2    | 1          |
| 2  | Henry | null | null       |
| 3  | Sam   | 1    | 3          |
| 4  | Max   | null | null       |


SELECT *
FROM Customers c left JOIN Orders o 
ON c.id=o.customerId 
WHERE o.customerId IS NULL;

| id | name  | id   | customerId |
| -- | ----- | ---- | ---------- |
| 2  | Henry | null | null       |
| 4  | Max   | null | null       |

SELECT c.name as Customers
FROM Customers c left JOIN Orders o 
ON c.id=o.customerId 
WHERE o.customerId IS NULL;
