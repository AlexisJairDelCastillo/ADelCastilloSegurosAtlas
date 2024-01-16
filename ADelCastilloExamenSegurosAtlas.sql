CREATE DATABASE ADelCastilloExamenSegurosAtlas

USE ADelCastilloExamenSegurosAtlas


-----Ejercicio Almacen
CREATE TABLE Almacen(
	Producto VARCHAR(50),
	Tipo char,
	Precio decimal(10,2)
)

INSERT INTO Almacen VALUES('Refresco', 'A', 20.50), ('Frituras', 'B', 18), ('Cigarros', 'B', 75), ('Agua', 'A', 12), ('Chocolate', 'B', 17.50)
SELECT * FROM Almacen

--Nombre del producto mas caro
SELECT TOP 1 Producto FROM Almacen
ORDER BY Precio DESC

--Cantidad de productos para cada tipo
SELECT Tipo, COUNT(*) AS Cantidad FROM Almacen
GROUP BY Tipo

--Producto mas barato del tipo B
SELECT TOP 1 Producto FROM Almacen
WHERE Tipo = 'B'
ORDER BY Precio ASC


-----Ejercicio Agencia de Carros
CREATE TABLE Agencia(
	IdAgencia INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(50),
	Direccion VARCHAR(100),
	Ciudad VARCHAR(50)
)

CREATE TABLE Carro(
	IdCarro INT PRIMARY KEY IDENTITY(1,1),
	Marca VARCHAR(50),
	Modelo VARCHAR(50),
	Anio INT,
	Precio DECIMAL(10,2)
)

CREATE TABLE Inventario(
	IdInventario INT PRIMARY KEY IDENTITY(1,1),
	IdAgencia INT FOREIGN KEY REFERENCES Agencia(IdAgencia),
	IdCarro INT FOREIGN KEY REFERENCES Carro(IdCarro)
)


-----Total de Vec¿hiculos por Marca
CREATE TABLE s00_cat_marcas(
	cve_marca INT PRIMARY KEY IDENTITY(1,1),
	des_marca VARCHAR(50),
	cve_clasif INT
)

CREATE TABLE s00_cat_vehiculos(
	cve_marca INT FOREIGN KEY REFERENCES s00_cat_marcas(cve_marca),
	cve_vehiculo INT PRIMARY KEY IDENTITY(1,1),
	des_vehiculo VARCHAR(50),
	estatus bit
)

INSERT INTO s00_cat_marcas VALUES('BMW', 1), ('Audi', 2), ('Mazda', 3)
SELECT * FROM s00_cat_marcas

INSERT INTO s00_cat_vehiculos VALUES(1, 'Carrito BMW', 1), (2, 'Carrito Audi', 0), (1, 'Otro carrito BMW', 1)
SELECT * FROM s00_cat_vehiculos

SELECT s00_cat_marcas.cve_marca, des_marca, COUNT(cve_vehiculo) AS TotalVehiculos FROM s00_cat_marcas
	INNER JOIN s00_cat_vehiculos ON s00_cat_marcas.cve_marca = s00_cat_vehiculos.cve_marca
GROUP BY s00_cat_marcas.cve_marca, s00_cat_marcas.des_marca