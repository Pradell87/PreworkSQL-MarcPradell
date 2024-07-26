/* ## Ejercicio 3
## Nivel de dificultad: Difícil
1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "precio" (numérico). */
CREATE TABLE Productos (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  precio INT
)
;

/* 2. Inserta al menos cinco registros en la tabla "Productos". */
INSERT INTO public.productos (nombre, precio)
VALUES  ('teclado', 10),
        ('ratón', 7),
        ('pantalla', 100),
        ('altavoces', 20),
        ('sobremesa', 500)
;

/* 3. Actualiza el precio de un producto en la tabla "Productos". */
UPDATE public.productos
SET precio = 15
WHERE id = 1
;

/* 4. Elimina un producto de la tabla "Productos". */
DELETE FROM public.productos
WHERE id = 4
;


/* 5. Realiza una consulta que muestre los nombres de los usuarios junto con los
nombres de los productos que han comprado (utiliza un INNER JOIN con la
tabla "Productos"). */
CREATE TABLE Compras (
  id SERIAL PRIMARY KEY,
  usuario_id INT,
  producto_id INT,
  cantidad INT
)
;
INSERT INTO public.compras (usuario_id, producto_id, cantidad)
VALUES 	(1, 1, 1),
		(1, 2, 3)
;
SELECT u.nombre as Nombre, p.nombre as Producto, c.cantidad as Cantidad FROM public.usuarios u
INNER JOIN public.compras c
ON u.id = c.usuario_id
INNER JOIN public.productos p
ON c.producto_id = p.id
;