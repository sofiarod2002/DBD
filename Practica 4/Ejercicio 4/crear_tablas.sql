-- Crear bd y tablas

CREATE DATABASE ejercicio4;

-- Definición de la tabla PERSONA
CREATE TABLE PERSONA (
    DNI INT PRIMARY KEY,
    Apellido VARCHAR(255),
    Nombre VARCHAR(255),
    Fecha_Nacimiento DATE,
    Estado_Civil VARCHAR(50),
    Genero VARCHAR(50)
);

-- Definición de la tabla ALUMNO
CREATE TABLE ALUMNO (
    DNI INT PRIMARY KEY,
    Legajo VARCHAR(50),
    Año_Ingreso INT
);

-- Definición de la tabla PROFESOR
CREATE TABLE PROFESOR (
    DNI INT PRIMARY KEY,
    Matricula VARCHAR(50),
    Nro_Expediente VARCHAR(50)
);

-- Definición de la tabla TITULO
CREATE TABLE TITULO (
    Cod_Titulo INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Descripcion TEXT
);

-- Definición de la tabla TITULO-PROFESOR
CREATE TABLE TITULO_PROFESOR (
    Cod_Titulo INT,
    DNI INT,
    Fecha DATE,
    FOREIGN KEY (Cod_Titulo) REFERENCES TITULO(Cod_Titulo),
    FOREIGN KEY (DNI) REFERENCES PROFESOR(DNI)
);

-- Definición de la tabla CURSO
CREATE TABLE CURSO (
    Cod_Curso INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Descripcion TEXT,
    Fecha_Creacion DATE,
    Duracion INT
);

-- Definición de la tabla ALUMNO-CURSO
CREATE TABLE ALUMNO_CURSO (
    DNI INT,
    Cod_Curso INT,
    Año INT,
    Desempeño VARCHAR(50),
    Calificacion FLOAT,
    FOREIGN KEY (DNI) REFERENCES ALUMNO(DNI),
    FOREIGN KEY (Cod_Curso) REFERENCES CURSO(Cod_Curso)
);

-- Definición de la tabla PROFESOR-CURSO
CREATE TABLE PROFESOR_CURSO (
    DNI INT,
    Cod_Curso INT,
    Fecha_Desde DATE,
    Fecha_Hasta DATE,
    FOREIGN KEY (DNI) REFERENCES PROFESOR(DNI),
    FOREIGN KEY (Cod_Curso) REFERENCES CURSO(Cod_Curso)
);
