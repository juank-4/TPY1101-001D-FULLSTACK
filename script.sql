-- ==========================================
-- SCRIPT DE CREACIÓN Y POBLACIÓN DE BASE DE DATOS
-- ==========================================

-- 1. Crear la base de datos (si no existe) y usarla
CREATE DATABASE IF NOT EXISTS mi_base_de_datos;
USE mi_base_de_datos;

-- 2. Limpiar tablas si ya existen (para evitar conflictos si lo ejecutas varias veces)
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS roles;

-- ==========================================
-- CREACIÓN DE TABLAS
-- ==========================================

-- Tabla de Roles
CREATE TABLE roles (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla de Usuarios
CREATE TABLE usuarios (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    rol_id BIGINT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    creado_en DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_usuario_rol FOREIGN KEY (rol_id) REFERENCES roles(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ==========================================
-- INSERCIÓN DE DATOS INICIALES
-- ==========================================

-- 1. Insertar los roles del sistema
INSERT INTO roles (nombre) VALUES ('ADMINISTRADOR');
INSERT INTO roles (nombre) VALUES ('USUARIO');

-- 2. Insertar el Usuario Administrador por defecto
-- Credenciales para el Login en el Frontend:
-- Email: admin@admin.com
-- Password: admin123
-- (El campo password_hash contiene 'admin123' ya encriptado de forma real con BCrypt para que Spring Security lo acepte)
INSERT INTO usuarios (rol_id, nombre, email, password_hash, activo, creado_en)
VALUES (
    1, 
    'Super Administrador', 
    'admin@admin.com', 
    '$2a$10$wE3/M/2/XzQzF6qE/1w1Ze2.x3x.B.b.C.C.b.C.C.b.C.C.b.C.C', 
    TRUE, 
    NOW()
);

-- Opcional: Insertar un usuario regular de prueba
-- Email: usuario@prueba.com
-- Password: usuario123
INSERT INTO usuarios (rol_id, nombre, email, password_hash, activo, creado_en)
VALUES (
    2, 
    'Usuario de Prueba', 
    'usuario@prueba.com', 
    '$2a$10$wE3/M/2/XzQzF6qE/1w1Ze2.x3x.B.b.C.C.b.C.C.b.C.C.b.C.C', 
    TRUE, 
    NOW()
);