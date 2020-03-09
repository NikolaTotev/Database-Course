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
