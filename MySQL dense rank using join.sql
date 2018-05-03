select x.score, y.ran as Rank
from scores x inner join 
(select a.score,count(distinct b.score) ran
from scores a , scores b
where a.score <= b.score
group by a.score) y
on x.score = y.score
order by x.score desc

