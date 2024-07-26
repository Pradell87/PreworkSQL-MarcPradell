/* ## Ejercicio 4
## Nivel de dificultad: Experto
1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave
primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y
"id_producto" (entero, clave foránea de la tabla "Productos"). */
CREATE TABLE Pedidos (
  id SERIAL PRIMARY KEY,
  id_usuario INT,
  CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id)
  id_producto INT,
  CONSTRAINT fk_producto FOREIGN KEY (id_producto) REFERENCES public.productos(id)
)
;

/* 2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con
productos. */
INSERT INTO public.pedidos (id_usuario, id_producto)
VALUES  (1, 1),
        (1, 2),
        (1, 3)
;

/* 3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de
los productos que han comprado, incluidos aquellos que no han realizado
ningún pedido (utiliza LEFT JOIN y COALESCE). */
SELECT  us.nombre,
        COALESCE(pr.nombre, 'No ha comprado') as producto
FROM public.usuarios us
LEFT JOIN public.pedidos pe
ON us.id = pe.id_usuario
LEFT JOIN public.productos pr
ON pe.id_producto = pr.id
;

/* 4. Realiza una consulta que muestre los nombres de los usuarios que han
realizado un pedido, pero también los que no han realizado ningún pedido
(utiliza LEFT JOIN). */
SELECT us.nombre, pr.nombre as producto FROM public.usuarios us
LEFT JOIN public.pedidos pe
ON us.id = pe.id_usuario
LEFT JOIN public.productos pr
ON pe.id_producto = pr.id
;

/* 5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza
los registros existentes con un valor (utiliza ALTER TABLE y UPDATE) */
ALTER TABLE public.pedidos
ADD cantidad INT
;
UPDATE public.pedidos
SET cantidad = CASE
  WHEN id = 1 THEN 1
  WHEN id = 2 THEN 3
  WHEN id = 3 THEN 8
END
;