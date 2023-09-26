/* 1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico). */
CREATE TABLE Productos (
    id INT PRIMARY KEY,
    nombre TEXT,
    precio NUMERIC
);

/* 2. Inserta al menos cinco registros en la tabla "Productos". */
INSERT INTO Productos (id, nombre, precio) VALUES
    (1, 'Producto1', 10.99),
    (2, 'Producto2', 15.50),
    (3, 'Producto3', 29.99),
    (4, 'Producto4', 5.99),
    (5, 'Producto5', 49.99);

/* 3. Actualiza el precio de un producto en la tabla "Productos". */
UPDATE Productos SET precio = 12.99 WHERE id = 1;

/* 4. Elimina un producto de la tabla "Productos". */
DELETE FROM Productos WHERE id = 4;

/* 5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos"). */
SELECT U.nombre, P.nombre AS nombre_producto
FROM Usuarios U
INNER JOIN DetallesPedido DP ON U.id = DP.id_usuario
INNER JOIN Productos P ON DP.id_producto = P.id;
