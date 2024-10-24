-- SCRIPT TEMA “Procedimientos y funciones almacenadas”
-- DEFINNICIÓN DEL MODELO DE DATOS

CREATE DATABASE StoredOps;
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
  CONSTRAINT FK_Vehiculos_Condicion FOREIGN KEY (id_Condicion) REFERENCES Condicion(id_Condicion),
  CONSTRAINT UQ_Vehiculos_PatenteVehiculo UNIQUE (patente_Vehiculo),
  CONSTRAINT UQ_Vehiculos_codigo0km UNIQUE (codigo_OKM)
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
