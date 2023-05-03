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


# window function

SELECT *,
COUNT(*) OVER(PARTITION BY TIV_2015) AS CNT1,
COUNT(*) OVER(PARTITION BY LAT, LON) AS CNT2
FROM INSURANCE

| pid | tiv_2015 | tiv_2016 | lat | lon | CNT1 | CNT2 |
| --- | -------- | -------- | --- | --- | ---- | ---- |
| 1   | 10       | 5        | 10  | 10  | 3    | 1    |
| 3   | 10       | 30       | 20  | 20  | 3    | 2    |
| 2   | 20       | 20       | 20  | 20  | 1    | 2    |
| 4   | 10       | 40       | 40  | 40  | 3    | 1    |

SELECT ROUND(SUM(TIV_2016),2) AS TIV_2016
FROM
(SELECT *,
COUNT(*) OVER(PARTITION BY TIV_2015) AS CNT1,
COUNT(*) OVER(PARTITION BY LAT, LON) AS CNT2
FROM INSURANCE
) AS TBL
WHERE TBL.CNT1 >= 2 AND TBL.CNT2 = 1


