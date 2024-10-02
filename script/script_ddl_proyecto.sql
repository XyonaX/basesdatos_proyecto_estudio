-- SCRIPT TEMA “Procedimientos y funciones almacenadas”
-- DEFINNICIÓN DEL MODELO DE DATOS

CREATE DATABASE StoredOps;
USE StoredOps;

CREATE TABLE Pais
(
  id_Pais INT NOT NULL,
  nombre_Pais VARCHAR(50) NOT NULL,
  CONSTRAINT PK_Pais PRIMARY KEY (id_Pais)
);

CREATE TABLE Tipo_Vehiculo
(
  id_tipoVehiculo INT NOT NULL,
  nombre_tipoVehiculo VARCHAR(15) NOT NULL,
  CONSTRAINT PK_TipoVehiculo PRIMARY KEY (id_tipoVehiculo)
);

CREATE TABLE Estado_Vehiculo
(
  id_Estado INT NOT NULL,
  nombre_Estado VARCHAR(10) NOT NULL,
  CONSTRAINT PK_Estado PRIMARY KEY (id_Estado)
);

CREATE TABLE Tipo_Pago
(
  id_TipoPago INT NOT NULL,
  nombre_tipoPago VARCHAR(20) NOT NULL,
  CONSTRAINT PK_TipoPago PRIMARY KEY (id_TipoPago)
);

CREATE TABLE Perfil_Empleado
(
  id_perfil INT NOT NULL,
  nombre_Perfil VARCHAR(20) NOT NULL,
  CONSTRAINT PK_Perfil PRIMARY KEY (id_perfil)
);

CREATE TABLE Condicion
(
  id_Condicion INT NOT NULL,
  nombre_Condicion VARCHAR(10) NOT NULL,
  CONSTRAINT PK_Condicion PRIMARY KEY (id_Condicion)
);

CREATE TABLE Estado_Pago
(
  id_EstadoPago INT NOT NULL,
  nombre_EstadoPago VARCHAR(20) NOT NULL,
  CONSTRAINT PK_EstadoPago PRIMARY KEY (id_EstadoPago)
);

CREATE TABLE Estado_Empleado
(
  id_EstadoEmpleado INT NOT NULL,
  nombre_EstadoEmpleado VARCHAR(15) NOT NULL,
  CONSTRAINT PK_EstadoEmpleado PRIMARY KEY (id_EstadoEmpleado)
);

CREATE TABLE Estado_Cliente
(
  id_Estado_Cliente INT NOT NULL,
  nombre_EstadoCliente VARCHAR(10) NOT NULL,
  CONSTRAINT PK_EstadoCliente PRIMARY KEY (id_Estado_Cliente)
);

CREATE TABLE Estado_Factura
(
  id_EstadoFactura INT NOT NULL,
  nombre_EstadoFactura VARCHAR NOT NULL,
  CONSTRAINT PK_EstadoFactura PRIMARY KEY (id_EstadoFactura)
);

CREATE TABLE Provincia
(
  id_Provincia INT NOT NULL,
  nombre_Provincia VARCHAR(50) NOT NULL,
  id_Pais INT NOT NULL,
  CONSTRAINT PK_Provincia PRIMARY KEY (id_Provincia),
  CONSTRAINT FK_Provincia_Pais FOREIGN KEY (id_Pais) REFERENCES Pais(id_Pais)
);

