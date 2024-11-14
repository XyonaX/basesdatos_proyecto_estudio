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

CREATE TABLE Tipo_Pago
(
  id_TipoPago INT IDENTITY(1,1) NOT NULL,
  nombre_tipoPago VARCHAR(50) NOT NULL,
  CONSTRAINT PK_TipoPago PRIMARY KEY (id_TipoPago)
);

CREATE TABLE Perfil_Empleado
(
  id_perfil INT IDENTITY(1,1) NOT NULL,
  nombre_Perfil VARCHAR(20) NOT NULL,
  CONSTRAINT PK_Perfil PRIMARY KEY (id_perfil)
);

CREATE TABLE Estado_Pago
(
  id_EstadoPago INT IDENTITY(1,1) NOT NULL,
  nombre_EstadoPago VARCHAR(20) NOT NULL,
  CONSTRAINT PK_EstadoPago PRIMARY KEY (id_EstadoPago)
);


CREATE TABLE Provincia
(
  id_Provincia INT IDENTITY(1,1) NOT NULL,
  nombre_Provincia VARCHAR(50) NOT NULL,
  id_Pais INT NOT NULL,
  CONSTRAINT PK_Provincia PRIMARY KEY (id_Provincia),
  CONSTRAINT FK_Provincia_Pais FOREIGN KEY (id_Pais) REFERENCES Pais(id_Pais)
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
  ruta_imagen VARCHAR(255) NULL,  
  CONSTRAINT PK_Vehiculo PRIMARY KEY (id_Vehiculo),
  CONSTRAINT FK_Vehiculos_TipoVehiculo FOREIGN KEY (id_tipoVehiculo) REFERENCES Tipo_Vehiculo(id_tipoVehiculo)
);

CREATE UNIQUE INDEX UQ_Vehiculos_Patente
ON Vehiculos(patente_Vehiculo)
WHERE patente_Vehiculo IS NOT NULL;

CREATE UNIQUE INDEX UQ_Vehiculos_CodigoOKM
ON Vehiculos(codigo_OKM)
WHERE codigo_OKM IS NOT NULL;

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
  CONSTRAINT PK_Empleado PRIMARY KEY (cuil_Empleado),
  CONSTRAINT FK_Empleado_Localidad FOREIGN KEY (id_Localidad) REFERENCES Localidad(id_Localidad),
  CONSTRAINT FK_Empleado_PerfilEmpleado FOREIGN KEY (id_perfil) REFERENCES Perfil_Empleado(id_perfil),
  CONSTRAINT UQ_Empleado_DniEmpleado UNIQUE (dni_Empleado),
  CONSTRAINT UQ_Empleado_CuilEmpleado UNIQUE (cuil_Empleado),
  CONSTRAINT UQ_Empleado_EmailEmpleado UNIQUE (email_Empleado),
  CONSTRAINT CK_Empleado_DniEmpleado CHECK (dni_Empleado LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  CONSTRAINT CK_Empleado_CuilEmpleado CHECK (cuil_Empleado LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

CREATE TABLE Cliente
(
  id_Cliente INT IDENTITY(1,1) NOT NULL,
  nombre_Cliente VARCHAR(50) NOT NULL,
  apellido_Cliente VARCHAR(50) NOT NULL,
  dni_Cliente VARCHAR(8) NOT NULL,
  cuil_Cliente VARCHAR(11) NOT NULL,
  fechaNac_Cliente DATE NOT NULL,
  email_Cliente VARCHAR(100) NOT NULL,
  celular_Cliente VARCHAR(20) NOT NULL,
  calle_Cliente VARCHAR(100) NOT NULL,
  num_Calle INT NOT NULL,
  piso_Cliente INT NOT NULL,
  dpto_Cliente VARCHAR(2) NOT NULL,
  codigo_PostalCliente INT NOT NULL,
  id_Localidad INT NOT NULL,
  CONSTRAINT PK_Cliente PRIMARY KEY (id_Cliente),
  CONSTRAINT UQ_Cliente_Dni UNIQUE (dni_Cliente),
  CONSTRAINT UQ_Cliente_Cuil UNIQUE (cuil_Cliente),
  CONSTRAINT CK_Cliente_Dni CHECK (dni_Cliente LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  CONSTRAINT CK_Cliente_Cuil CHECK (cuil_Cliente LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  CONSTRAINT FK_Cliente_Localidad FOREIGN KEY (id_Localidad) REFERENCES Localidad(id_Localidad),
  CONSTRAINT UQ_Cliente_email UNIQUE (email_Cliente)
);

CREATE TABLE Pedido
(
  id_Pedido INT IDENTITY(8000,1) NOT NULL,
  cuil_Empleado VARCHAR(11) NOT NULL,
  id_Cliente INT NOT NULL,
  id_Vehiculo INT NOT NULL,
  fecha_Pedido DATETIME NOT NULL,
  monto_Pedido FLOAT NOT NULL,
  id_EstadoPedido INT NOT NULL,
  CONSTRAINT PK_Pedido PRIMARY KEY (id_Pedido),
  CONSTRAINT FK_Pedido_Empleado FOREIGN KEY (cuil_Empleado) REFERENCES Empleado(cuil_Empleado),
  CONSTRAINT FK_Pedido_Cliente FOREIGN KEY (id_Cliente) REFERENCES Cliente(id_Cliente),
  CONSTRAINT FK_Pedido_Vehiculo FOREIGN KEY (id_Vehiculo) REFERENCES Vehiculos(id_Vehiculo),
);

ALTER TABLE Pedido
ADD CONSTRAINT DF_Pedido_Fecha DEFAULT GETDATE() FOR fecha_Pedido;

CREATE TABLE Pago
(
  id_pago INT IDENTITY(500,1) NOT NULL,
  descripcion_Pago VARCHAR(50) NULL,
  importe_Pago FLOAT NOT NULL,
  id_TipoPago INT NOT NULL,
  id_EstadoPago INT NOT NULL,
  id_Pedido INT NOT NULL, 
  CONSTRAINT PK_Pago PRIMARY KEY (id_pago),
  CONSTRAINT FK_Pago_TipoPago FOREIGN KEY (id_TipoPago) REFERENCES Tipo_Pago(id_TipoPago),
  CONSTRAINT FK_Pago_EstadoPago FOREIGN KEY (id_EstadoPago) REFERENCES Estado_Pago(id_EstadoPago),
  CONSTRAINT FK_Pago_Pedido FOREIGN KEY (id_Pedido) REFERENCES Pedido(id_Pedido)
);

CREATE TABLE Factura
(
  num_Factura INT IDENTITY(1,1) NOT NULL,
  fecha_Factura DATE NOT NULL,
  total_Factura FLOAT NOT NULL,
  id_pago INT NOT NULL,
  CONSTRAINT PK_Factura PRIMARY KEY (num_Factura),
  CONSTRAINT FK_Factura_Pago FOREIGN KEY (id_pago) REFERENCES Pago(id_pago)
);
