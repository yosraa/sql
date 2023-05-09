# Write an SQL query to report the first name, last name, city, and state of each person in the Person table. 
# If the address of a personId is not present in the Address table, report null instead

select p.firstName, p.lastName, a.city, a.state
from person p  left join address a on p.personId = a.personId
