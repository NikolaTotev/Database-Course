select * from MOVIE
where year<2000 AND length > 120 or LENGTH is null

select * from MOVIEstar
where name like 'J%' and BIRTHDATE >1948
order by birthdate DESC

select studioname, count(starName) from
(select name as StudioName, MovieTitle, StarName from
(select name, title from STUDIO join movie on name=STUDIONAME) as studios join STARSIN on studios.TITLE=MOVIETITLE) as names
group by StudioName

select starName, count(starName) from
(select movietitle, starName from STARSIN join movie on movietitle=title) as MovieStar
group by starName

select Dates.StudioName, movie.Title, LastMovie from
(select name as StudioName, Max(movieInfo.LastMovie) as LastMovie from (
select Name,title, year as LastMovie from  studio join movie on studioname = name ) as movieInfo group by movieInfo.NAME) as Dates 
join Movie on year = LastMovie 
order by LastMovie desc

select name from (
select top 1 name, max(birthdate) date from MOVIESTAR group by name) as sub

select distinct studios.STARNAME, StudioName, counts from 
(
select starName, counts from

(select starName, count(starName) as counts from
(select movietitle, starName from STARSIN join movie on movietitle=title) as MovieStars
group by starName) as countTable  

where counts = (select Max(counts) from(
select starName, count(starName) as counts from
(select movietitle, starName from STARSIN join movie on movietitle=title) as MovieStars
group by starName) as countTable)
) as rightCounts join 

(select  starName, STUDIONAME from STARSIN join movie on movietitle=title) as studios on rightCounts.STARNAME = studios.STARNAME

 
select MovieTitle, ActorCount, Year from(
select MovieTitle,count(starName) as ActorCount from
(select name as StudioName, MovieTitle, StarName from
(select name, title from STUDIO join movie on name=STUDIONAME) as studios join STARSIN on studios.TITLE=MOVIETITLE) as names
group by MovieTitle) as couunts join Movie on MOVIETITLE=Title where ActorCount >=3 
