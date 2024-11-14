-- SCRIPT "StoredOps"
-- INSERCIÓN DEL LOTE DE DATOS

USE StoredOps

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

-- Provincias
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

INSERT INTO Provincia (nombre_Provincia, id_Pais)
VALUES 
	('São Paulo', 2),
	('Rio de Janeiro', 2),
	('Minas Gerais', 2),
	('Bahia', 2);

INSERT INTO Provincia (nombre_Provincia, id_Pais)
VALUES 
	('Asunción', 3),
    	('Central', 3),
	('Alto Paraná', 3),
    	('Itapúa', 3);

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

