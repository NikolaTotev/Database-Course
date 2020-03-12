select distinct country from classes where NUMGUNS =(select max(NUMGUNS) from classes)

select distinct class from ships,(select ship from OUTCOMES where result= 'sunk') as sunkenShips
where ships.NAME=sunkenShips.SHIP

select name, ships.class from ships,
(select class from CLASSES where bore = 16) as rightBore
where ships.CLASS = rightBore.CLASS

select battle from outcomes,
(select name from ships where class ='Kongo') as shipNames
where shipNames.NAME = OUTCOMES.SHIP

select
	c.CLASS
	,s.NAME as ShipName
	--,c.NUMGUNS
	--,c.BORE
	--,BoreSummary.ShipsCountWithSameBore
from ships as s
	join CLASSES as c on c.CLASS = s.CLASS
	/* sub-query to find the number of ships by caliber */
	join (
		select 
			CLASSES.BORE,
			count(*) as ShipsCountByBore
		from SHIPS 
			join CLASSES on CLASSES.CLASS = SHIPS.CLASS 
		group by CLASSES.BORE) as BoreSummary on BoreSummary.BORE = c.BORE
where c.NUMGUNS >= BoreSummary.ShipsCountByBore
order by c.CLASS, s.NAME