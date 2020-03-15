select name, title
from movie join (select * from MOVIEEXEC where name='George Lucas') as producer
on PRODUCERC# = CERT# 

select distinct name 
from (select * from
(select movieTitle from starsin where starname = 'Harrison Ford') as movies 
join MOVIE on title = movieTitle) as producers 
join MOVIEEXEC  on PRODUCERC# =  CERT#

select distinct studioname, starname
from
(select * from movie join STARSIN on title=movietitle) as studioinfo

select starName, NETWORTH, title
from
(select top 1 * from MOVIEEXEC order by NETWORTH desc) as topProducer join 
(select * from movie join STARSIN on title=movietitle) as moviesInfo on PRODUCERC# = CERT#


select name, movietitle 
from
STARSIN right join MOVIESTAR on name=STARNAME
where MOVIETITLE IS NULL
