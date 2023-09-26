/* 1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos"). */
CREATE TABLE Pedidos (
    id INT PRIMARY KEY,
    id_usuario INT REFERENCES Usuarios(id),
    id_producto INT REFERENCES Productos(id)
);

/* 2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos. */
INSERT INTO Pedidos (id, id_usuario, id_producto) VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 2, 3);

/* 3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE). */
SELECT U.nombre, COALESCE(P.nombre, 'Ninguno') AS nombre_producto
FROM Usuarios U
LEFT JOIN Pedidos PD ON U.id = PD.id_usuario
LEFT JOIN Productos P ON PD.id_producto = P.id;

/* 4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN). */
SELECT U.nombre
FROM Usuarios U
LEFT JOIN Pedidos PD ON U.id = PD.id_usuario
WHERE PD.id_usuario IS NOT NULL;

/* 5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE). */
ALTER TABLE Pedidos ADD cantidad INT;
UPDATE Pedidos SET cantidad = 1 WHERE id = 1;
UPDATE Pedidos SET cantidad = 2 WHERE id = 2;
UPDATE Pedidos SET cantidad = 3 WHERE id = 3;
