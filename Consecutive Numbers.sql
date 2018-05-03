Create table If Not Exists Logs (Id int, Num int);
Truncate table Logs;
insert into Logs (Id, Num) values ('1', '1');
insert into Logs (Id, Num) values ('2', '1');
insert into Logs (Id, Num) values ('3', '1');
insert into Logs (Id, Num) values ('4', '2');
insert into Logs (Id, Num) values ('5', '1');
insert into Logs (Id, Num) values ('6', '2');
insert into Logs (Id, Num) values ('7', '2');
insert into Logs (Id, Num) values ('8', '6');
insert into Logs (Id, Num) values ('9', '6');
insert into Logs (Id, Num) values ('10', '6');


select distinct
l1.Num
from Logs l1 inner join Logs l2  on l1.id = l2.id+1 
inner join Logs l3 on l2.id = l3.id + 1
where l1.num = l2.num and l2.num = l3.num


select a.Num
from Logs a inner join Logs b 
on a.id = b.id + 1 and a.Num = b.Num
having count(1) >= 2
