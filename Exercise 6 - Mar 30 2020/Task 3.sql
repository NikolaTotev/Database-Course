select model,code,screen from laptop where screen=11 or screen = 15

select distinct model from 
(select maker, price, pc.model from pc join product on pc.model = product.model) as pcInfo,
(select maker, min(price) minPrice from laptop join product on laptop.model = product.model group by maker) as laptopPricing
where laptopPricing.maker=pcInfo.maker and pcInfo.price<laptopPricing.minPrice

select distinct model from
(select maker, Avg(price) as AvgPcPrice, pc.model from pc join product on pc.model = product.model group by maker,pc.model) as pcInfo,
(select maker, min(price) minPrice from laptop join product on laptop.model = product.model group by maker) as laptopPricing
where pcInfo.maker=laptopPricing.maker and  pcInfo.AvgPcPrice < laptopPricing.minPrice

select pp.code, p.maker, (select count(distinct pc.model) from pc where pc.price >= pp.price) as higher
from pc pp
join product p 
on pp.model = p.model