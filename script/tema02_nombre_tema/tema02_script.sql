
USE StoredOps

/*
							**PROYECTO**
			Tema: Procedimientos y funciones almacenadas
-----------------------------------------------------------------------------

				Procedimientos almacenados: 
*/

------------FUNCION INSERTAR

--insercion de datos en la tabla PAIS 
--id -> identity 

insert into Pais ( nombre_pais) values ( 'Argentina'), ('Uruguay'), ('Brasil') ; 

select * from Pais

-----------MODIFICAR 
--- se modifica la tabla Estado_Pago
----se elimina el nombre del estado del pago, quedando solo su ID  (numero de identifiacion de Estado ) 


alter table Estado_Pago
	drop column nombre_EstadoPago; 


-----------BORRAR

----accion de borrar una Tabla de la base de datos 
--en este caso las tablas no se pueden borrar ya que funciona como FOREIGN KEY

drop table  Estado_Pago

drop table  Estado_Factura



--		**Funciones Almacenadas** 

----Funcion contar empleados 
select count(*) from Empleado


----Funcion mostrar empleados mayores a 20 años 
select c.cuil_Empleado, c.fechaNac_Empleado
from Empleado c 
where (DATEDIFF (year, fechaNac_Empleado, getdate() ) >= 20)


----Funcion mostrar el cliente y su estado 

select c.id_Cliente, cd.id_Estado_Cliente, cd.nombre_EstadoCliente
from Cliente c
inner join Estado_Cliente cd on c.id_Estado_Cliente = cd.id_Estado_Cliente
where c.id_Cliente = 5


-- Eficiencia de las operaciones directas versus el uso de procedimientos y funciones

/*Operaciones Directas: Ejecutar consultas directamente en SQL sin encapsularlas en procedimientos o funciones almacenadas.

-Procedimientos Almacenados: Código SQL precompilado que se almacena y ejecuta en el servidor. Son útiles para operaciones complejas o repetitivas.

-Funciones Almacenadas: Devuelven un solo valor o una tabla. Se usan para cálculos específicos que pueden ser reutilizados en diferentes partes del código.
*/



