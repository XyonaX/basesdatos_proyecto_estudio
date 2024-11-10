		
-- Ejemplo de una transacci�n de confirmaci�n autom�tico			
		
		-- Insertar un nuevo pa�s
		INSERT INTO Pais (nombre_Pais) VALUES ('Argentina');

		-- Actualizar el estado de un veh�culo
		UPDATE Vehiculos SET id_Estado = 2 WHERE id_Vehiculo = 100;




-- Ejemplo de una transacci�n expl�cita	

		BEGIN TRANSACTION;

		BEGIN TRY
			-- Insertar un nuevo pa�s
			DECLARE @PaisID INT;
			INSERT INTO Pais (nombre_Pais) VALUES ('Chile');
			SET @PaisID = SCOPE_IDENTITY();

			-- Insertar una provincia relacionada con el pa�s
			INSERT INTO Provincia (nombre_Provincia, id_Pais) VALUES ('Santiago', @PaisID);

			-- Confirmar la transacci�n
			COMMIT;
			PRINT 'Transacci�n completada con �xito';
		END TRY
		BEGIN CATCH
			-- Revertir la transacci�n en caso de error
			ROLLBACK;
			PRINT 'Error en la transacci�n. Operaci�n revertida.';
		END CATCH;


-- Ejemplo de una transacci�n impl�cita	
		
	SET IMPLICIT_TRANSACTIONS ON;

	-- Inicia autom�ticamente una transacci�n
	INSERT INTO Pais (nombre_Pais) VALUES ('Brasil');

	-- Confirmar la transacci�n manualmente
	COMMIT;

	-- Inicia autom�ticamente otra transacci�n
	UPDATE Vehiculos SET id_Estado = 1 WHERE id_Vehiculo = 100;

	-- Revertir la transacci�n manualmente en caso de error
	ROLLBACK;

	SET IMPLICIT_TRANSACTIONS OFF;

-- Ejemplo de una transacci�n en �mbito de lote		

		BEGIN TRANSACTION;

		-- Insertar un nuevo pa�s y obtener su ID
		DECLARE @PaisID INT;
		INSERT INTO Pais (nombre_Pais) VALUES ('Uruguay');
		SET @PaisID = SCOPE_IDENTITY();

		-- Se podr�a iniciar otro lote o consulta en la misma conexi�n de MARS aqu�.

		-- Si el lote finaliza sin un COMMIT o ROLLBACK expl�cito,
		-- SQL Server revertir� autom�ticamente la transacci�n cuando se complete el lote.

		-- Confirmar la transacci�n manualmente
		COMMIT;


-- Ejemplo de una transacci�n anidada

		BEGIN TRANSACTION;  -- Transacci�n principal

		BEGIN TRY
			-- Primera operaci�n: Insertar un pa�s
			DECLARE @PaisID INT;
			INSERT INTO Pais (nombre_Pais) VALUES ('Paraguay');
			SET @PaisID = SCOPE_IDENTITY();

			-- Transacci�n anidada
			BEGIN TRANSACTION;  -- Inicia la transacci�n anidada

			-- Segunda operaci�n (dentro de la transacci�n anidada): Insertar una provincia relacionada con el pa�s
			DECLARE @ProvinciaID INT;
			INSERT INTO Provincia (nombre_Provincia, id_Pais) VALUES ('Asuncion', @PaisID);
			SET @ProvinciaID = SCOPE_IDENTITY();

			-- Confirmaci�n de la transacci�n anidada
			COMMIT TRANSACTION;  -- Aunque se confirma, no ser� efectiva hasta que se confirme la transacci�n principal

			-- Tercera operaci�n: Actualizar el estado de un veh�culo
			UPDATE Vehiculos SET id_Estado = 3 WHERE id_Vehiculo = 101;

			-- Confirmaci�n de la transacci�n principal
			COMMIT TRANSACTION;
			PRINT 'Transacci�n completada con �xito';

		END TRY
		BEGIN CATCH
			-- En caso de error, se revierte toda la transacci�n
			ROLLBACK TRANSACTION;
			PRINT 'Error en la transacci�n. Operaci�n revertida.';
		END CATCH;
		
		select * from Vehiculos


	BEGIN TRY
		BEGIN TRANSACTION -- Inicio de la transacci�n principal

		-- Paso 1: Insertar un nuevo cliente en la tabla Cliente
		DECLARE @ClienteID INT;
		INSERT INTO Cliente (email_Cliente, celular_Cliente, calle_Cliente, num_Calle, piso_Cliente, dpto_Cliente, codigo_PostalCliente, id_Estado_Cliente, id_Localidad)
		VALUES ('cliente@example.com', '555-1234', 'Calle Ejemplo', 123, 1, 'A', 1000, 1, 1);
		SET @ClienteID = SCOPE_IDENTITY();

		-- Provocar un error despu�s del primer insert para simular una falla (se puede comentar esta l�nea para probar sin errores)
		THROW 50001, 'Error simulado despu�s de insertar cliente', 1;

		-- Paso 2: Insertar una nueva factura para el cliente
		DECLARE @FacturaID INT;
		INSERT INTO Factura (fecha_Factura, total_Factura, id_EstadoFactura)
		VALUES (GETDATE(), 1500.00, 1); -- EstadoFactura ID 1 podr�a representar "Pendiente" o "Emitida"
		SET @FacturaID = SCOPE_IDENTITY();

		-- Paso 3: Insertar un nuevo pedido para el cliente
		DECLARE @PedidoID INT;
		INSERT INTO Pedido (cuil_Empleado, num_Factura, id_Cliente)
		VALUES ('12345678901', @FacturaID, @ClienteID); -- Aqu� se requiere un cuil de un empleado v�lido
		SET @PedidoID = SCOPE_IDENTITY();

		-- Paso 4: Insertar detalles de pedido en la tabla Detalle_Pedido
		INSERT INTO Detalle_Pedido (id_Vehiculo, id_Pedido, subtotal_DetallePedido)
		VALUES (100, @PedidoID, 1500.00); -- id_Vehiculo 100 ser�a un veh�culo espec�fico en el inventario

		-- Confirmar la transacci�n si todo es exitoso
		COMMIT TRANSACTION;
		PRINT 'Transacci�n completada con �xito';
	END TRY
	BEGIN CATCH
		-- Si ocurre un error, revertir la transacci�n
		ROLLBACK TRANSACTION;
		PRINT 'Error en la transacci�n. Operaci�n revertida.';

		-- Opcional: Mostrar el mensaje de error
		DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
		PRINT @ErrorMessage;
	END CATCH;

