select class,country
from CLASSES
where NUMGUNS < 10

select name as ShipName
from ships
where LAUNCHED<1918 

select ship, battle
from OUTCOMES
where result='sunk'

select name
from SHIPS
where name=CLASS

select name
from ships
where name Like 'r%'

select name 
from ships
where name like '% %'