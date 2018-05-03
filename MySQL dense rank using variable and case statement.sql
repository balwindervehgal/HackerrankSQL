
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
