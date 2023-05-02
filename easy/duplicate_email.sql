# Write an SQL query to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.

select email as Email
from person
group by email
having count(email) > 1

# Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id. 
# Note that you are supposed to write a DELETE statement and not a SELECT one.
# After running your script, the answer shown is the Person table. 
# The driver will first compile and run your piece of code and then show the Person table. The final order of the Person table does not matter.

DELETE p1 FROM Person p1,
    Person p2
WHERE
    p1.Email = p2.Email AND p1.Id > p2.Id
