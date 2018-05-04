/*

Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy: 

Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

Note:

The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.

https://www.hackerrank.com/challenges/the-company/problem

*/

select c.company_code, c.founder
,count(distinct lm.Lead_Manager_code) lm
,count(distinct sm.Senior_Manager_code) sm
,count(distinct m.Manager_code) m
,count(distinct e.Employee_code) e
from Company c
inner join Lead_Manager lm on  c.company_code = lm.company_code
inner join Senior_Manager sm on lm.Lead_Manager_code = sm.Lead_Manager_code
inner join Manager m on sm.Senior_Manager_code = m.Senior_Manager_code
inner join Employee e on m.Manager_code = e.Manager_code
group by c.company_code, c.founder
order by c.company_code

