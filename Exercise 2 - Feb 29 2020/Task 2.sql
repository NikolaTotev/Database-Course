SELECT *
FROM LAPTOP

SELECT * 
FROM product

SELECT DISTINCT maker,speed
from laptop, product
where laptop.model = product.model and hd >=9

SELECT DISTINCT laptop.model,price
from laptop, product
where laptop.model = product.model and maker='B'
UNION
SELECT DISTINCT pc.model,price
from pc, product
where pc.model = product.model and maker='B'
UNION
SELECT DISTINCT printer.model,price
from printer, product
where printer.model = product.model and maker='B'

select maker 
from product
where type='Laptop'
EXCEPT 
select maker 
from product
where type='PC'

select hd
from pc
group by hd
having COUNT(*) > 1

select distinct Pc1.model as Model1, Pc2.model as Model2
from pc as Pc1, pc as Pc2
where Pc1.speed = Pc2.speed and Pc1.ram = Pc2.ram and Pc1.model != Pc2.model

select distinct maker
from pc, product
where speed >= 400 and type ='PC'
