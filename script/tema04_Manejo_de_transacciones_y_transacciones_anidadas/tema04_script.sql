		
-- Ejemplo de una transacción de confirmación automático			
		
		-- Insertar un nuevo país
		INSERT INTO Pais (nombre_Pais) VALUES ('Argentina');

		-- Actualizar el estado de un vehículo
		UPDATE Vehiculos SET id_Estado = 2 WHERE id_Vehiculo = 100;




-- Ejemplo de una transacción explícita	

		BEGIN TRANSACTION;

		BEGIN TRY
			-- Insertar un nuevo país
			DECLARE @PaisID INT;
			INSERT INTO Pais (nombre_Pais) VALUES ('Chile');
			SET @PaisID = SCOPE_IDENTITY();

			-- Insertar una provincia relacionada con el país
			INSERT INTO Provincia (nombre_Provincia, id_Pais) VALUES ('Santiago', @PaisID);

			-- Confirmar la transacción
			COMMIT;
			PRINT 'Transacción completada con éxito';
		END TRY
		BEGIN CATCH
			-- Revertir la transacción en caso de error
			ROLLBACK;
			PRINT 'Error en la transacción. Operación revertida.';
		END CATCH;


-- Ejemplo de una transacción implícita	
		
	SET IMPLICIT_TRANSACTIONS ON;

	-- Inicia automáticamente una transacción
	INSERT INTO Pais (nombre_Pais) VALUES ('Brasil');

	-- Confirmar la transacción manualmente
	COMMIT;

	-- Inicia automáticamente otra transacción
	UPDATE Vehiculos SET id_Estado = 1 WHERE id_Vehiculo = 100;

	-- Revertir la transacción manualmente en caso de error
	ROLLBACK;

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
		COMMIT;


-- Ejemplo de una transacción anidada

		BEGIN TRANSACTION;  -- Transacción principal

		BEGIN TRY
			-- Primera operación: Insertar un país
			DECLARE @PaisID INT;
			INSERT INTO Pais (nombre_Pais) VALUES ('Paraguay');
			SET @PaisID = SCOPE_IDENTITY();

			-- Transacción anidada
			BEGIN TRANSACTION;  -- Inicia la transacción anidada

			-- Segunda operación (dentro de la transacción anidada): Insertar una provincia relacionada con el país
			DECLARE @ProvinciaID INT;
			INSERT INTO Provincia (nombre_Provincia, id_Pais) VALUES ('Asuncion', @PaisID);
			SET @ProvinciaID = SCOPE_IDENTITY();

			-- Confirmación de la transacción anidada
			COMMIT TRANSACTION;  -- Aunque se confirma, no será efectiva hasta que se confirme la transacción principal

			-- Tercera operación: Actualizar el estado de un vehículo
			UPDATE Vehiculos SET id_Estado = 3 WHERE id_Vehiculo = 101;

			-- Confirmación de la transacción principal
			COMMIT TRANSACTION;
			PRINT 'Transacción completada con éxito';

		END TRY
		BEGIN CATCH
			-- En caso de error, se revierte toda la transacción
			ROLLBACK TRANSACTION;
			PRINT 'Error en la transacción. Operación revertida.';
		END CATCH;
		
		select * from Vehiculos


	BEGIN TRY
		BEGIN TRANSACTION -- Inicio de la transacción principal

		-- Paso 1: Insertar un nuevo cliente en la tabla Cliente
		DECLARE @ClienteID INT;
		INSERT INTO Cliente (email_Cliente, celular_Cliente, calle_Cliente, num_Calle, piso_Cliente, dpto_Cliente, codigo_PostalCliente, id_Estado_Cliente, id_Localidad)
		VALUES ('cliente@example.com', '555-1234', 'Calle Ejemplo', 123, 1, 'A', 1000, 1, 1);
		SET @ClienteID = SCOPE_IDENTITY();

		-- Provocar un error después del primer insert para simular una falla (se puede comentar esta línea para probar sin errores)
		THROW 50001, 'Error simulado después de insertar cliente', 1;

		-- Paso 2: Insertar una nueva factura para el cliente
		DECLARE @FacturaID INT;
		INSERT INTO Factura (fecha_Factura, total_Factura, id_EstadoFactura)
		VALUES (GETDATE(), 1500.00, 1); -- EstadoFactura ID 1 podría representar "Pendiente" o "Emitida"
		SET @FacturaID = SCOPE_IDENTITY();

		-- Paso 3: Insertar un nuevo pedido para el cliente
		DECLARE @PedidoID INT;
		INSERT INTO Pedido (cuil_Empleado, num_Factura, id_Cliente)
		VALUES ('12345678901', @FacturaID, @ClienteID); -- Aquí se requiere un cuil de un empleado válido
		SET @PedidoID = SCOPE_IDENTITY();

		-- Paso 4: Insertar detalles de pedido en la tabla Detalle_Pedido
		INSERT INTO Detalle_Pedido (id_Vehiculo, id_Pedido, subtotal_DetallePedido)
		VALUES (100, @PedidoID, 1500.00); -- id_Vehiculo 100 sería un vehículo específico en el inventario

		-- Confirmar la transacción si todo es exitoso
		COMMIT TRANSACTION;
		PRINT 'Transacción completada con éxito';
	END TRY
	BEGIN CATCH
		-- Si ocurre un error, revertir la transacción
		ROLLBACK TRANSACTION;
		PRINT 'Error en la transacción. Operación revertida.';

		-- Opcional: Mostrar el mensaje de error
		DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
		PRINT @ErrorMessage;
	END CATCH;

