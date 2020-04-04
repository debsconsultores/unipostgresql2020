select to_tsquery('english','''supernova stars'' & !crab')
select to_tsquery('spanish','''estrella supernova'' & !planeta')

select to_tsquery('english','supernovae <-> stars & !crab')

select plainto_tsquery('spanish','El planeta tierra es el tercer <-> planeta del sistema & solar & sol:A')
select phraseto_tsquery('spanish','El planeta tierra es el tercer planeta del sistema solar')
select phraseto_tsquery('spanish','El planeta. tierra es el tercer planeta del. sistema solar')

select websearch_to_tsquery('spanish','El "planeta tierra" es el tercer planeta OR del sistema -solar')


select websearch_to_tsquery('spanish','LOPEZ CRISTOFER OR CHRISTOFER OR CHRISTOPHER -ANTONIO')

select websearch_to_tsquery('english','""" )( ) dummy \\ query <-> ')

select title,ts_rank(busqueda,to_tsquery(idioma,'fantasy')) as clasificacion
from tv_series
where busqueda @@ to_tsquery(idioma,'fantasy')
order by 2 desc

select title,ts_rank(busqueda,to_tsquery(idioma,'television')) as clasificacion
from tv_series
where busqueda @@ to_tsquery(idioma,'television')
order by 2 desc

select title,ts_rank_cd(busqueda,to_tsquery(idioma,'fantasy')) as clasificacion
from tv_series
where busqueda @@ to_tsquery(idioma,'fantasy')
order by 2 desc

select title,ts_rank_cd(busqueda,to_tsquery(idioma,'drama')) as clasificacion
from tv_series
where busqueda @@ to_tsquery(idioma,'drama')
order by 2 desc

select title,ts_rank_cd(busqueda,to_tsquery(idioma,'serie')) as clasificacion
from tv_series
where busqueda @@ to_tsquery(idioma,'serie')
order by 2 desc