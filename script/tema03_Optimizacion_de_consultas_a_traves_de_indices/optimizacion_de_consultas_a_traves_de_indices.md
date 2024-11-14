# Optimización de Consultas a través de Índices en SQL Server
## ¿Qué son los índices en SQL Server?
En SQL Server, los índices son estructuras que mejoran el rendimiento de las consultas al facilitar el acceso más rápido a los datos de las tablas. Funcionan de forma similar a un índice en un libro, ayudando al motor de la base de datos a ubicar rápidamente las filas en lugar de tener que leer toda la tabla. Los índices pueden reducir considerablemente los tiempos de respuesta, especialmente en tablas grandes.

**Un índice bien diseñado mejora:**

Velocidad de consulta: Aumenta la velocidad de búsqueda y filtrado de datos.
Eficiencia en agrupación y ordenamiento: Mejora el rendimiento en operaciones de agrupación y ordenamiento.
Reducción en operaciones de I/O: Minimiza el número de operaciones de entrada y salida en disco, ahorrando recursos del sistema.

## Tipos de Índices en SQL Server
SQL Server permite crear distintos tipos de índices, cada uno con ventajas específicas según el caso de uso:

**Índice Agrupado (Clustered Index):** Ordena físicamente los datos de la tabla de acuerdo con los valores de la columna clave del índice. Una tabla puede tener solo un índice agrupado.
**Índice No Agrupado (Non-Clustered Index):** Crea una estructura separada que contiene una copia de la columna de índice y un puntero a la fila de datos en la tabla. Se pueden crear varios índices no agrupados en una tabla.
**Índice de Cobertura (Covering Index):** El índice de cobertura es útil cuando una consulta requiere solo algunas columnas de una tabla. Incluye todas las columnas necesarias para una consulta específica. Permite a SQL Server ejecutar la consulta sin acceder a la tabla principal, lo cual optimiza considerablemente el rendimiento. En este caso, crear un índice que incluya todas las columnas necesarias para evitar acceder a la tabla directamente. 
## Impacto de los Índices en el Rendimiento de las Consultas
La implementación de índices puede mejorar significativamente el rendimiento de las consultas al reducir el tiempo de búsqueda y filtrado de datos. Sin embargo, los índices también requieren espacio adicional y pueden afectar el rendimiento de las operaciones de inserción, actualización y eliminación, ya que la base de datos debe actualizar los índices correspondientes.

### Caso Práctico: Creación y Evaluación de Índices
#### Escenario
Para este ejercicio, usaremos una tabla con un millón de registros. La tabla contendrá una columna de fecha sin índice inicial, donde realizaremos consultas de búsqueda por rango de fechas. Después, agregaremos distintos tipos de índices y mediremos el impacto en el rendimiento.

#### Objetivos del Ejercicio
Evaluar el impacto de los índices en el rendimiento de consultas: Identificar mejoras en los tiempos de respuesta y planes de ejecución.
Comparar tiempos de respuesta con y sin índices: Verificar las diferencias de rendimiento entre diferentes configuraciones de índices.
**Pasos**
Carga masiva de datos en la tabla `Cliente`:
1. Se generará una tabla de un millón de registros, que incluye una columna de tipo fecha para realizar las consultas.
``` -- Deshabilitar restricciones de integridad referencial y constraints
ALTER TABLE Cliente NOCHECK CONSTRAINT ALL;

Script para la carga masiva de registros sobre la tabla Cliente en el campo fechaNac_Cliente (sin índice)

DECLARE @i INT = 1;

WHILE @i <= 1000000
BEGIN
    INSERT INTO Cliente (
        nombre_Cliente, 
        apellido_Cliente, 
        dni_Cliente, 
        cuil_Cliente, 
        fechaNac_Cliente, 
        email_Cliente, 
        celular_Cliente, 
        calle_Cliente, 
        num_Calle, 
        piso_Cliente, 
        dpto_Cliente, 
        codigo_PostalCliente, 
        id_Localidad
    )
    VALUES (
        'Nombre' + CAST(@i AS VARCHAR(7)),
        'Apellido' + CAST(@i AS VARCHAR(7)),
        RIGHT('00000000' + CAST(@i AS VARCHAR(8)), 8),
        RIGHT('00000000000' + CAST(@i AS VARCHAR(11)), 11),
        DATEADD(DAY, -ABS(CHECKSUM(NEWID()) % 36500), GETDATE()), -- Genera fechas de nacimiento aleatorias
        'email' + CAST(@i AS VARCHAR(7)) + '@example.com',
        '1234567890',
        'Calle Ficticia',
        FLOOR(RAND() * 1000),
        FLOOR(RAND() * 10),
        'A',
        1234,
        1 
    );

    SET @i = @i + 1;
END;
``` 
2. Realizar consulta inicial sin índice: Realizamos una búsqueda por un rango de fechas y registramos el tiempo de respuesta y el plan de ejecución.
``` 
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

-- Consulta sin índice
SELECT *
FROM Cliente
WHERE fechaNac_Cliente BETWEEN '1990-01-01' AND '2000-12-31';

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

```

3. Crear índice agrupado en la columna de fecha: Añadimos un índice agrupado en la columna de fecha y repetimos la consulta para medir las diferencias.
``` 
-- eliminar la restricción de clave primaria asociada al índice PK_Cliente
ALTER TABLE Cliente
DROP CONSTRAINT PK_Cliente;

-- Crear el nuevo índice clúster sobre fechaNac_Cliente
CREATE CLUSTERED INDEX IX_Cliente_FechaNac ON Cliente(fechaNac_Cliente);

-- Consulta con índice agrupado
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT *
FROM Cliente
WHERE fechaNac_Cliente BETWEEN '1990-01-01' AND '2000-12-31';

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
```

4.  Borrar el índice creado
```
DROP INDEX IX_Cliente_FechaNac ON Cliente;
```
5. Crear indice no agrupado de cobertura y repetimos la consulta para medir las diferencias.
```
-- Crear un índice no clúster 
CREATE NONCLUSTERED INDEX IX_Cliente_FechaNac_Cubierto
ON Cliente(fechaNac_Cliente)
INCLUDE (nombre_Cliente, apellido_Cliente, dni_Cliente, cuil_Cliente);

-- Consulta con índice no clúster cubierto
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

-- Ejecutar la consulta que utilizará el índice cubierto
SELECT nombre_Cliente, apellido_Cliente, dni_Cliente, cuil_Cliente
FROM Cliente
WHERE fechaNac_Cliente BETWEEN '1990-01-01' AND '2000-12-31';

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
```

### Resultados Obtenidos
**Consulta sin índice:** Se evaluó que la consulta inicial sin índice tuvo un tiempo de respuesta elevado debido a la búsqueda en toda la tabla.
**Con índice agrupado:** El tiempo de respuesta mejoro significativamente, ya que los datos están ordenados físicamente por la columna de fecha.
**Índice no agrupado de cobertura** Muestra un rendimiento mejorado, ya que filtra la consulta por una fecha y sus filas fueron menores.

### Análisis de Resultados
**Medición de tiempos de respuesta:** Comparamos los tiempos de respuesta obtenidos en cada escenario para observar las mejoras.
**Análisis del plan de ejecución:** Evaluamos los planes de ejecución para identificar si se usaron los índices en cada consulta y entender cómo afectaron el rendimiento.

## Conclusiones
Implementar índices en SQL Server puede mejorar significativamente el rendimiento de las consultas en tablas grandes. Sin embargo, el tipo de índice seleccionado y su configuración deben estar alineados con los requisitos de consulta y las necesidades de mantenimiento de la base de datos. Un índice agrupado es ideal para ordenar datos en consultas de rangos, mientras que un índice no agrupado con columnas incluidas puede ser útil en situaciones de consultas con múltiples columnas.

Fuentes
[SQL Server - Documentación Oficial ](https://learn.microsoft.com/es-es/sql/sql-server/?view=sql-server-ver16)
[Optimización de consultas con índices](https://learn.microsoft.com/es-es/sql/relational-databases/indexes/reorganize-and-rebuild-indexes?view=sql-server-ver16)
