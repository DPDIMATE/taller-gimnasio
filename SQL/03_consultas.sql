-- F1. Clases dictadas por el entrenador 1
SELECT nombre, dia_semana, hora
FROM clases
WHERE id_entrenador = 1;
-- F2. Membresias vencidas
SELECT id_membresia, documento_socio, fecha_fin
FROM membresias
WHERE fecha_fin < '2026-11-18';
-- F3. Planes con precio superior a 100000
SELECT nombre, precio
FROM planes
WHERE precio > 100000;
-- F4. Clases en las que esta inscrito el socio 1001
SELECT id_clase, fecha_inscripcion
FROM inscripciones
WHERE documento_socio = '1001';
-- F5. Analisis:
-- La consulta F2 muestra el documento del socio, pero no su nombre.
-- Para obtener el nombre necesitamos relacionar las tablas membresias y socios.