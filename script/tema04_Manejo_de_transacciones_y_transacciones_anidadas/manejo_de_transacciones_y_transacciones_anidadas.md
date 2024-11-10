# Manejo de Transacciones y Transacciones Anidadas

## ¿Qué es una transacción?

Una **transacción** es una unidad única de trabajo. Si una transacción tiene éxito, todas las modificaciones de los datos realizadas durante la transacción se confirman y se convierten en una parte permanente de la base de datos. Si la transacción encuentra errores y debe cancelarse o revertirse, se borran todas las modificaciones de los datos.

### Modos de transacción en SQL Server

- **Transacciones de confirmación automática**: Cada instrucción individual es una transacción.
- **Transacciones explícitas**: La transacción se inicia explícitamente con `BEGIN TRANSACTION` y se termina explícitamente con una instrucción `COMMIT` o `ROLLBACK`.
- **Transacciones implícitas**: Una nueva transacción se inicia implícitamente al completarse la anterior, pero se completa explícitamente con una instrucción `COMMIT` o `ROLLBACK`.
- **Transacciones de ámbito de lote**: Una transacción implícita o explícita de Transact-SQL que se inicia en una sesión de MARS (conjuntos de resultados activos múltiples) y se convierte en una transacción de ámbito de lote.

### Instrucciones de transacción en SQL Server

- **`BEGIN TRANSACTION` o `BEGIN TRAN`**: Marca el inicio de una transacción.
- **`ROLLBACK TRANSACTION` o `ROLLBACK TRAN`**: Revierte la transacción en caso de error o para abandonarla.
- **`COMMIT TRANSACTION` o `COMMIT TRAN`**: Confirma el conjunto de operaciones, haciendo los datos definitivos.

#### Ejemplos
- **Transacciones de confirmación automática**
```
		--Insertar un nuevo país
		INSERT INTO Pais (nombre_Pais) VALUES ('Argentina');
		-- Actualizar el estado de un vehículo
		UPDATE Vehiculos SET id_Estado = 2 WHERE id_Vehiculo = 100;
```
		
- **Transacciones explícitas**
```
	BEGIN TRANSACTION;

		BEGIN TRY
			-- Insertar un nuevo país
			DECLARE @PaisID INT;
			INSERT INTO Pais (nombre_Pais) VALUES ('Chile');
			SET @PaisID = SCOPE_IDENTITY();

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
		END CATCH;
```
- **Transacciones implícitas**
```
	SET IMPLICIT_TRANSACTIONS ON;

	-- Inicia automáticamente una transacción
	INSERT INTO Pais (nombre_Pais) VALUES ('Brasil');

	-- Confirmar la transacción manualmente
	COMMIT TRANSACTION;

	-- Inicia automáticamente otra transacción
	UPDATE Vehiculos SET id_Estado = 1 WHERE id_Vehiculo = 100;

	-- Revertir la transacción manualmente en caso de error
	ROLLBACK TRANSACTION;

	SET IMPLICIT_TRANSACTIONS OFF;
```
- **Transacciones en ámbito de lote**
```
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
```

## ¿Qué es una transacción anidada?

Una **transacción anidada** es una transacción que se inicia dentro del contexto de otra transacción activa. En SQL Server, si se llama a `BEGIN TRANSACTION` dentro de una transacción ya existente, se crea una transacción anidada. Las transacciones anidadas son útiles para estructurar operaciones complejas que requieren varios niveles de procesamiento de datos, con la posibilidad de revertir en caso de errores.

> **Nota**: SQL Server no soporta completamente las transacciones anidadas. Solo la transacción más externa controla el `COMMIT` o `ROLLBACK`. Si se produce un `ROLLBACK` en una transacción interna, SQL Server revierte toda la transacción hasta el primer `BEGIN TRANSACTION`.

### Ejemplo de una transacción anidada
```
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
```

## Ventajas de las transacciones

1. **Atomicidad**
   - La atomicidad asegura que una serie de operaciones dentro de una transacción se ejecuten completamente o no se ejecuten en absoluto.

2. **Consistencia**
   - Las transacciones mantienen la consistencia de los datos, cumpliendo con todas las reglas y restricciones definidas en la base de datos.

3. **Aislamiento**
   - Permite que varias transacciones se ejecuten simultáneamente sin interferir entre sí.

4. **Durabilidad**
   - Una vez que una transacción se confirma, los cambios son permanentes, incluso en caso de un fallo posterior del sistema.

5. **Manejo de errores y recuperación**
   - Proporciona un mecanismo controlado para manejar errores. Si ocurre un error, todos los cambios realizados hasta ese momento se revierten automáticamente.

6. **Mejora en la concurrencia y eficiencia**
   - Facilita el manejo eficiente de accesos concurrentes, minimizando conflictos y mejorando el rendimiento.

7. **Seguridad y control en los cambios de datos**
   - Limita el acceso a los datos solo a las operaciones que se confirman (`commit`), añadiendo una capa de seguridad crucial en sistemas con datos sensibles.

## Fuentes

1. [Transacciones en SQL Server - Documentación de Microsoft](https://learn.microsoft.com/es-es/sql/t-sql/language-elements/transactions-transact-sql?view=sql-server-ver16)
2. [Transacciones en SQL Server - Programación.net](https://programacion.net/articulo/transacciones_en_sql_server_299)
3. [Transacciones en SQL Server para principiantes - SQL Shack](https://www.sqlshack.com/transactions-in-sql-server-for-beginners/)

