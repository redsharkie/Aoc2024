drop table if exists Day3Cleansed;
create temporary table Day3Cleansed as 
SELECT
  input
  , regexp_substr_all(input,'mul\\(\\d+,\\d+\\)') as ValidMultiply
  , f.value::string as SingleMultiply
  --, replace(replace(f.value::string, 'mul('),')')
  , substr(f.value::string,5, position(',',f.value::string) -5) as MulA
  , replace(substr(f.value::string,position(',',f.value::string) +1 ,3 ),')') as MulB
FROM
  "AOC2024"."DBO"."DAY3" d
  ,lateral flatten(input => regexp_substr_all(input,'mul\\(\\d+,\\d+\\)')) f;


  select   sum(MulA  *  MulB) from Day3Cleansed

   select * from Day3Cleansed