 select distinct product.maker
 from product, (select model from pc where speed > 500) as modelInfo
 where product.model = modelInfo.model
 
 select code, model, printer.price
 from printer, (select top 1 price from printer order by price desc) as topPrice
 where printer.price = topPrice.price

 select code, model, printer.price
 from printer, (select top 1 price from printer order by price desc) as topPrice
 where printer.price = topPrice.price

 select *
 from laptop , (select top 1 speed from pc order by speed ) as slowestSpeed
 where laptop.speed < slowestSpeed.speed
 
 Select top 1 model, price from (
 Select model,price from printer where price = (Select MAX(price) from printer)
 UNION
 Select model,price from pc where price = (Select MAX(price) from pc)
 UNION
 Select model,price from laptop where price = (Select MAX(price) from laptop)) as MaxValues
 Order by price Desc

 select maker
 from product ,
 (select top 1 model, price from printer
 where color='y'
 order by price) as minPrice
 where minPrice.model = product.model

 select distinct maker
 from product,
 (select distinct model, ram from pc where ram = (select min(ram) from pc)) as minRam,
 (select distinct model, speed from pc where speed = (select max(speed) from pc)) as maxSpeed
 where  product.model = maxSpeed.model or product.model=minRam.model





 
