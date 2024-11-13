# Manejo de Permisos a Nivel de Usuarios en Base de Datos

## ¿Qué son los permisos en SQL Server?
En SQL Server, los permisos son reglas que determinan qué operaciones pueden realizar los usuarios en la base de datos. Esto incluye acciones como leer, escribir o ejecutar procedimientos almacenados. Los permisos se pueden asignar directamente a usuarios o agruparlos en roles para una administración más sencilla y eficiente.

El manejo correcto de permisos garantiza la seguridad y el control de acceUna correcta gestión de permisos garantiza:
**Seguridad de los datos**: Evita accesos no autorizados.
**Organización eficiente**: Simplifica la administración de grandes equipos. **Reduciendo el riesgo de modificaciones**: no autorizadas o malintencionadas. 

## ¿Cómo se configuran los permisos?
#### SQL Server permite gestionar permisos a dos niveles principales:

SQL Server permite gestionar permisos a dos niveles principales:

**A nivel de usuario**: Permite asignar permisos específicos a usuarios individuales según sus necesidades.
**A nivel de roles**: Agrupa permisos y los asigna a roles específicos, esto facilita la administración de permisos para grupos grandes de usuarios con necesidades similares. 
Los usuarios se asignan a estos roles como por ejemplo vendedor, cajero o administrador.

### Caso Práctico: Permisos a Nivel de Usuarios
#### Escenario
En nuestro proyecto que es acerca de una base de datos para una concesionaria, necesitamos configurar permisos para los siguientes empleados:

** *Administrador**: Tiene control total sobre la base de datos (lectura, escritura, creación de tablas, etc.).
** *Vendedor**: Puede consultar información de vehículos, registrar clientes y realizar pedidos.
** *Cajero**: Puede gestionar los pagos y generar facturas, pero no puede modificar datos de vehículos ni clientes.

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
3. Probar los permisos asignados

Administrador: Debe poder realizar todas las operaciones sin restricciones.

Vendedor: Intenta registrar un nuevo cliente y crear un pedido. También intenta eliminar un vehículo (debe denegarse).

Cajero: Realiza un pago y genera una factura. Intenta registrar un cliente (debe denegarse).


### Caso Práctico: Permisos a Nivel de Roles
Escenario
Para simplificar la administración, crearemos roles específicos para los empleados y les asignaremos permisos según sus funciones.

#### Pasos
1. Crear roles y asignar permisos
```
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
```

2. Pruebas de acceso

Administrador: Puede realizar cualquier operación, incluida la creación de tablas y procedimientos.

Vendedor: Consulta vehículos, registra clientes y genera pedidos. No puede modificar datos de pago.

Cajero: Genera facturas y gestiona pagos. No puede modificar vehículos ni registrar clientes.

### Resultados Esperados
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
