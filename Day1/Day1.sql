--Part1
--add data to snowflake table     "AOC2024"."DBO"."DAY1INPUT"
drop table if exists Set1;
CREATE TEMPORARY TABLE Set1 (id NUMBER, Column1 Number);

insert into set1(id, column1) 
select 
row_number() over (order by   split_part(rawcolumn, '   ',1) ) as RowNr
, split_part(rawcolumn, '   ',1) as Column1
from 
    "AOC2024"."DBO"."DAY1INPUT"
order by 
  split_part(rawcolumn, '   ',1)     


drop table if exists Set2;
CREATE TEMPORARY TABLE Set2 (id NUMBER, Column2 Number);

insert into Set2(id, column2) 
select 
row_number() over (order by   split_part(rawcolumn, '   ',2) ) as RowNr
, split_part(rawcolumn, '   ',2) as Column1
from 
    "AOC2024"."DBO"."DAY1INPUT"
order by 
  split_part(rawcolumn, '   ',2)   

select 
sum( abs(column1 - column2 )) as Difference
from set1 s1
inner join set2 s2 on s1.id = s2.id

--Part two
select sum(resultaat)
from (
select
column1
, count(s2.column2)
, column1 * count(s2.column2) as Resultaat
from
set1 s1
inner join set2 s2 on s1.Column1 = s2.Column2
group by column1) alles
