USE ejercicio1;
-- Crear la tabla Cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    DNI VARCHAR(10),
    telefono VARCHAR(15),
    direccion VARCHAR(100)
);

-- Crear la tabla Factura
CREATE TABLE Factura (
    nroTicket INT PRIMARY KEY,
    total DECIMAL(10, 2),
    fecha DATE,
    hora TIME,
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);
-- Crear la tabla Producto
CREATE TABLE Producto (
    idProducto INT PRIMARY KEY,
    descripcion VARCHAR(100),
    precio DECIMAL(10, 2),
    nombreP VARCHAR(50),
    stock INT
);

-- Crear la tabla Detalle
CREATE TABLE Detalle (
    nroTicket INT,
    idProducto INT,
    cantidad INT,
    precioUnitario DECIMAL(10, 2),
    PRIMARY KEY (nroTicket, idProducto),
    FOREIGN KEY (nroTicket) REFERENCES Factura(nroTicket),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

