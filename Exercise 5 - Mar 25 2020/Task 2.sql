select Count(Class) as NoClasses from classes where type='bb'
select class, Avg(numguns) as AvgGuns from CLASSES group by class

select Avg(numguns) TotalAvgGuns from classes

select class, MIN(LAUNCHED) as FirstYear,MAX(LAUNCHED) as LastYear from Ships
Group by class

select class,Count(CLASS) from outcomes join ships on ships.name=outcomes.ship where result ='sunk' group by class



select classCounts.class, SunkenCount from 
(select class, Count(CLASS) as ClassCount from ships group by class) as classCounts join 
(select class,Count(CLASS) as SunkenCount from outcomes join ships on ships.name=outcomes.ship where result ='sunk' group by class) as sunken on classCounts.CLASS = sunken.CLASS

select country, AVG(bore) from classes group by country