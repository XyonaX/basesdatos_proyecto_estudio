#   Procedimientos y funciones almacenadas

#   *¿Qué es un procedimiento?*


Un procedimiento almacenado es un conjunto de instrucciones que se pueden llamar desde otras consultas o desde otros procedimientos almacenados, puede tomar argumentos de entrada y mostrar valores como resultados. Estos pueden ser almacenados por ejemplo en un conjunto de datos de BigQuery (almacén de datos de Google Cloud de bajo coste, multinube, escalable, serverless y totalmente administrado) 

Un procedimiento almacenado puede acceder a los datos o modificarlos en varios conjuntos de datos de varios usuarios, como así también puede contener una consulta de varias instrucciones.
Se  admiten declaraciones de lenguaje de procedimiento, que permiten realizar variables como definir variables e implementar el flujo de control, pero a diferencia de las funciones, los procedimientos almacenados no deben devolver un valor. Por este motivo, los procedimientos no contienen la cláusula RETURNS ni la sentencia RETURN en su cuerpo. 

Los procedimientos almacenados en MySQL son secuencias de comandos o bloques de código SQL que se almacenan en el servidor de la base de datos y se ejecutan cuando se invocan. Son una forma de agrupar instrucciones SQL relacionadas en una unidad lógica y reutilizable. Los procedimientos almacenados permiten simplificar la lógica de programación, mejorar el rendimiento y aumentar la seguridad de las bases de datos.

Crea un procedimiento almacenado:
----------------------------------

CREATE PROCEDURE mostrar_paises
AS 
BEGIN 
	SELECT * FROM Pais; 
END


Parámetros en procedimientos almacenados
---------------------------------------

CREATE PROCEDURE buscar_vehiculo
	@NombreBuscar VARCHAR(50),
        @Precio DECIMAL(8, 2)
	
AS --palabra clave 

BEGIN 

 SET NOCOUNT ON; 	--ayuda a suprimir mensajes innecesarios sobre el número de filas afectadas
SELECT * FROM Vehiculos WHERE  modelo_Vehiculo LIKE '%' + @NombreBuscar + '%' AND precio_Vehiculo <= @Precio;

END; 

**Ventajas**

 Modularidad y reutilización de código: Los procedimientos almacenados permiten agrupar instrucciones SQL relacionadas en una unidad lógica, lo que facilita su reutilización en diferentes partes de una aplicación.

 Mejor rendimiento: Al ejecutarse en el servidor de la base de datos, los procedimientos almacenados evitan la necesidad de enviar múltiples consultas desde la aplicación cliente. Esto reduce el tráfico de red y mejora el rendimiento general de la aplicación.

 Seguridad: Los procedimientos almacenados pueden ser utilizados para controlar el acceso a los datos y aplicar reglas de seguridad específicas. Los permisos de ejecución de los procedimientos almacenados pueden ser asignados a roles de usuario, lo que proporciona un nivel adicional de seguridad.

 Reducción de errores: Al encapsular la lógica de programación en procedimientos almacenados, se reduce la posibilidad de cometer errores en la aplicación. Los procedimientos almacenados son probados y depurados una vez, y luego pueden ser utilizados por múltiples aplicaciones sin necesidad de modificar el código fuente.


# *¿Qué son las funciones almacenadas?*

Son rutinas almacenadas, con nombre, definidas por el usuario, que nos permiten procesar y manipular datos, pueden recibir parámetros de entrada y deben devolver algún valor (de un tipo específico previamente definido). 

Posteriormente, pueden ser usadas invocándolas en una expresión, como cualquier otra función predefinida de MySQL. Una función siempre está asociada a una base de datos o esquema. Si no especificamos uno al momento de crearla se utilizará la base de datos por defecto. 
Para indicar una base de datos, debemos especificarla junto al nombre de la función al momento de crearla: nombre_bd.nombre_func. 

Para crear una nueva función, debemos utilizar la sentencia CREATE FUNCTION, cuya sintaxis simplificada es la siguiente: 

1 CREATE FUNCTION < nombre >  ( parámetros )
2 RETURNS < tipo >  
3  < cuerpo de la función >
4 RETURN  < valor > ; 

**Ventajas de las funciones**

 Reutilización de Código: Al igual que los procedimientos almacenados, las funciones permiten reutilizar lógica de código.

 Encapsulación de Lógica: Puedes encapsular lógica de negocio compleja en funciones, facilitando su comprensión y mantenimiento.

 Facilidad de Uso: Las funciones se pueden utilizar en consultas SELECT, WHERE y en otras funciones, facilitando su integración en diferentes partes de tus consultas.

 Valores Predeterminados: Puedes asignar valores predeterminados a los parámetros de una función, lo que proporciona flexibilidad y control.

### Cómo usar una función almacenada

 Una vez creada la función, puede ser utilizada directamente en cualquier consulta. Ejemplo: consulta sobre la tabla productos de la base de datos base_ejemplo: 
 
 SELECT *, @PrecioPromedio = AVG(precio_Vehiculo) AS promedio FROM Vehiculos;

### Cómo borrar una función almacenada 

Puedes borrar una función almacenada haciendo uso de la sentencia DROP FUNCTION. Por ejemplo, si quieres eliminar la función calcularBeneficio del ejemplo anterior, tendrás que ejecutar esta sentencia: 

 DROP FUNCTION buscar_vehiculo;

### Cómo modificar una funa funcion

ALTER FUNCTION fn_PrecioPromedioPorTipo
    (@IdTipoVehiculo INT)
< cuerpo_de_la_funcion >
SELECT *, @PrecioPromedio = AVG(precio_Vehiculo) AS promedio FROM Vehiculos
WHERE id_tipoVehiculo = @IdTipoVehiculo
      AND precio_Vehiculo >= 22.000;


### Uso Conjunto de Procedimientos Almacenados y Funciones 

En SQL Server puede ser muy útil para crear soluciones más complejas que combinan la lógica de cálculo (funciones) con la ejecución de operaciones o tareas (procedimientos almacenados)

Ventajas de Usar Funciones Junto con Procedimientos Almacenados:

*Cálculos: Puedes encapsular cálculos complejos en funciones y luego llamarlas desde un procedimiento almacenado. Esto mejora la modularidad del código.

*Optimización: Las funciones pueden optimizar las consultas al calcular previamente valores que se usen en múltiples partes del sistema.

*Facilidad de uso: Las funciones pueden ser utilizadas directamente dentro de otras instrucciones SQL, como SELECT, WHERE, y JOIN, lo que facilita su uso.

