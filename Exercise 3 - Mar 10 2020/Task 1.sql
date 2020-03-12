select moviestar.NAME
from moviestar, (select * from MOVIEEXEC where NETWORTH > 10000000) as money
where gender='f' and MOVIESTAR.NAME = money.NAME

select distinct moviestar.NAME
from moviestar, (select name from MOVIEEXEC) as execs
where MOVIESTAR.NAME != execs.NAME

select title
from movie, (select length from movie where title='Star Wars') as movieLength
where movie.length > movieLength.length

select movie.title, Producers.name
from Movie ,(select name, CERT# from MOVIEEXEC, (select networth from MOVIEEXEC where name ='Merv Griffin') as netWorthValue
where MOVIEEXEC.NETWORTH>netWorthValue.NETWORTH) as Producers
where MOVIE.PRODUCERC# = Producers.Cert#

