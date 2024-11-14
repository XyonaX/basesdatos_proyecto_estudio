-- SCRIPT "StoredOps"
-- INSERCIÓN DEL LOTE DE DATOS

USE StoredOps
---------------------
--- LOTE DE DATOS ---
---------------------
--Paises
SET LANGUAGE Español
INSERT INTO Pais(nombre_Pais) 
VALUES 
	('Argentina'),
	('Brasil'),
	('Paraguay'),
	('Uruguay');

-- Provincias Argentina
INSERT INTO Provincia (nombre_Provincia, id_Pais) 
VALUES 
	('Buenos Aires', 1),  
	('Catamarca', 1),
	('Chaco', 1),
	('Chubut', 1),
	('Córdoba', 1),
	('Corrientes', 1),
	('Entre Ríos', 1),
	('Formosa', 1),
	('Jujuy', 1),
	('La Pampa', 1), 
	('La Rioja', 1),
	('Mendoza', 1),
	('Misiones', 1),
	('Neuquén', 1),
	('Río Negro', 1),
	('Salta', 1),
	('San Juan', 1),
	('San Luis', 1),
	('Santa Cruz', 1),
	('Santa Fe', 1),
	('Santiago del Estero', 1),
	('Tierra del Fuego', 1),
	('Tucumán', 1);

--Provincias Brasil	
INSERT INTO Provincia (nombre_Provincia, id_Pais)
VALUES 
	('São Paulo', 2),
	('Rio de Janeiro', 2),
	('Minas Gerais', 2),
	('Bahia', 2);

--Provincias Paraguay
INSERT INTO Provincia (nombre_Provincia, id_Pais)
VALUES 
	('Asunción', 3),
    	('Central', 3),
	('Alto Paraná', 3),
    	('Itapúa', 3);

--Provincias Uruguay
INSERT INTO Provincia (nombre_Provincia, id_Pais)
VALUES
	('Montevideo', 4),
	('Canelones', 4),
	('Maldonado', 4),
	('Salto', 4);

-- Localidades de Corrientes
INSERT INTO Localidad (nombre_Localidad, id_Provincia) 
VALUES 
	('Bella Vista', 6),
	('Corrientes', 6),
	('Curuzú Cuatiá', 6),
	('Empedrado', 6),
	('Esquina', 6),
	('Goya', 6),
	('Itatí', 6),
	('Ituzaingó', 6),
	('Mercedes', 6),
	('Mocoretá', 6),
	('Monte Caseros', 6),
	('Paso de los Libres', 6),
	('Saladas', 6),
	('San Cosme', 6), 
	('San Lorenzo', 6),
	('San Luis del Palmar', 6),
	('San Roque', 6),
	('Santa Lucía', 6),
	('Santa Rosa', 6),
	('Santo Tomé', 6),
	('Virasoro', 6);

-- Localidades de Chaco
INSERT INTO Localidad (nombre_Localidad, id_Provincia) 
VALUES 
	('Avia Terai', 3),
	('Barranqueras', 3),
	('Basail', 3),
	('Campo Largo', 3),
	('Charata', 3),
	('Colonia Baranda', 3),
	('Colonia Benítez', 3),
	('Colonia Elisa', 3),
	('Colonia Popular', 3),
	('Concepción del Bermejo', 3),
	('Corzuela', 3),
	('Cote Lai', 3),
	('El Sauzalito', 3),
	('Fontana', 3),
	('Fuerte Esperanza', 3),
	('General Capdevila', 3),
	('General José de San Martín', 3),
	('General Pinedo', 3),
	('General Vedia', 3),
	('Hermoso Campo', 3),
	('Ingeniero Barbet', 3),
	('Isla del Cerrito', 3),
	('Juan José Castelli', 3),
	('La Clotilde', 3),
	('La Eduvigis', 3),
	('La Escondida', 3),
	('La Leonesa', 3),
	('La Tigra', 3),
	('La Verde', 3),
	('Laguna Blanca', 3),
	('Laguna Limpia', 3),
	('Lapachito', 3),
	('Las Breñas', 3),
	('Las Garcitas', 3),
	('Las Palmas', 3),
	('Los Frentones', 3),
	('Machagai', 3),
	('Makallé', 3),
	('Margarita Belén', 3),
	('Miraflores', 3),
	('Napenay', 3),
	('Pampa Almirón', 3),
	('Pampa del Indio', 3),
	('Pampa del Infierno', 3),
	('Presidencia Roca', 3),
	('Presidencia Roque Sáenz Peña', 3),
	('Puerto Bermejo', 3),
	('Puerto Tirol', 3),
	('Puerto Vilelas', 3),
	('Quitilipi', 3),
	('Resistencia', 3),
	('Samuhú', 3),
	('San Bernardo', 3),
	('Santa Sylvina', 3),
	('Taco Pozo', 3),
	('Tres Isletas', 3),
	('Villa Ángela', 3),
	('Villa Berthet', 3),
	('Villa El Palmar', 3),
	('Villa Río Bermejito', 3);

-- Localidades de Formosa
INSERT INTO Localidad (nombre_Localidad, id_Provincia) 
VALUES 
	('Buena Vista', 8),
	('Clorinda', 8),
	('Colonia Pastoril', 8),
	('Comandante Fontana', 8),
	('El Colorado', 8),
	('El Espinillo', 8),
	('Estanislao del Campo', 8),
	('Fortín Lugones', 8),
	('General Belgrano', 8),
	('Gran Guardia', 8),
	('Herradura', 8),
	('Ibarreta', 8),
	('Ingeniero Juárez', 8),
	('Laguna Blanca', 8),
	('Laguna Naick Neck', 8),
	('Laguna Yema', 8),
	('Las Lomitas', 8),
	('Los Chiriguanos', 8),
	('Misión Laishí', 8),
	('Palo Santo', 8),
	('Pirané', 8),
	('Posta Cambio Zalazar', 8),
	('Riacho He Hé', 8),
	('San Francisco de Laishí', 8),
	('Siete Palmas', 8),
	('Subteniente Perín', 8),
	('Tres Lagunas', 8),
	('Villa Dos Trece', 8),
	('Villa Escolar', 8),
	('Villa General Güemes', 8),
	('Formosa', 8);

-- Localidades de Misiones 
INSERT INTO Localidad (nombre_Localidad, id_Provincia) 
VALUES 
    ('Apóstoles', 13),
    ('Aristóbulo del Valle', 13),
    ('Azara', 13),
    ('Bernardo de Irigoyen', 13),
    ('Candelaria', 13),
    ('Campo Grande', 13),
    ('Campo Ramón', 13),
    ('Campo Viera', 13),
    ('Capioví', 13),
    ('Cerro Azul', 13),
    ('Cerro Corá', 13),
    ('Colonia Alberdi', 13),
    ('Colonia Aurora', 13),
    ('Colonia Delicia', 13),
    ('Colonia Victoria', 13),
    ('Dos Arroyos', 13),
    ('Dos de Mayo', 13),
    ('Eldorado', 13),
    ('El Soberbio', 13),
    ('Fachinal', 13),
    ('Garuhapé', 13),
    ('Garupá', 13),
    ('Gobernador López', 13),
    ('Gobernador Roca', 13),
    ('Guaraní', 13),
    ('Itacaruaré', 13),
    ('Jardín América', 13),
    ('Leandro N. Alem', 13),
    ('Loreto', 13),
    ('Los Helechos', 13),
    ('Montecarlo', 13),
    ('Oberá', 13),
    ('Posadas', 13),
    ('Profundidad', 13),
    ('Puerto Esperanza', 13),
    ('Puerto Iguazú', 13),
    ('Puerto Leoni', 13),
    ('Puerto Libertad', 13),
    ('Puerto Piray', 13),
    ('Puerto Rico', 13),
    ('Ruiz de Montoya', 13),
    ('San Antonio', 13),
    ('San Ignacio', 13),
    ('San Javier', 13),
    ('San José', 13),
    ('San Martín', 13),
    ('San Pedro', 13),
    ('Santo Pipó', 13),
    ('Santa Ana', 13),
    ('Santa Rita', 13),
    ('Santiago de Liniers', 13),
    ('Tres Capones', 13),
    ('Wanda', 13);


-- Tipos de Vehículo
INSERT INTO Tipo_Vehiculo (nombre_tipoVehiculo) VALUES ('Sedan'), ('SUV'), ('Camioneta'), ('Hatchback'), ('Coupe');

-- Vehículos
INSERT INTO Vehiculos (marca_Vehiculo, modelo_Vehiculo, version_Vehiculo, km_Vehiculo, anio_Vehiculo, patente_Vehiculo, codigo_OKM, precio_Vehiculo, id_tipoVehiculo, ruta_imagen) 
VALUES 
    ('Toyota', 'Corolla', 'SE', 15000, '2021-01-01', 'ABC123', NULL, 25000, 1, '/images/toyota_corolla.png'),
    ('Ford', 'Ecosport', 'Titanium', 30000, '2020-06-01', 'DEF456', NULL, 28000, 2, '/images/ford_ecosport.png'),
    ('Chevrolet', 'S10', 'High Country', 40000, '2019-03-01', 'GHI789', NULL, 32000, 3, '/images/chevrolet_s10.png'),
    ('Volkswagen', 'Golf', 'Comfortline', 20000, '2022-05-01', 'JKL012', NULL, 27000, 4, '/images/vw_golf.png'),
    ('Honda', 'Civic', 'EX', 10000, '2021-09-01', 'MNO345', NULL, 24000, 1, '/images/honda_civic.png');

-- Perfil del empleado
INSERT INTO Perfil_Empleado (nombre_Perfil) 
VALUES 
    ('Administrador'),
    ('Cajero'),
    ('Vendedor');

-- Insertar un Empleado 
INSERT INTO Empleado (cuil_Empleado, dni_Empleado, nombre_Empleado, apellido_Empleado, email_Empleado, celular_Empleado, fechaNac_Empleado, calle_Empleado, num_Calle_Empleado, codigo_PostalEmpleado, id_Localidad, id_perfil) 
VALUES ('20304050607', '12345678', 'Juan', 'Pérez', 'juan.perez@empresa.com', '123456789', '1980-01-01', 'Av. Siempreviva', 742, 5000, 1, 1);

-- Insertar un cliente
INSERT INTO Cliente (nombre_Cliente, apellido_Cliente, dni_Cliente, cuil_Cliente, fechaNac_Cliente, email_Cliente, celular_Cliente, calle_Cliente, num_Calle, piso_Cliente, dpto_Cliente, codigo_PostalCliente, id_Localidad) 
VALUES ('Carlos', 'Gomez', '87654321', '20987654321', '1985-05-05', 'carlos.gomez@cliente.com', '987654321', 'Calle Falsa', 123, 1, 'A', 5001, 2);

--Pedidos
INSERT INTO Pedido (cuil_Empleado, id_Cliente, id_Vehiculo, fecha_Pedido, monto_Pedido, id_EstadoPedido) 
VALUES 
    ('20304050607', 1, 100, '2023-01-01', 25500, 1),
    ('20304050607', 1, 101, '2023-01-05', 28000, 1),
    ('20304050607', 1, 102, '2023-01-10', 32500, 1),
    ('20304050607', 1, 103, '2023-02-01', 27500, 1),
    ('20304050607', 1, 104, '2023-02-10', 24500, 1);

-- Tipos de Pago
INSERT INTO Tipo_Pago (nombre_tipoPago) VALUES ('Contado'), ('Tarjeta de Crédito'), ('Transferencia Bancaria');

--Estados de Pago
INSERT INTO Estado_Pago (nombre_EstadoPago) VALUES ('Pendiente'), ('Pagado'), ('Cancelado');

-- Empleados
INSERT INTO Empleado (cuil_Empleado, dni_Empleado, nombre_Empleado, apellido_Empleado, email_Empleado, celular_Empleado, fechaNac_Empleado, calle_Empleado, num_Calle_Empleado, piso_Empleado, dpto_Empleado, codigo_PostalEmpleado, id_Localidad, id_perfil) 
VALUES 
('20123456780', '12345578', 'María', 'Gómez', 'maria.gomez@empresa.com', '1234567890', '1985-04-25', 'Av. Siempre Viva', 123, NULL, NULL, 4000, 1, 1),
('20234567891', '23456789', 'Juan', 'Pérez', 'juan.perez1@empresa.com', '0987654321', '1980-06-15', 'Calle Falsa', 456, 2, 'B', 5000, 2, 2),
('20345678912', '34567891', 'Lucía', 'Ramírez', 'lucia.ramirez@empresa.com', '1122334455', '1992-03-10', 'Pje. del Sol', 789, 3, 'A', 3000, 3, 3),
('20456789023', '45678912', 'Carlos', 'Martínez', 'carlos.martinez@empresa.com', '2233445566', '1988-11-05', 'Av. del Libertador', 120, NULL, NULL, 6000, 4, 1),
('20567890134', '56789123', 'Ana', 'López', 'ana.lopez@empresa.com', '3344556677', '1975-12-20', 'Boulevard 23', 500, NULL, NULL, 7000, 5, 2);

-- Pedidos
INSERT INTO Pedido (cuil_Empleado, id_Cliente, id_Vehiculo, fecha_Pedido, monto_Pedido, id_EstadoPedido) 
VALUES 
('20123456780', 1, 100, GETDATE(), 22000.00, 1),
('20234567891', 1, 101, GETDATE(), 18000.00, 2),
('20345678912', 1, 102, GETDATE(), 25000.00, 3),
('20456789023', 1, 103, GETDATE(), 17000.00, 4),
('20567890134', 1, 104, GETDATE(), 30000.00, 1);

-- Pagos
INSERT INTO Pago (descripcion_Pago, importe_Pago, id_TipoPago, id_EstadoPago, id_Pedido) 
VALUES 
('Pago en efectivo', 18000.00, 2, 2, 8001),
('Pago financiado', 25000.00, 1, 3, 8002),
('Pago inicial', 17000.00, 2, 3, 8003),
('Pago completo', 30000.00, 1, 1, 8004),
('Pago inicial', 22000.00, 1, 1, 8005);

-- Facturas
INSERT INTO Factura (fecha_Factura, total_Factura, id_pago) 
VALUES 
(GETDATE(), 11000.00, 1),
(GETDATE(), 18000.00, 2),
(GETDATE(), 25000.00, 3),
(GETDATE(), 17000.00, 4),
(GETDATE(), 30000.00, 5);


