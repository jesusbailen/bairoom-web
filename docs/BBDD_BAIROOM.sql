
--  PROYECTO INTERMODULAR II - JESÚS BAILÉN
--  Implementación de la base de datos + Datos de prueba
--  Bairoom (Sistema de gestión de reservas)


-- Crear base de datos
CREATE DATABASE IF NOT EXISTS bairoom_pi2
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE bairoom_pi2;

-- TABLA ROL
CREATE TABLE rol (
  id_rol INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

-- TABLA USUARIO

CREATE TABLE usuario (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  apellidos VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  contraseña VARCHAR(255) NOT NULL,
  telefono VARCHAR(20),
  fecha_alta DATE NOT NULL,
  estado ENUM('activo','inactivo') DEFAULT 'activo',
  id_rol INT NOT NULL,
  CONSTRAINT fk_usuario_rol
    FOREIGN KEY (id_rol) REFERENCES rol(id_rol)
      ON UPDATE CASCADE
      ON DELETE RESTRICT
) ENGINE=InnoDB;

-- TABLA PROPIEDAD

CREATE TABLE propiedad (
  id_propiedad INT AUTO_INCREMENT PRIMARY  KEY,
  nombre VARCHAR(100) NOT NULL,
  direccion VARCHAR(150) NOT NULL,
  ciudad VARCHAR(80) NOT NULL,
  cp VARCHAR(10),
  descripcion TEXT,
  capacidad_total INT NOT NULL,
  id_propietario INT NOT NULL,
  CONSTRAINT fk_propiedad_propietario
    FOREIGN KEY (id_propietario) REFERENCES usuario(id_usuario)
      ON UPDATE CASCADE
      ON DELETE RESTRICT
) ENGINE=InnoDB;


-- TABLA HABITACION

CREATE TABLE habitacion (
  id_habitacion INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL,
  m2 DECIMAL(5,2),
  capacidad INT NOT NULL,
  precio_mensual DECIMAL(8,2) NOT NULL,
  estado ENUM('disponible','ocupada','mantenimiento') DEFAULT 'disponible',
  id_propiedad INT NOT NULL,
  CONSTRAINT fk_habitacion_propiedad
    FOREIGN KEY (id_propiedad) REFERENCES propiedad(id_propiedad)
      ON UPDATE CASCADE
      ON DELETE RESTRICT
) ENGINE=InnoDB;


-- TABLA RESERVA

CREATE TABLE reserva (
  id_reserva INT AUTO_INCREMENT PRIMARY KEY,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NOT NULL,
  estado ENUM('pendiente','aceptada','rechazada','cancelada') DEFAULT 'pendiente',
  num_personas INT DEFAULT 1,
  motivo VARCHAR(255),
  observaciones TEXT,
  id_usuario INT NOT NULL,
  id_habitacion INT NOT NULL,
  CONSTRAINT fk_reserva_usuario
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
      ON UPDATE CASCADE
      ON DELETE RESTRICT,
  CONSTRAINT fk_reserva_habitacion
    FOREIGN KEY (id_habitacion) REFERENCES habitacion(id_habitacion)
      ON UPDATE CASCADE
      ON DELETE RESTRICT
) ENGINE=InnoDB;


--   DATOS DE PRUEBA


-- ROL
INSERT INTO rol (id_rol, nombre) VALUES
(1, 'Administrador'),
(2, 'Propietario'),
(3, 'Inquilino');

-- USUARIOS (10 usuarios)
INSERT INTO usuario (id_usuario, nombre, apellidos, email, contraseña, telefono, fecha_alta, estado, id_rol) VALUES
(1, 'Jesús', 'Bailén Sánchez', 'admin@bairoom.com', 'hash1', '600000001', '2025-01-01', 'activo', 1),
(2, 'Laura', 'García Pérez', 'laura@bairoom.com', 'hash2', '600000002', '2025-01-05', 'activo', 2),
(3, 'Carlos', 'López Martín', 'carlos@bairoom.com', 'hash3', '600000003', '2025-01-05', 'activo', 2),
(4, 'Marta', 'Ruiz Torres', 'marta@bairoom.com', 'hash4', '600000004', '2025-01-10', 'activo', 2),
(5, 'Ana', 'Serrano Díaz', 'ana@bairoom.com', 'hash5', '600000005', '2025-02-01', 'activo', 3),
(6, 'Pablo', 'Hernández Gil', 'pablo@bairoom.com', 'hash6', '600000006', '2025-02-03', 'activo', 3),
(7, 'Sergio', 'Morales Cano', 'sergio@bairoom.com', 'hash7', '600000007', '2025-02-07', 'activo', 3),
(8, 'Lucía', 'Navarro Ortiz', 'lucia@bairoom.com', 'hash8', '600000008', '2025-02-10', 'activo', 3),
(9, 'David', 'Crespo Vidal', 'david@bairoom.com', 'hash9', '600000009', '2025-02-12', 'activo', 3),
(10, 'Elena', 'Martí Gómez', 'elena@bairoom.com', 'hash10','600000010','2025-02-15', 'activo', 3);

-- PROPIEDADES (5 propiedades)
INSERT INTO propiedad (id_propiedad, nombre, direccion, ciudad, cp, descripcion, capacidad_total, id_propietario) VALUES
(1, 'Piso Centro Elche', 'C/ Mayor 10, 3ºA', 'Elche', '03201', 'Piso luminoso cerca del centro', 3, 2),
(2, 'Ático Playa Santa Pola', 'Av. Mar 25, 5ºB', 'Santa Pola', '03130', 'Ático con terraza y vistas al mar', 2, 2),
(3, 'Piso Universidad Elche', 'C/ Campus 5, 2ºC', 'Elche', '03202', 'Piso compartido para estudiantes', 4, 3),
(4, 'Habitaciones San Juan', 'C/ Sol 8, 1ºD', 'San Juan', '03550', 'Vivienda para trabajadores sanitarios', 3, 4),
(5, 'Loft Alicante Centro', 'C/ Teatro 3, 4ºA', 'Alicante', '03001', 'Loft moderno de una habitación', 1, 3);

-- HABITACIONES (10 habitaciones)
INSERT INTO habitacion (id_habitacion, nombre, m2, capacidad, precio_mensual, estado, id_propiedad) VALUES
(1, 'Hab 1 - Centro Elche', 12.00, 1, 350.00, 'disponible', 1),
(2, 'Hab 2 - Centro Elche', 14.50, 1, 370.00, 'disponible', 1),
(3, 'Hab 3 - Centro Elche', 10.00, 1, 320.00, 'ocupada', 1),
(4, 'Hab 1 - Ático Santa Pola', 15.00, 1, 450.00, 'disponible', 2),
(5, 'Hab 2 - Ático Santa Pola', 18.00, 1, 480.00, 'ocupada', 2),
(6, 'Hab 1 - Univ Elche', 11.00, 1, 300.00, 'disponible', 3),
(7, 'Hab 2 - Univ Elche', 11.50, 1, 300.00, 'disponible', 3),
(8, 'Hab 3 - Univ Elche', 9.50, 1, 280.00, 'ocupada', 3),
(9, 'Hab 1 - San Juan', 13.00, 1, 360.00, 'disponible', 4),
(10, 'Hab 2 - San Juan', 13.50, 1, 360.00, 'mantenimiento', 4);

-- RESERVAS (10 reservas)
INSERT INTO reserva (id_reserva, fecha_inicio, fecha_fin, estado, num_personas, motivo, observaciones, id_usuario, id_habitacion) VALUES
(1, '2025-03-01', '2025-06-30', 'aceptada', 1, 'Trabajo en Elche', 'Llega con coche propio', 5, 1),
(2, '2025-02-15', '2025-05-15', 'aceptada', 1, 'Prácticas en empresa', NULL, 6, 3),
(3, '2025-04-01', '2025-07-01', 'pendiente', 1, 'Temporada de verano', 'Pendiente de confirmar fechas exactas', 7, 4),
(4, '2025-03-10', '2025-06-10', 'rechazada', 1, 'Curso intensivo', 'Rechazada por solape con otra reserva', 8, 6),
(5, '2025-05-01', '2025-08-31', 'aceptada', 1, 'Estudios universitarios', NULL, 9, 7),
(6, '2025-03-05', '2025-04-05', 'cancelada', 1, 'Trabajo temporal', 'Cancelada por el usuario', 10, 2),
(7, '2025-09-01', '2025-12-31', 'pendiente', 1, 'Máster en Elche', NULL, 5, 8),
(8, '2025-06-01', '2025-09-30', 'pendiente', 1, 'Verano en la costa', NULL, 6, 5),
(9, '2025-02-01', '2025-04-30', 'aceptada', 1, 'Contrato hospital', NULL, 7, 9),
(10, '2025-01-15', '2025-03-15', 'aceptada', 1, 'Sustitución sanitaria', 'Habitación en mantenimiento después', 8, 10);
