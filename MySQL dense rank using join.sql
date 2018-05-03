
Create table If Not Exists Scores (Id int, Score DECIMAL(3,2))
Truncate table Scores
insert into Scores (Id, Score) values ('1', '3.5')
insert into Scores (Id, Score) values ('2', '3.65')
insert into Scores (Id, Score) values ('3', '4.0')
insert into Scores (Id, Score) values ('4', '3.85')
insert into Scores (Id, Score) values ('5', '4.0')
insert into Scores (Id, Score) values ('6', '3.65')


select x.score, y.ran as Rank
from scores x inner join 
(select a.score,count(distinct b.score) ran
from scores a , scores b
where a.score <= b.score
group by a.score) y
on x.score = y.score
order by x.score desc

