# Write an SQL query to show the unique ID of each user, If a user does not have a unique ID replace just show null.
#  unique_id

select u.unique_id, e.name
from Employees e left join EmployeeUNI u on e.id = u.id
