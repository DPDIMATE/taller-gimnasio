
-- M1. Cantidad de membresias por plan
SELECT p.nombre AS plan,
       COUNT(m.id_membresia) AS cantidad_membresias
FROM planes p
LEFT JOIN membresias m ON p.id_plan = m.id_plan
GROUP BY p.id_plan, p.nombre
ORDER BY cantidad_membresias DESC;

-- M2. Cantidad de inscritos por clase
SELECT c.id_clase,
       c.nombre AS clase,
       c.cupo,
       COUNT(i.documento_socio) AS cantidad_inscritos
FROM clases c
LEFT JOIN inscripciones i ON c.id_clase = i.id_clase
GROUP BY c.id_clase, c.nombre, c.cupo
ORDER BY c.id_clase;

-- M3. Clases con cuatro o mas inscritos
SELECT c.id_clase,
       c.nombre AS clase,
       COUNT(i.documento_socio) AS cantidad_inscritos
FROM clases c
LEFT JOIN inscripciones i ON c.id_clase = i.id_clase
GROUP BY c.id_clase, c.nombre
HAVING COUNT(i.documento_socio) >= 4
ORDER BY cantidad_inscritos DESC;

-- M4. Socios con dos o mas membresias
SELECT documento_socio,
       COUNT(*) AS cantidad_membresias
FROM membresias
GROUP BY documento_socio
HAVING COUNT(*) >= 2
ORDER BY cantidad_membresias DESC;

-- M5. Socios cuya ultima membresia ya vencio
SELECT documento_socio
FROM membresias
GROUP BY documento_socio
HAVING MAX(fecha_fin) < CURRENT_DATE
ORDER BY documento_socio;

-- M6. Total pagado por plan
SELECT p.nombre AS plan,
       SUM(m.valor_pagado) AS total_recaudado
FROM planes p
JOIN membresias m ON p.id_plan = m.id_plan
GROUP BY p.id_plan, p.nombre
ORDER BY total_recaudado DESC;
