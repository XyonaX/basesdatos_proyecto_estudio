-- DEFINNICIÓN DEL MODELO DE DATOS

CREATE DATABASE StoredOps;
GO
USE StoredOps;
GO

CREATE TABLE Pais
(
  id_Pais INT IDENTITY(1,1) NOT NULL,
  nombre_Pais VARCHAR(50) NOT NULL,
  CONSTRAINT PK_Pais PRIMARY KEY (id_Pais)
);

CREATE TABLE Tipo_Vehiculo
(
  id_tipoVehiculo INT IDENTITY(1,1) NOT NULL,
  nombre_tipoVehiculo VARCHAR(15) NOT NULL,
  CONSTRAINT PK_TipoVehiculo PRIMARY KEY (id_tipoVehiculo)
);

CREATE TABLE Estado_Vehiculo
(
  id_Estado INT IDENTITY(1,1) NOT NULL,
  nombre_Estado VARCHAR(10) NOT NULL,
  CONSTRAINT PK_Estado PRIMARY KEY (id_Estado)
);

CREATE TABLE Tipo_Pago
(
  id_TipoPago INT IDENTITY(1,1) NOT NULL,
  nombre_tipoPago VARCHAR(20) NOT NULL,
  CONSTRAINT PK_TipoPago PRIMARY KEY (id_TipoPago)
);

CREATE TABLE Perfil_Empleado
(
  id_perfil INT IDENTITY(1,1) NOT NULL,
  nombre_Perfil VARCHAR(20) NOT NULL,
  CONSTRAINT PK_Perfil PRIMARY KEY (id_perfil)
);

CREATE TABLE Condicion
(
  id_Condicion INT IDENTITY(1,1) NOT NULL,
  nombre_Condicion VARCHAR(10) NOT NULL,
  CONSTRAINT PK_Condicion PRIMARY KEY (id_Condicion)
);

CREATE TABLE Estado_Pago
(
  id_EstadoPago INT IDENTITY(1,1) NOT NULL,
  nombre_EstadoPago VARCHAR(20) NOT NULL,
  CONSTRAINT PK_EstadoPago PRIMARY KEY (id_EstadoPago)
);

CREATE TABLE Estado_Empleado
(
  id_EstadoEmpleado INT IDENTITY(1,1) NOT NULL,
  nombre_EstadoEmpleado VARCHAR(15) NOT NULL,
  CONSTRAINT PK_EstadoEmpleado PRIMARY KEY (id_EstadoEmpleado)
);

CREATE TABLE Estado_Cliente
(
  id_Estado_Cliente INT IDENTITY(1,1)  NOT NULL,
  nombre_EstadoCliente VARCHAR(10) NOT NULL,
  CONSTRAINT PK_EstadoCliente PRIMARY KEY (id_Estado_Cliente)
);

CREATE TABLE Estado_Factura
(
  id_EstadoFactura INT IDENTITY(1,1) NOT NULL,
  nombre_EstadoFactura VARCHAR(15) NOT NULL,
  CONSTRAINT PK_EstadoFactura PRIMARY KEY (id_EstadoFactura)
);

CREATE TABLE Provincia
(
  id_Provincia INT IDENTITY(1,1) NOT NULL,
  nombre_Provincia VARCHAR(50) NOT NULL,
  id_Pais INT NOT NULL,
  CONSTRAINT PK_Provincia PRIMARY KEY (id_Provincia),
  CONSTRAINT FK_Provincia_Pais FOREIGN KEY (id_Pais) REFERENCES Pais(id_Pais)
);

CREATE TABLE Factura
(
  num_Factura INT IDENTITY(1,1) NOT NULL,
  fecha_Factura DATE NOT NULL,
  total_Factura FLOAT NOT NULL,
  id_EstadoFactura INT NOT NULL,
  CONSTRAINT PK_Factura PRIMARY KEY (num_Factura),
  CONSTRAINT FK_Factura_EstadoFactura FOREIGN KEY (id_EstadoFactura) REFERENCES Estado_Factura(id_EstadoFactura)
);

CREATE TABLE Vehiculos
(
  id_Vehiculo INT IDENTITY(100,1) NOT NULL,
  marca_Vehiculo VARCHAR(20) NOT NULL,
  modelo_Vehiculo VARCHAR(20) NOT NULL,
  version_Vehiculo VARCHAR(20) NOT NULL,
  km_Vehiculo INT NOT NULL,
  anio_Vehiculo DATE NOT NULL,
  patente_Vehiculo VARCHAR(7) NULL,
  codigo_OKM INT NULL,
  precio_Vehiculo FLOAT NOT NULL,
  id_tipoVehiculo INT NOT NULL,
  id_Estado INT NOT NULL,
  id_Condicion INT NOT NULL,
  CONSTRAINT PK_Vehiculo PRIMARY KEY (id_Vehiculo),
  CONSTRAINT FK_Vehiculos_TipoVehiculo FOREIGN KEY (id_tipoVehiculo) REFERENCES Tipo_Vehiculo(id_tipoVehiculo),
  CONSTRAINT FK_Vehiculos_EstadoVehiculo FOREIGN KEY (id_Estado) REFERENCES Estado_Vehiculo(id_Estado),
  CONSTRAINT FK_Vehiculos_Condicion FOREIGN KEY (id_Condicion) REFERENCES Condicion(id_Condicion)
);

CREATE TABLE Pago
(
	id_pago INT IDENTITY(500,1) NOT NULL,
	descripcion_Pago VARCHAR(50) NULL,
	importe_Pago FLOAT NOT NULL,
	id_TipoPago INT NOT NULL,
	id_EstadoPago INT NOT NULL,
	num_Factura INT NOT NULL,
	CONSTRAINT PK_Pago PRIMARY KEY (id_pago),
	CONSTRAINT FK_Pago_TipoPago FOREIGN KEY (id_TipoPago) REFERENCES Tipo_Pago(id_TipoPago),
	CONSTRAINT FK_Pago_EstadoPago FOREIGN KEY (id_EstadoPago) REFERENCES Estado_Pago(id_EstadoPago),
	CONSTRAINT FK_Pago_Factura FOREIGN KEY (num_Factura) REFERENCES Factura(num_Factura)
);

CREATE TABLE Localidad
(
  id_Localidad INT IDENTITY(1,1) NOT NULL,
  nombre_Localidad VARCHAR(50) NOT NULL,
  id_Provincia INT NOT NULL,
  CONSTRAINT PK_Localidad PRIMARY KEY (id_Localidad),
  CONSTRAINT FK_Localidad_Provincia FOREIGN KEY (id_Provincia) REFERENCES Provincia(id_Provincia)
);

CREATE TABLE Empleado
(
  cuil_Empleado VARCHAR(11) NOT NULL,
  dni_Empleado VARCHAR(8) NOT NULL,
  nombre_Empleado VARCHAR(50) NOT NULL,
  apellido_Empleado VARCHAR(60) NOT NULL,  
  email_Empleado VARCHAR(100) NOT NULL,
  celular_Empleado VARCHAR(20) NOT NULL,
  fechaNac_Empleado DATE NOT NULL,
  calle_Empleado VARCHAR(80) NOT NULL,
  num_Calle_Empleado INT NOT NULL,
  piso_Empleado INT NULL,
  dpto_Empleado VARCHAR(2) NULL,
  codigo_PostalEmpleado INT NOT NULL,
  id_Localidad INT NOT NULL,
  id_perfil INT NOT NULL,
  id_Estado INT NOT NULL,
  CONSTRAINT PK_Empleado PRIMARY KEY (cuil_Empleado),
  CONSTRAINT FK_Empleado_Localidad FOREIGN KEY (id_Localidad) REFERENCES Localidad(id_Localidad),
  CONSTRAINT FK_Empleado_PerfilEmpleado FOREIGN KEY (id_perfil) REFERENCES Perfil_Empleado(id_perfil),
  CONSTRAINT FK_Empleado_EstadoEmpleado FOREIGN KEY (id_Estado) REFERENCES Estado_Empleado(id_EstadoEmpleado),
  CONSTRAINT UQ_Empleado_DniEmpleado UNIQUE (dni_Empleado),
  CONSTRAINT UQ_Empleado_CuilEmpleado UNIQUE (cuil_Empleado),
  CONSTRAINT UQ_Empleado_EmailEmpleado UNIQUE (email_Empleado),
  CONSTRAINT CK_Empleado_DniEmpleado CHECK (dni_Empleado LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  CONSTRAINT CK_Empleado_CuilEmpleado CHECK (cuil_Empleado LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

CREATE TABLE Usuario
(
  id_Usuario INT IDENTITY(1,1) NOT NULL,
  cuil_Empleado VARCHAR(11) NOT NULL,
  password_Usuario VARCHAR(150) NOT NULL,
  CONSTRAINT PK_Usuario PRIMARY KEY (id_Usuario),
  CONSTRAINT FK_Usuario_Empleado FOREIGN KEY (cuil_Empleado) REFERENCES Empleado(cuil_Empleado),
  CONSTRAINT UQ_Usuario_Empleado UNIQUE (cuil_Empleado) 
);

CREATE TABLE Cliente
(
  id_Cliente INT IDENTITY(1,1)NOT NULL,
  email_Cliente VARCHAR(100) NOT NULL,
  celular_Cliente VARCHAR(20) NOT NULL,
  calle_Cliente VARCHAR(100) NOT NULL,
  num_Calle INT NOT NULL,
  piso_Cliente INT NOT NULL,
  dpto_Cliente VARCHAR(2) NOT NULL,
  codigo_PostalCliente INT NOT NULL,
  id_Estado_Cliente INT NOT NULL,
  id_Localidad INT NOT NULL,
  CONSTRAINT PK_Cliente PRIMARY KEY (id_Cliente),
  CONSTRAINT FK_Cliente_EstadoCliente FOREIGN KEY (id_Estado_Cliente) REFERENCES Estado_Cliente(id_Estado_Cliente),
  CONSTRAINT FK_Cliente_Localidad FOREIGN KEY (id_Localidad) REFERENCES Localidad(id_Localidad),
  CONSTRAINT UQ_Cliente_email UNIQUE (email_Cliente)
);

CREATE TABLE Cliente_Final
(
  id_ClienteFinal INT IDENTITY(1,1) NOT NULL,
  nombre_CFinal VARCHAR(50) NOT NULL,
  apellido_CFinal VARCHAR(50) NOT NULL,
  dni_CFinal VARCHAR(8) NOT NULL,
  cuil_CFinal VARCHAR(11) NOT NULL,
  fechaNac_CFinal DATE NOT NULL,
  id_Cliente INT NOT NULL,
  CONSTRAINT PK_ClienteFinal PRIMARY KEY (id_ClienteFinal),
  CONSTRAINT FK_ClienteFinal_Cliente FOREIGN KEY (id_Cliente) REFERENCES Cliente(id_Cliente),
  CONSTRAINT UQ_ClienteFinal_Dni UNIQUE (dni_CFinal),
  CONSTRAINT UQ_ClienteFinal_Cuil UNIQUE (cuil_CFinal),
  CONSTRAINT CK_ClienteFinal_Dni CHECK (dni_CFinal LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  CONSTRAINT CK_ClienteFinal_Cuil CHECK (cuil_CFinal LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

ALTER TABLE Cliente_Final
	ADD CONSTRAINT DF_ClienteFinal_FechaNac DEFAULT GETDATE() FOR fechaNac_CFinal

CREATE TABLE Cliente_Empresa
(
  id_CEmpresa INT IDENTITY(1,1) NOT NULL,
  cuit_CEmpresa VARCHAR(11) NOT NULL,
  razon_Social_CEmpresa VARCHAR(50) NOT NULL,
  id_Cliente INT NOT NULL,
  CONSTRAINT PK_ClienteEmpresa PRIMARY KEY (id_CEmpresa),
  CONSTRAINT FK_ClienteEmpresa_Cliente FOREIGN KEY (id_Cliente) REFERENCES Cliente(id_Cliente),
  CONSTRAINT UQ_ClienteEmpresa_Cuit UNIQUE (cuit_CEmpresa),
  CONSTRAINT CK_ClienteEmpresa_Cuit CHECK (cuit_CEmpresa LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

);

CREATE TABLE Pedido
(
  id_Pedido INT  IDENTITY(8000,1) NOT NULL,
  cuil_Empleado VARCHAR(11) NOT NULL,
  num_Factura INT NOT NULL,
  id_Cliente INT NOT NULL,
  CONSTRAINT PK_Pedido PRIMARY KEY (id_Pedido),
  CONSTRAINT FK_Pedido_Empleado FOREIGN KEY (cuil_Empleado) REFERENCES Empleado(cuil_Empleado),
  CONSTRAINT FK_Pedido_Factura FOREIGN KEY (num_Factura) REFERENCES Factura(num_Factura),
  CONSTRAINT FK_Pedido_Cliente FOREIGN KEY (id_Cliente) REFERENCES Cliente(id_Cliente)
);

CREATE TABLE Detalle_Pedido
(
  id_Vehiculo INT NOT NULL,
  id_Pedido INT NOT NULL,
  subtotal_DetallePedido FLOAT NOT NULL,
  CONSTRAINT PK_DetallePedido PRIMARY KEY (id_Vehiculo, id_Pedido),
  CONSTRAINT FK_DetallePedido_Vehiculos FOREIGN KEY (id_Vehiculo) REFERENCES Vehiculos(id_Vehiculo),
  CONSTRAINT FK_DetallePedido_Pedido FOREIGN KEY (id_Pedido) REFERENCES Pedido(id_Pedido)
);
