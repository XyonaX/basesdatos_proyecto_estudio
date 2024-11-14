# Manejo de Permisos a Nivel de Usuarios en Base de Datos

## ¿Qué son los permisos en SQL Server?
En SQL Server, los permisos son reglas que determinan qué operaciones pueden realizar los usuarios en la base de datos. Esto incluye acciones como leer, escribir o ejecutar procedimientos almacenados. Los permisos se pueden asignar directamente a usuarios o agruparlos en roles para una administración más sencilla y eficiente.

El manejo correcto de permisos garantiza la seguridad y el control de acceUna correcta gestión de permisos garantiza:
**Seguridad de los datos**: Evita accesos no autorizados.
**Organización eficiente**: Simplifica la administración de grandes equipos. 
**Reduciendo el riesgo de modificaciones**: no autorizadas o malintencionadas. 

## ¿Cómo se configuran los permisos?
#### SQL Server permite gestionar permisos a dos niveles principales:

**A nivel de usuario**: Permite asignar permisos específicos a usuarios individuales según sus necesidades.
**A nivel de roles**: Agrupa permisos y los asigna a roles específicos, esto facilita la administración de permisos para grupos grandes de usuarios con necesidades similares. 
Los usuarios se asignan a estos roles como por ejemplo vendedor, cajero o administrador.

### Caso Práctico: Permisos a Nivel de Usuarios
#### Escenario
En nuestro proyecto que es acerca de una base de datos para una concesionaria, necesitamos configurar permisos para los siguientes empleados:

**Administrador**: Tiene control total sobre la base de datos (lectura, escritura, creación de tablas, etc.).

**Vendedor**: Puede consultar información de vehículos, registrar clientes y realizar pedidos.

**Cajero**: Puede gestionar los pagos y generar facturas, pero no puede modificar datos de vehículos ni clientes.

#### Pasos
1. Crear los usuarios en la base de datos
```-- Crear usuario Administrador
CREATE LOGIN Admin WITH PASSWORD = 'Admin123!';
CREATE USER Admin FOR LOGIN Admin;

-- Crear usuario Vendedor
CREATE LOGIN Vendedor WITH PASSWORD = 'Vendedor123!';
CREATE USER Vendedor FOR LOGIN Vendedor;

-- Crear usuario Cajero
CREATE LOGIN Cajero WITH PASSWORD = 'Cajero123!';
CREATE USER Cajero FOR LOGIN Cajero;
```
2. Asignar permisos específicos a cada usuario

```-- Asignar permisos al Administrador
ALTER ROLE db_owner ADD MEMBER Admin;

-- Asignar permisos al Vendedor
GRANT SELECT ON dbo.Vehiculos TO Vendedor; -- Consultar vehículos
GRANT INSERT ON dbo.Cliente TO Vendedor; -- Registrar clientes
GRANT INSERT ON dbo.Pedido TO Vendedor; -- Crear pedidos
GRANT INSERT ON dbo.Detalle_Pedido TO Vendedor; -- Añadir detalles al pedido

-- Asignar permisos al Cajero
GRANT SELECT ON dbo.Pedido TO Cajero; -- Consultar pedidos
GRANT INSERT ON dbo.Pago TO Cajero; -- Registrar pagos
GRANT INSERT ON dbo.Factura TO Cajero; -- Generar facturas
```

3. Pruebas de acceso

Administrador: Puede realizar cualquier operación, incluida la creación de tablas y procedimientos.
```
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
```

Vendedor: Consulta vehículos, registra clientes y genera pedidos. No puede modificar datos de pago.
```
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
```

Cajero: Genera facturas y gestiona pagos. No puede modificar vehículos ni registrar clientes.
```
USE StoredOps;

-- Realizar un pago
INSERT INTO Pago (descripcion_Pago, importe_Pago, id_TipoPago, id_EstadoPago, num_Factura)
VALUES ('Pago Inicial', 5000, 1, 1, 1);

-- Generar una factura
INSERT INTO Factura (fecha_Factura, total_Factura, id_EstadoFactura)
VALUES (GETDATE(), 5000, 1);

-- Intentar registrar un cliente (esto debería ser denegado)
INSERT INTO Cliente (email_Cliente, celular_Cliente, calle_Cliente, num_Calle, piso_Cliente, dpto_Cliente, codigo_PostalCliente, id_Estado_Cliente, id_Localidad)
VALUES ('otro_cliente@example.com', '0987654321', 'Calle Nueva', 456, 2, 'B', 5678, 1, 1); -- Espera un error de permisos
```

### Resultados obtenidos
**Administrador**:
Tiene control total sobre la base de datos.
Puede crear, modificar y consultar cualquier dato.

**Vendedor**:
Puede consultar vehículos y registrar clientes.
Puede crear pedidos, pero no puede modificar tablas o eliminar datos.

**Cajero**:
Puede gestionar pagos y generar facturas.
No tiene acceso a modificar datos de vehículos ni clientes.

## Ventajas de la Gestión de Permisos
Seguridad: Restringe el acceso según las necesidades específicas de cada usuario.
Flexibilidad: Los roles simplifican la asignación de permisos en entornos con múltiples usuarios.
Auditoría: Facilita el seguimiento de actividades y asignación de responsabilidades.

## Conclusión
El manejo de permisos en SQL Server es una herramienta poderosa para proteger la integridad y confidencialidad de los datos. 
Implementar permisos adecuados según las necesidades garantiza que cada usuario solo pueda realizar las acciones necesarias para su rol, evitando riesgos innecesarios mejora la eficiencia operativa.

### Fuentes
1. [SQL Server - Documentación Oficial](https://learn.microsoft.com/es-es/sql/sql-server/?view=sql-server-ver16)
2. [Configurar Seguridad en SQL Server](https://learn.microsoft.com/es-es/sql/relational-databases/security/authentication-access/create-a-database-user?view=sql-server-ver16)
