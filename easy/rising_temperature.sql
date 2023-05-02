# Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

select w.id
from weather w , weather we 
where w.temperature > we.temperature and datediff(w.recordDate , we.recordDate ) = 1



select *
from weather w , weather we 
where w.temperature > we.temperature  

| id | recordDate | temperature | id | recordDate | temperature |
| -- | ---------- | ----------- | -- | ---------- | ----------- |
| 4  | 2015-01-04 | 30          | 1  | 2015-01-01 | 10          |
| 3  | 2015-01-03 | 20          | 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          | 1  | 2015-01-01 | 10          |
| 4  | 2015-01-04 | 30          | 2  | 2015-01-02 | 25          |
| 4  | 2015-01-04 | 30          | 3  | 2015-01-03 | 20          |
| 2  | 2015-01-02 | 25          | 3  | 2015-01-03 | 20          |




select *
from weather w , weather we 
where w.temperature > we.temperature and datediff(w.recordDate , we.recordDate ) = 1


| id | recordDate | temperature | id | recordDate | temperature |
| -- | ---------- | ----------- | -- | ---------- | ----------- |
| 2  | 2015-01-02 | 25          | 1  | 2015-01-01 | 10          |
| 4  | 2015-01-04 | 30          | 3  | 2015-01-03 | 20          |



# rank salaries by id
with t as(
    select salary, rank() over(order by salary desc) as rnk
    from Employee)

select * 
from t

| salary | rnk |
| ------ | --- |
| 300    | 1   |
| 200    | 2   |
| 100    | 3   |
