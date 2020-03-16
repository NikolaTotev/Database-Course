	(select maker,p.model,type from product as p left join pc as c on p.model=c.model  where type='pc' and code is null)
	union
	(select maker,p.model,type from product as p left join laptop as c on p.model=c.model  where type='laptop' and code is null)
	union
	(select maker,p.model,p.type from product as p left join printer as c on p.model=c.model  where p.type='printer' and code is null)

	select distinct laptops.maker from
	(select*from product where type='printer')as pc join
	(select*from product where type='laptop')as laptops on pc.maker=laptops.maker

	select distinct models.hd
	from laptop as models 
	join laptop as harddist 
	on harddist.hd = models.hd 
	where harddist.model!=models.model