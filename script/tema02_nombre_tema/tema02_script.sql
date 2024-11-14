USE StoredOps

/*
				**PROYECTO**
			Tema: Procedimientos y funciones almacenadas
-----------------------------------------------------------------------------

				Procedimientos almacenados: 
*/
----Crear un procedimiento 

	CREATE PROCEDURE mostrar_paises
as 
BEGIN 
	SELECT * FROM Pais; 
END

	---EJECUTAR
EXEC mostrar_paises;

---------------------------------------


CREATE PROCEDURE buscar_vehiculo
	@NombreBuscar VARCHAR(50),
    @Precio DECIMAL(8, 2)
AS --palabra clave 
BEGIN 
	   SET NOCOUNT ON;	--ayuda a suprimir mensajes innecesarios sobre el número de filas afectadas
		SELECT * FROM Vehiculos WHERE   modelo_Vehiculo LIKE '%' + @NombreBuscar + '%' AND precio_Vehiculo <= @Precio;
	END

--Ejecuta un procedimiento almacenado
EXEC buscar_vehiculo 'Ecosport', 28000;

select * from Vehiculos
--------------------------------------------------------

---------------- Funciones almacenadas 

 CREATE FUNCTION dbo.PrecioPromedioPorTipo (
    @idTipoVehiculo INT  -- Parámetro de entrada: id del tipo de vehículo
)
RETURNS FLOAT  -- retorno: el precio promedio
AS
BEGIN
    DECLARE @PrecioPromedio FLOAT;  
    -- Calcular el precio promedio de los vehículos del tipo especificado
    SELECT @PrecioPromedio = AVG(precio_Vehiculo)
    FROM Vehiculos
    WHERE id_tipoVehiculo = @idTipoVehiculo; 
    -- Devuelve el precio promedio
    RETURN @PrecioPromedio;
END;

--PARA EJECUTAR
----- Ejemplo: obtener el precio promedio para el Tipo de vehículo con id = 2 -ECOSPORT
SELECT dbo.PrecioPromedioPorTipo(2) AS PrecioPromedio; 

select * from Vehiculos


CREATE FUNCTION existe_pais (
    @nombre_pais VARCHAR(50)
)
RETURNS INT --- devuelve entero
AS
BEGIN
    DECLARE @existe INT;

    -- Verificar si el país existe en la tabla
    IF EXISTS (SELECT 1 FROM Pais WHERE nombre_Pais = @nombre_pais)
    BEGIN
        SET @existe = 1;  --  existe
    END
    ELSE
    BEGIN
        SET @existe = 0;  -- no existe
    END

    -- Devolver el resultado
    RETURN @existe;
END

-- Verificar si el país 'Argentina' existe en la tabla
SELECT dbo.existe_pais('Argentina') AS PaisExiste; --- 1 
SELECT dbo.existe_pais('Estados Unidos') AS PaisExiste; --- 0 

select * from Pais




