-- K1. Membresias iniciadas en septiembre u octubre de 2026
SELECT id_membresia, documento_socio, fecha_inicio
FROM membresias
WHERE fecha_inicio >= '2026-09-01'
  AND fecha_inicio < '2026-11-01'
ORDER BY fecha_inicio ASC;

-- K2. Clases de Spinning
SELECT id_clase, nombre, dia_semana, hora
FROM clases
WHERE LOWER(nombre) = 'spinning';

-- K3. Socios sin correo electronico
SELECT documento, nombre, telefono
FROM socios
WHERE correo IS NULL;

-- K4. Clases activas de lunes o miercoles
SELECT id_clase, nombre, dia_semana, estado
FROM clases
WHERE estado = 'activa'
  AND (dia_semana = 'Lunes' OR dia_semana = 'Miercoles');

-- K5. Las tres membresias con mayor valor pagado
SELECT id_membresia AS membresia,
       documento_socio AS socio,
       valor_pagado AS pagado
FROM membresias
ORDER BY valor_pagado DESC, id_membresia ASC
LIMIT 3;

-- K6. Dias diferentes en los que hay clases
SELECT DISTINCT dia_semana
FROM clases
ORDER BY dia_semana;