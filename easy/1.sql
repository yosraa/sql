# Write an SQL query to report the second highest salary from the Employee table. If there is no second highest salary, the query should report null.

SELECT MAX(DISTINCT salary) as SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee)

# another solution
select (select distinct salary from Employee
order by salary desc limit 1,1) as SecondHighestSalary;

# Sliding window
select
    ifnull(
        (select salary from
            (select * ,
            dense_rank() over (order by salary desc ) as "Ranking"
            from employee) as t1
            where ranking = 2 limit 1 )
    ,null) as "SecondHighestSalary"
