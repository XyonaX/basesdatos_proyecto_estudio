-- Deshabilitar restricciones de integridad referencial y constraints
ALTER TABLE Cliente NOCHECK CONSTRAINT ALL;

-- Script para la carga masiva de registros sobre la tabla Cliente en el campo fechaNac_Cliente (sin índice)
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

--Se verifico que se cargaron el millon de datos
SELECT * FROM Cliente

-- Habilitar restricciones de integridad referencial y constraints
ALTER TABLE Cliente CHECK CONSTRAINT ALL;

--Realizar una búsqueda por periodo y registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

-- Consulta sin índice
SELECT *
FROM Cliente
WHERE fechaNac_Cliente BETWEEN '1990-01-01' AND '2000-12-31';

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

--Definir un índice agrupado sobre la columna fecha y repetir la consulta anterior.
--Registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.
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

--Borrar el indice creado
-- Eliminar índice agrupado
DROP INDEX IX_Cliente_FechaNac ON Cliente;

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
