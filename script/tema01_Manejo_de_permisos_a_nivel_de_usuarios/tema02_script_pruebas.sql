/* Pruebas para el Administrador (Admin)
El administrador tiene acceso completo a la base de datos, por lo que puede realizar cualquier operación:*/

USE StoredOps;

-- Crear una nueva tabla (solo el Administrador debería poder hacerlo)
CREATE TABLE Prueba_Admin (
    id INT PRIMARY KEY,
    descripcion VARCHAR(50)
);

-- Insertar un registro en la tabla Vehiculos
INSERT INTO Vehiculos (marca_Vehiculo, modelo_Vehiculo, version_Vehiculo, km_Vehiculo, anio_Vehiculo, precio_Vehiculo, id_tipoVehiculo, id_Estado, id_Condicion)
VALUES ('Toyota', 'Corolla', 'XLE', 15000, '2020-01-01', 20000, 1, 1, 1);

-- Eliminar un vehículo (solo el Administrador debería poder hacerlo)
DELETE FROM Vehiculos WHERE id_Vehiculo = 100;


/* Pruebas para el Vendedor
El vendedor tiene permisos para consultar información de vehículos, registrar clientes y crear pedidos, 
pero no debería poder modificar datos de pagos ni eliminar vehículos.*/

USE StoredOps;

-- Consultar información de vehículos
SELECT * FROM Vehiculos;

-- Registrar un nuevo cliente
INSERT INTO Cliente (email_Cliente, celular_Cliente, calle_Cliente, num_Calle, piso_Cliente, dpto_Cliente, codigo_PostalCliente, id_Estado_Cliente, id_Localidad)
VALUES ('cliente@example.com', '1234567890', 'Calle Falsa', 123, 1, 'A', 1234, 1, 1);

-- Crear un nuevo pedido
INSERT INTO Pedido (cuil_Empleado, num_Factura, id_Cliente)
VALUES ('20304050607', 1, 1);

-- Intentar eliminar un vehículo (esto debería ser denegado)
DELETE FROM Vehiculos WHERE id_Vehiculo = 101; -- Espera un error de permisos


/* Pruebas para el Cajero
El cajero tiene permisos para gestionar pagos y generar facturas, pero no puede modificar datos de vehículos ni registrar nuevos clientes.*/ 

USE StoredOps;

-- Realizar un pago
INSERT INTO Pago (descripcion_Pago, importe_Pago, id_TipoPago, id_EstadoPago, num_Factura)
VALUES ('Pago Inicial', 5000, 1, 1, 1);

-- Generar una factura
INSERT INTO Factura (fecha_Factura, total_Factura, id_EstadoFactura)
VALUES (GETDATE(), 5000, 1);

-- Intentar registrar un cliente (esto debería ser denegado)
INSERT INTO Cliente (email_Cliente, celular_Cliente, calle_Cliente, num_Calle, piso_Cliente, dpto_Cliente, codigo_PostalCliente, id_Estado_Cliente, id_Localidad)
VALUES ('cliente1@example.com', '0987654321', 'Calle Nueva', 456, 2, 'B', 5678, 1, 1); -- Espera un error de permisos
