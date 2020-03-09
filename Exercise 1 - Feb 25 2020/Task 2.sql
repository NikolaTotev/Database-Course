--Exercise 1
select model, speed as MHz, hd as GB
from pc
where price < 1200

--Exercise 2
select distinct maker
from product
where type='printer'

--Exercise 3
select model, speed, hd 
from laptop
where price < 1000

--Exercise 4
select *
from printer 
where color='y'

--Exercise 5
select model,speed,hd
from pc
where cd='12x' or cd='40x' and price<850
-- for this one I again altered the value to more closely match the given table.