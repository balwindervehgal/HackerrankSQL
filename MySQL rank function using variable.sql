Create table If Not Exists Scores (Id int, Score DECIMAL(3,2))
Truncate table Scores
insert into Scores (Id, Score) values ('1', '3.5')
insert into Scores (Id, Score) values ('2', '3.65')
insert into Scores (Id, Score) values ('3', '4.0')
insert into Scores (Id, Score) values ('4', '3.85')
insert into Scores (Id, Score) values ('5', '4.0')
insert into Scores (Id, Score) values ('6', '3.65')

select score, ran from 
(select score,
@rank:= IF(@value = score, @rank, @rankvalue) as ran ,
@rankvalue := @rankvalue + 1,
@value := score
from scores, (select @rank:= 0, @value:= NULL, @rankvalue:= 1)x
order by score desc) s
