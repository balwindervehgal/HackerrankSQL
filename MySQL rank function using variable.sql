select score, ran from 
(select score,
@rank:= IF(@value = score, @rank, @rankvalue) as ran ,
@rankvalue := @rankvalue + 1,
@value := score
from scores, (select @rank:= 0, @value:= NULL, @rankvalue:= 1)x
order by score desc) s
