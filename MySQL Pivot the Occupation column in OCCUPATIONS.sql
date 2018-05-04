/*

Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.

*/


select MIN(Doctor), Min(Professor), Min(Singer), Min(Actor)
from
(select 
    case when occupation = 'Doctor' then Name else NUll end as "Doctor",
    case when occupation = 'Professor' then Name else NUll end as "Professor",
    case when occupation = 'Singer' then Name else NUll end as "Singer",
    case when occupation = 'Actor' then Name else NUll end as "Actor",
    
    case occupation when 'Doctor' then @d:= @d + 1 
    when 'Professor' then @p:= @p + 1
    when 'Singer' then @s:= @s + 1
    when 'Actor' then @a:= @a + 1 else NULL end as idn
from occupations o, (select @d:=0, @p:=0, @s:=0, @a:=0) x
order by Name)t
group by t.idn
