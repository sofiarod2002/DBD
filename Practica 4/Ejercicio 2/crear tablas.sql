-- Crear la base de datos
CREATE DATABASE ejercicio2;

-- Usar la base de datos
USE ejercicio2;

-- Crear la tabla AGENCIA
CREATE TABLE AGENCIA (
    razon_social VARCHAR(255) NOT NULL,
    direccion VARCHAR(255),
    telef VARCHAR(20),
    email VARCHAR(100),
    PRIMARY KEY (razon_social)
);

-- Crear la tabla CIUDAD
CREATE TABLE CIUDAD (
    CODIGOPOSTAL INT NOT NULL,
    nombreCiudad VARCHAR(255),
    añoCreacion INT,
    PRIMARY KEY (CODIGOPOSTAL)
);

-- Crear la tabla CLIENTE
CREATE TABLE CLIENTE (
    DNI VARCHAR(20) NOT NULL,
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    telefono VARCHAR(20),
    direccion VARCHAR(255),
    PRIMARY KEY (DNI)
);

-- Crear la tabla VIAJE
CREATE TABLE VIAJE (
    FECHA DATE,
    HORA TIME,
    DNI VARCHAR(20),
    cpOrigen INT,
    cpDestino INT,
    razon_social VARCHAR(255),
    descripcion TEXT,
    FOREIGN KEY (cpOrigen) REFERENCES CIUDAD (CODIGOPOSTAL),
    FOREIGN KEY (cpDestino) REFERENCES CIUDAD (CODIGOPOSTAL),
    FOREIGN KEY (razon_social) REFERENCES AGENCIA (razon_social)
);
