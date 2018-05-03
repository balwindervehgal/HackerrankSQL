
Create table If Not Exists Scores (Id int, Score DECIMAL(3,2))
Truncate table Scores
insert into Scores (Id, Score) values ('1', '3.5')
insert into Scores (Id, Score) values ('2', '3.65')
insert into Scores (Id, Score) values ('3', '4.0')
insert into Scores (Id, Score) values ('4', '3.85')
insert into Scores (Id, Score) values ('5', '4.0')
insert into Scores (Id, Score) values ('6', '3.65')

select 
Score,
case when @value = score then @rank
when @value:= score then @rank:= @rank+1 end as Rank
from scores, (select @rank:= 0, @value:= NULL)x
order by score desc


#or

select 
Score,
case when @value = score then @rank else @rank:= @rank+1 end as Ran,
@value:= score
from scores, (select @rank:= 0, @value:= NULL)x
order by score desc

#or

select score,ran
from (select score, 
@rank:= IF(@value = score, @rank, @rank+1) as ran ,
@value := score
from scores a, (select @rank:= 0, @value:= NULL) x
order by score desc)s
