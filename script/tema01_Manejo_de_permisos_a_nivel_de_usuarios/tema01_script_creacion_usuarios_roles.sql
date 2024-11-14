--Crear los usuarios en la base de datos
CREATE LOGIN Admin WITH PASSWORD = 'Admin123!';
CREATE USER Admin FOR LOGIN Admin;

-- Crear usuario Vendedor
CREATE LOGIN Vendedor WITH PASSWORD = 'Vendedor123!';
CREATE USER Vendedor FOR LOGIN Vendedor;

-- Crear usuario Cajero
CREATE LOGIN Cajero WITH PASSWORD = 'Cajero123!';
CREATE USER Cajero FOR LOGIN Cajero;




--Asignar permisos específicos a cada usuario
ALTER ROLE db_owner ADD MEMBER Admin;

-- Asignar permisos al Vendedor
GRANT SELECT ON dbo.Vehiculos TO Vendedor; -- Consultar vehículos
GRANT INSERT ON dbo.Cliente TO Vendedor; -- Registrar clientes
GRANT INSERT ON dbo.Pedido TO Vendedor; -- Crear pedidos

-- Asignar permisos al Cajero
GRANT SELECT ON dbo.Pedido TO Cajero; -- Consultar pedidos
GRANT INSERT ON dbo.Pago TO Cajero; -- Registrar pagos
GRANT INSERT ON dbo.Factura TO Cajero; -- Generar facturas





--Crear roles y asignar permisos
-- Crear el rol Administrador
CREATE ROLE Administrador;
ALTER ROLE Administrador ADD MEMBER Admin; -- Asignar rol al usuario Admin

-- Crear el rol Vendedor
CREATE ROLE Vendedor;
GRANT SELECT ON dbo.Vehiculos TO Vendedor;
GRANT INSERT ON dbo.Cliente TO Vendedor;
GRANT INSERT ON dbo.Pedido TO Vendedor;
GRANT INSERT ON dbo.Detalle_Pedido TO Vendedor;
EXEC sp_addrolemember 'Vendedor', 'Vendedor';

-- Crear el rol Cajero
CREATE ROLE Cajero;
GRANT SELECT ON dbo.Pedido TO Cajero;
GRANT INSERT ON dbo.Pago TO Cajero;
GRANT INSERT ON dbo.Factura TO Cajero;
EXEC sp_addrolemember 'Cajero', 'Cajero';
