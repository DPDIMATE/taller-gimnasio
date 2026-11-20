-- 1. Corregir el telefono de Laura Martinez

SELECT *
FROM socios
WHERE documento = '1001';

UPDATE socios
SET telefono = '5559999'
WHERE documento = '1001';


-- 2. Suspender la clase Spinning

SELECT *
FROM clases
WHERE id_clase = 3;

UPDATE clases
SET estado = 'suspendida'
WHERE id_clase = 3;


-- 3. Eliminar la membresia duplicada

SELECT *
FROM membresias
WHERE id_membresia = 9;

DELETE FROM membresias
WHERE id_membresia = 9;