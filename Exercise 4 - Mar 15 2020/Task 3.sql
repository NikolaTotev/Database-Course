select* from ships as sh left join CLASSES as cl on sh.CLASS =cl.CLASS

select shipInfo.name, shipInfo.class, shipInfo.type, nullInfo.COUNTRY, nullInfo.bore, nullInfo.numGuns, nullInfo.Displacement  from
(select name,sh.CLASS,launched,type,country,numguns,bore,DISPLACEMENT from ships as sh left join CLASSES as cl on sh.CLASS =cl.CLASS) as shipInfo 
full outer join (select name,sh.CLASS,launched,type,country,numguns,bore,DISPLACEMENT from ships as sh right join CLASSES as cl on sh.CLASS =cl.CLASS where name is null) as nullInfo on nullInfo.class=shipInfo.name 

select country, name from
(
select ships.name,class from
(select name from outcomes right join ships on ships.NAME=OUTCOMES.SHIP where ship is null) as shipInfo join ships on shipInfo.name=ships.name) as classesInfo join classes on classesInfo.CLASS = CLASSES.CLASS order by country

select guns.NAME
from
(select name from ships as sh join classes as cl on sh.CLASS=cl.CLASS where NUMGUNS>7) as guns join
(select name from ships as sh join classes as cl on sh.CLASS=cl.CLASS where launched=1916) as year on guns.NAME=year.name

select ship, battle,date from
(select * from OUTCOMES where result='sunk') as sunken join battles as bl on sunken.battle=bl.NAME order by battle

select name, DISPLACEMENT, LAUNCHED from
(select * from ships where NAME=CLASS) as shipInfo join classes on shipInfo.CLASS=CLASSES.CLASS

select  top 1 classes.class,type,COUNTRY,NUMGUNS,bore,DISPLACEMENT from classes left join SHIPS on SHIPS.CLASS = CLASSES.CLASS

select ship,DISPLACEMENT,battle,result from
(select * from
(select * from OUTCOMES where battle='North Atlantic')as battleinfo left join ships on ships.name = ship) as classesInfo join CLASSES on  classesInfo.CLASS=CLASSES.CLASS
 