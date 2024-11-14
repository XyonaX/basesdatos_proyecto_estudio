Tema: Procedimientos y funciones almacenadas

¿Qué es un procedimiento?
Un procedimiento almacenado es un conjunto de instrucciones que se pueden llamar desde otras consultas o desde otros procedimientos almacenados, puede tomar argumentos de entrada y mostrar valores como resultados. 
Estos pueden ser almacenados en un conjunto de datos de BigQuery (almacén de datos de Google Cloud de bajo coste, multinube, escalable, serverless y totalmente administrado)
Un procedimiento almacenado puede acceder a los datos o modificarlos en varios conjuntos de datos de varios usuarios, como así también puede contener una consulta de varias instrucciones. Admiten declaraciones de lenguaje de procedimiento, que te permiten realizar variables como definir variables e implementar el flujo de control. Pero, a diferencia de las funciones, los procedimientos almacenados no deben devolver un valor. Por este motivo, los procedimientos no contienen la cláusula RETURNS ni la sentencia RETURN en su cuerpo.
Los procedimientos almacenados en MySQL son secuencias de comandos o bloques de código SQL que se almacenan en el servidor de la base de datos y se ejecutan cuando se invocan. Son una forma de agrupar instrucciones SQL relacionadas en una unidad lógica y reutilizable. Los procedimientos almacenados permiten simplificar la lógica de programación, mejorar el rendimiento y aumentar la seguridad de las bases de datos.

Crea un procedimiento almacenado: 

CREATE PROCEDURE sp_mostrar_registros()
BEGIN
    SELECT * FROM tabla;
END

	
Parámetros en procedimientos almacenados

CREATE PROCEDURE sp_buscar_producto(IN nombre VARCHAR(50), IN precio DECIMAL(8,2))
BEGIN
    SELECT * FROM productos WHERE nombre LIKE CONCAT('%', nombre, '%') AND precio <= precio;
END


Ventajas 

	Modularidad y reutilización de código: Los procedimientos almacenados permiten agrupar instrucciones SQL relacionadas en una unidad lógica, lo que facilita su reutilización en diferentes partes de una aplicación. 

	Mejor rendimiento: Al ejecutarse en el servidor de la base de datos, los procedimientos almacenados evitan la necesidad de enviar múltiples consultas desde la aplicación cliente. Esto reduce el tráfico de red y mejora el rendimiento general de la aplicación.

	Seguridad: Los procedimientos almacenados pueden ser utilizados para controlar el acceso a los datos y aplicar reglas de seguridad específicas. Los permisos de ejecución de los procedimientos almacenados pueden ser asignados a roles de usuario, lo que proporciona un nivel adicional de seguridad.

	Reducción de errores: Al encapsular la lógica de programación en procedimientos almacenados, se reduce la posibilidad de cometer errores en la aplicación. Los procedimientos almacenados son probados y depurados una vez, y luego pueden ser utilizados por múltiples aplicaciones sin necesidad de modificar el código fuente.

¿Qué son las funciones almacenadas?
Son rutinas almacenadas, con nombre, definidas por el usuario, que nos permiten procesar y manipular datos, pueden recibir parámetros de entrada y deben devolver algún valor (de un tipo específico previamente definido). Posteriormente, pueden ser usadas invocándolas en una expresión, como cualquier otra función predefinida de MySQL.
Una función siempre está asociada a una base de datos o esquema. Si no especificamos uno al momento de crearla se utilizará la base de datos por defecto. Para indicar una base de datos, debemos especificarla junto al nombre de la función al momento de crearla:  nombre_bd.nombre_func.
Para crear una nueva función, debemos utilizar la sentencia CREATE FUNCTION, cuya sintaxis simplificada es la siguiente:
1
CREATE FUNCTION [IF NOT EXISTS] <nombre>([<parametros>])
2
RETURNS <tipo> [<caracteristica>]
3
<cuerpo de la funcion>
4
RETURN <valor>;



Ventajas de las Funciones

	Reutilización de Código: Al igual que los procedimientos almacenados, las funciones permiten reutilizar lógica de código.

	Encapsulación de Lógica: Puedes encapsular lógica de negocio compleja en funciones, facilitando su comprensión y mantenimiento.

	Facilidad de Uso: Las funciones se pueden utilizar en consultas SELECT, WHERE y en otras funciones, facilitando su integración en diferentes partes de tus consultas.

	Valores Predeterminados: Puedes asignar valores predeterminados a los parámetros de una función, lo que proporciona flexibilidad y control.

Cómo usar una función almacenada
Una vez creada la función, puede ser utilizada directamente en cualquier consulta. Ejemplo: consulta sobre la tabla productos de la base de datos base_ejemplo:
	SELECT *, calcularBeneficio(coste, precio) AS beneficio FROM productos;

Cómo borrar una función almacenada
Puedes borrar una función almacenada haciendo uso de la sentencia DROP FUNCTION. Por ejemplo, si quieres eliminar la función calcularBeneficio del ejemplo anterior, tendrás que ejecutar esta sentencia:
	DROP FUNCTION calcularBeneficio;

Uso Conjunto de Procedimientos Almacenados y Funciones
Supongamos que queremos calcular el salario anual de todos los empleados con salarios superiores a un valor específico utilizando tanto un procedimiento almacenado como una función:

CREATE PROCEDURE sp_calcular_salario_anual_empleados @salario_limite INT
AS
BEGIN
    SELECT nombre, dbo.fn_calcular_salario_anual(salario) AS salario_anual
    FROM empleados
    WHERE salario > @salario_limite;
END;


https://certidevs.com/aprender-sql-funciones-procedimientos
https://informatecdigital.com/bases-de-datos/procedimientos-almacenados-en-mysql-una-guia-completa/
https://programacion3.academiacimneiber.com/databases/tema-4/02-function/
https://delphidesdecero.com/curso-sql/clase-21-procedimientos-almacenados-y-funciones/
