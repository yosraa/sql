# Write an SQL query to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:

# have the same tiv_2015 value as one or more other policyholders, and
# are not located in the same city like any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
# Round tiv_2016 to two decimal places.

SELECT ROUND(SUM(tiv_2016),2) as tiv_2016
FROM insurance i1
WHERE tiv_2015 IN (SELECT tiv_2015 FROM insurance i2
                   WHERE i1.pid != i2.pid)
AND (lat, lon) NOT IN (SELECT lat, lon FROM insurance i3
                       WHERE i3.pid != i1.pid)
