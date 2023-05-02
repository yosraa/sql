# Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

select w.id
from weather w , weather we 
where w.temperature > we.temperature and datediff(w.recordDate , we.recordDate ) = 1
