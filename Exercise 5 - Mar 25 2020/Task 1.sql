select AVG(speed) as AvgSpeed
from pc

select maker,Avg(screen) from
(select screen, maker from laptop  as laptops join product as products on laptops.model = products.model) as Results
Group by maker

select AVG(speed) from laptop where price >1000

select AVG(price) from pc join product on pc.model = product.model where maker='A'

select AVG(price) as AvgPrice
from (
(select code,maker, price,type from pc as pcs join product as products on pcs.model=products.model where maker='B') 
union
(select code,maker, price, type from laptop as laptops join product as products on laptops.model=products.model where maker='B') ) as results

select speed, Avg(price) from pc group by speed 

select maker, Count(distinct code) as num_code from pc join product on pc.model = product.model group by maker having Count(distinct code)>=3

select top 1 maker,price from pc join product on pc.model=product.model order by price desc 

select infoTable.maker, Avg(infoTable.hd) from
(select distinct pcs.maker, pcs.model, pcs.hd from
(select pc.model, maker, hd from pc join product on pc.model = product.model) as pcs 
join (select * from product where type='printer') as
 printerMakers on pcs.maker=printerMakers.maker)as infoTable group by maker