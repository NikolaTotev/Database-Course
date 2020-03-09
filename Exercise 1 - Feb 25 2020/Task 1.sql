--Exercise 1
select address 
from STUDIO
where name='Disney'

--Exercise 2
select BIRTHDATE
from moviestar
where name='Jack Nicholson'

--Exercise 3
select STARNAME
from starsin
where MOVIEYEAR=1980 OR MOVIETITLE LIKE '%Wars%' 
--Wars should be Knight but there are no such movies, so I replaced Knight with wars to exercise using LIKE

--Exercise 4
select name
from MOVIEEXEC
where NETWORTH>10000000

--Exercise 5
select name
from MOVIESTAR
where Gender='M' OR ADDRESS='Perfect Rd.'


 


