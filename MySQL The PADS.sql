
/*

https://www.hackerrank.com/challenges/the-pads/problem

Generate the following two result sets:

Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format: 

There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

Note: There will be at least two entries in the table for each type of occupation.

*/


select name from
(select 1 ord, concat(Name, '(', LEFT(occupation,1), ')') as name from Occupations 
union all
select 2 ord, concat('There are a total of ',count(1),' ',lower(occupation),'s.') as name from Occupations group by occupation )x
 order by ord, name
 
 #OR
 
 SELECT * FROM (
  SELECT CONCAT(name, '(', SUBSTRING(occupation, 1, 1), ')')
  FROM occupations
  ORDER BY name ASC
) temp1
UNION
SELECT * FROM (
  SELECT concat('There are total ', count(*), ' ', LOWER(occupation), 's.')
  FROM occupations
  GROUP BY occupation
  ORDER BY COUNT(*)
) temp2

#OR

SELECT CONCAT(NAME, '(',LEFT(OCCUPATION,1),')')
FROM OCCUPATIONS
ORDER BY NAME;

SELECT CONCAT('There are total ',COUNT(OCCUPATION), ' ', LOWER(OCCUPATION),'s.')
FROM OCCUPATIONS
GROUP BY OCCUPATION
ORDER BY COUNT(OCCUPATION), OCCUPATION;
