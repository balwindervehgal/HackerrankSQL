
select 
Score,
case when @value = score then @rank
when @value:= score then @rank:= @rank+1 end as Rank
from scores, (select @rank:= 0, @value:= NULL)x
order by score desc
