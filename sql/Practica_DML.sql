
select 
a.idcoche,
b.nombre_modelo,
c.nombre_marca,
d.nombre_grupo,
a.matricula,
e.nombre_color,
a.total_km,
f.nombre_aseguradora,
a.numero_poliza 

from practica_final.coches a
inner join practica_final.modelo b
on a.idmodelo = b.idmodelo 

join practica_final.marca c
on b.idmarca = c.idmarca 

join practica_final.grupo_empresarial d 
on c.idgrupo = d.idgrupo 

join practica_final.color e 
on a.idcolor = e.idcolor 

join practica_final.aseguradora f 
on a.idaseguradora = f.idaseguradora 

where a.fecha_baja = '4000-12-31'
