
-- Ejemplo de una transacción de confirmación automático			
		
		-- Insertar un nuevo país
		INSERT INTO Pais (nombre_Pais) VALUES ('Argentina');


-- Ejemplo de una transacción explícita	

	BEGIN TRY
		BEGIN TRANSACTION;
			-- Insertar un nuevo país
			DECLARE @PaisID INT;
			INSERT INTO Pais (nombre_Pais) VALUES ('Chile');
			SET @PaisID = SCOPE_IDENTITY();
		
			-- Provocar un error después del primer insert para simular 
			-- una falla (se puede comentar esta línea para probar sin errores)
			THROW 50001, 'Error simulado después de insertar Pais', 1;

			-- Insertar una provincia relacionada con el país
			INSERT INTO Provincia (nombre_Provincia, id_Pais) VALUES ('Santiago', @PaisID);

			-- Confirmar la transacción
			COMMIT TRANSACTION;
			PRINT 'Transacción completada con éxito';
	END TRY
	BEGIN CATCH
			-- Revertir la transacción en caso de error
			ROLLBACK TRANSACTION;
			PRINT 'Error en la transacción. Operación revertida.';
			DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
			PRINT @ErrorMessage;
	END CATCH;


-- Ejemplo de una transacción implícita	
		
	SET IMPLICIT_TRANSACTIONS ON;

	-- Inicia automáticamente una transacción
	INSERT INTO Pais (nombre_Pais) VALUES ('Brasil');

	-- Confirmar la transacción manualmente
	COMMIT TRANSACTION;

	-- Inicia automáticamente otra transacción
	UPDATE Vehiculos SET codigo_OKM = 1 WHERE id_Vehiculo = 100;

	-- Revertir la transacción manualmente en caso de error
	ROLLBACK TRANSACTION;

	SET IMPLICIT_TRANSACTIONS OFF;

-- Ejemplo de una transacción en ámbito de lote		

		BEGIN TRANSACTION;

		-- Insertar un nuevo país y obtener su ID
		DECLARE @PaisID INT;
		INSERT INTO Pais (nombre_Pais) VALUES ('Uruguay');
		SET @PaisID = SCOPE_IDENTITY();

		-- Se podría iniciar otro lote o consulta en la misma conexión de MARS aquí.

		-- Si el lote finaliza sin un COMMIT o ROLLBACK explícito,
		-- SQL Server revertirá automáticamente la transacción cuando se complete el lote.

		-- Confirmar la transacción manualmente
		COMMIT TRANSACTION;


-- Ejemplo de una transacción anidada
	BEGIN TRY
		BEGIN TRANSACTION;  -- Transacción principal

			-- Primera operación: Insertar un país
			DECLARE @PaisID INT;
			INSERT INTO Pais (nombre_Pais) VALUES ('Chile');
			SET @PaisID = SCOPE_IDENTITY();

			-- Transacción anidada
			BEGIN TRANSACTION;  -- Inicia la transacción anidada

			-- Segunda operación (dentro de la transacción anidada):
			--Insertar una provincia relacionada con el país

			DECLARE @ProvinciaID INT;
			INSERT INTO Provincia (nombre_Provincia, id_Pais) VALUES ('Santiago', @PaisID);
			SET @ProvinciaID = SCOPE_IDENTITY();

			-- Provocar un error después del primer insert para 
			-- simular una falla (se puede comentar esta línea para probar sin errores)
			THROW 50001, 'Error simulado después de insertar provincia', 1;

			-- Confirmación de la transacción anidada
			COMMIT TRANSACTION;  -- Aunque se confirma, no será efectiva hasta 
								-- que se confirme la transacción principal

			-- Tercera operación: Actualizar el estado de un vehículo
			UPDATE Vehiculos SET codigo_OKM = 1 WHERE id_Vehiculo = 101;
			select * from Vehiculos

			-- Confirmación de la transacción principal
			COMMIT TRANSACTION;
			PRINT 'Transacción completada con éxito';

	END TRY
	BEGIN CATCH
			-- En caso de error, se revierte toda la transacción
			ROLLBACK TRANSACTION;
			PRINT 'Error en la transacción. Operación revertida.';
	END CATCH;

-- Ejemplo de actualizacion de datos de la tabla vehiculo

	BEGIN TRY
		BEGIN TRAN
		UPDATE Vehiculos SET codigo_OKM = 1 WHERE id_Vehiculo = 100;
		-- Provocar un error después del update para 
		-- simular una falla (se puede comentar esta línea para probar sin errores)
		-- THROW 50001, 'Error simulado después de insertar provincia', 1;
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN;
			PRINT 'Error en la transacción. Operación revertida.';
	END CATCH
