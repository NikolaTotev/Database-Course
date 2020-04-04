select distinct ship from OUTCOMES join ships on OUTCOMES.SHIP = ships.NAME where ship like 'C%' or ship like 'K%'

select distinct name as Name, CLASSES.country as Class from
(select name,class from OUTCOMES right join ships on OUTCOMES.SHIP = ships.NAME where result is null or result!='sunk') as shipInfo
 join classes on shipInfo.class=classes.class

select country, count(battle)  from
(select class, battle from OUTCOMES right join ships on OUTCOMES.SHIP = ships.NAME where result='sunk') as shipInfo 
 right join classes on shipInfo.class=classes.class group by country

;WITH battleInfo (battle, shipCount) as (select battle, count(ship) shipCount from outcomes group by battle) 
select battle from
battleInfo
where shipCount > (select shipCount from battleInfo where battle='Guadalcanal')


;WITH battleInfo (battle, shipCount) as (select battle, count(ship) shipCount from outcomes group by battle) 
select battle from
battleInfo
where shipCount > (select shipCount from battleInfo where battle=' Surigao Strait')

--VV Not Working VV --
;WITH minDisplacement (name,disp,gunNum)as (
select top 1 Name,DISPLACEMENT,NUMGUNS from ships join classes on SHIPS.CLASS= CLASSES.CLASS order by DISPLACEMENT)

select * from CLASSES,minDisplacement where DISPLACEMENT=minDisplacement.disp
select * from ships join classes on SHIPS.CLASS= CLASSES.CLASS where classes.DISPLACEMENT= DISPLACEMENT
--^^Not Working^^--

select Name, DISPLACEMENT, NUMGUNS from ships join classes on SHIPS.CLASS= CLASSES.CLASS 
where classes.DISPLACEMENT=(
select top 1 DISPLACEMENT from ships join classes on SHIPS.CLASS= CLASSES.CLASS order by DISPLACEMENT)
order by NUMGUNS

;WITH counts (ship, battleCount)  as (select ship, count(ship) from outcomes where result = 'damaged' or result = 'ok' group by ship  having count(ship) >= 1)
select count(battleCount) from counts where battleCount >=2


;WITH counts (ship, battleCount)  as (select ship, count(ship) from outcomes where result = 'damaged' or result = 'ok' group by ship  having count(ship) >= 1)
select ship from counts where battleCount >=2 group by ship
