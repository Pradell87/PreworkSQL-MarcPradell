/* ## Ejercicio 2
1. Crea una base de datos llamada "MiBaseDeDatos". */
CREATE DATABASE MiBaseDeDatos
;

/* 2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "edad" (entero). */
CREATE TABLE Usuarios (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  edad INT
)
;

/* 3. Inserta dos registros en la tabla "Usuarios". */
INSERT INTO public.usuarios (nombre, edad)
VALUES  ('Juan', 30),
        ('Elvira', 55)
;

/* 4. Actualiza la edad de un usuario en la tabla "Usuarios". */
UPDATE public.usuarios
SET edad = 25
WHERE id = 1
;

/* 5. Elimina un usuario de la tabla "Usuarios". */
DELETE FROM public.usuarios
WHERE id = 2
;

/* ## Nivel de dificultad: Moderado 
1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "pais" (texto). */
CREATE TABLE Ciudades (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  pais VARCHAR(255)
)
;

/* 2. Inserta al menos tres registros en la tabla "Ciudades". */
INSERT INTO public.ciudades (nombre, pais)
VALUES  ('Lleida', 'España'),
        ('Barcelona', 'España'),
        ('París', 'Francia'),
        ('Roma', 'Italia'),
        ('Berlín', 'Alemania')
;


/* 3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id"
de la tabla "Ciudades". */
ALTER TABLE public.usuarios
ADD ciudad_id INT,
ADD CONSTRAINT ciudad_fk FOREIGN KEY (ciudad_id) REFERENCES public.ciudades(id)
;

/* 4. Realiza una consulta que muestre los nombres de los usuarios junto con el
nombre de su ciudad y país (utiliza un LEFT JOIN). */
SELECT u.nombre, c.nombre as ciudad FROM public.usuarios u
LEFT JOIN public.ciudades c
ON u.ciudad_id = c.id
;

/* 5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad
asociada (utiliza un INNER JOIN). */
SELECT * FROM public.usuarios u
INNER JOIN public.ciudades c
ON u.ciudad_id = c.id
;