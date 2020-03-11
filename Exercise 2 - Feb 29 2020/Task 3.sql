select *
from ships, (select Class, displacement from classes where DISPLACEMENT > 50000)AS Displacements
where ships.CLASS = Displacements.CLASS

select ShipInfo.NAME,DISPLACEMENT,NUMGUNS 
from classes, (
select name, class --Ships.name, CLASSES.DISPLACEMENT, CLASSES.NUMGUNS
from ships,(select ship from OUTCOMES where BATTLE='Guadalcanal')AS OutComeInfo 
where OutComeInfo.SHIP = SHIPs.NAME)ShipInfo
where CLASSES.CLASS = ShipInfo.Class


select *
from OUTCOMES

select country
from  classes
where type='bc'
Intersect 
select country
from  classes
where type='bb'

select ok.SHIP
from (
select *
from OUTCOMES 
where OUTCOMES.RESULT='damaged' ) as damaged, 
(
select *
from OUTCOMES 
where OUTCOMES.RESULT='ok' ) as ok
where ok.SHIP=damaged.SHIP