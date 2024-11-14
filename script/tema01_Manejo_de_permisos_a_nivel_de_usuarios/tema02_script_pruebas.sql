
USE StoredOps;
/* Pruebas para el Administrador (Admin)
El administrador tiene acceso completo a la base de datos, por lo que puede realizar cualquier operación:*/
-- Crear una nueva tabla (solo el Administrador debería poder hacerlo)
EXECUTE AS USER = 'Admin';

-- Crear una tabla de ejemplo (ejecutada como Admin)
CREATE TABLE Ejemplo_Admin (
    id INT PRIMARY KEY,
    nombre VARCHAR(50)
);

-- Insertar un registro en la tabla Vehiculos
INSERT INTO Vehiculos (marca_Vehiculo, modelo_Vehiculo, version_Vehiculo, km_Vehiculo, anio_Vehiculo, precio_Vehiculo, id_tipoVehiculo)
VALUES ('Toyota', 'Corolla', 'XLE', 15000, '2020-01-01', 20000, 1);

-- Eliminar un vehículo (solo el Administrador debería poder hacerlo)
DELETE FROM Vehiculos WHERE id_Vehiculo = 109;

/* Pruebas para el Vendedor
El vendedor tiene permisos para consultar información de vehículos, registrar clientes y crear pedidos, 
pero no debería poder modificar datos de pagos ni eliminar vehículos.*/

EXECUTE AS USER = 'Vendedor';

-- Consultar información de vehículos
SELECT * FROM Vehiculos;

-- Registrar un nuevo cliente
INSERT INTO Cliente (nombre_Cliente, apellido_Cliente, dni_Cliente, cuil_Cliente, fechaNac_Cliente, email_Cliente, celular_Cliente, calle_Cliente, num_Calle, piso_Cliente, dpto_Cliente, codigo_PostalCliente, id_Localidad) 
VALUES ('Carlos', 'Gomez', '37931852', '20379318521', '1985-05-05', 'carlos.gomez2@cliente.com', '3795185252', 'Calle Falsa', 123, 1, 'A', 5001, 2);

-- Crear un nuevo pedido
INSERT INTO Pedido (cuil_Empleado, id_Cliente, id_Vehiculo, fecha_Pedido, monto_Pedido, id_EstadoPedido) 
VALUES 
    ('20304050607', 1, 100, '2023-01-01', 25500, 1);

-- Intentar eliminar un vehículo (esto debería ser denegado)
DELETE FROM Vehiculos WHERE id_Vehiculo = 101; -- Espera un error de permisos


/* Pruebas para el Cajero
El cajero tiene permisos para gestionar pagos y generar facturas, pero no puede modificar datos de vehículos ni registrar nuevos clientes.*/ 

EXECUTE AS USER = 'Cajero';

-- Realizar un pago
INSERT INTO Pago (descripcion_Pago, importe_Pago, id_TipoPago, id_EstadoPago, id_Pedido) 
VALUES 
('Pago en efectivo', 18000.00, 2, 2, 8005);

-- Generar una factura
INSERT INTO Factura (fecha_Factura, total_Factura, id_pago) 
VALUES 
(GETDATE(), 11000.00, 1);

-- Intentar registrar un cliente (esto debería ser denegado)
INSERT INTO Cliente (nombre_Cliente, apellido_Cliente, dni_Cliente, cuil_Cliente, fechaNac_Cliente, email_Cliente, celular_Cliente, calle_Cliente, num_Calle, piso_Cliente, dpto_Cliente, codigo_PostalCliente, id_Localidad) 
VALUES ('Maria', 'Gonzalez', '36517962', '20365179621', '1985-05-05', 'mariagon@cliente.com', '379554321', 'Calle Falsa', 123, 1, 'A', 5001, 2);


