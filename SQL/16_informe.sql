-- Registrar la nueva clase Pilates
INSERT INTO clases
(id_entrenador, nombre, dia_semana, hora, cupo, estado)
VALUES
(1, 'Pilates', 'Viernes', '18:00', 12, 'activa');

-- R1. Socios cuya ultima membresia esta vencida
SELECT
    s.nombre AS socio,
    s.telefono,
    s.acepta_whatsapp,
    MAX(m.fecha_fin) AS fecha_vencimiento
FROM socios s
INNER JOIN membresias m
    ON s.documento = m.documento_socio
GROUP BY
    s.documento,
    s.nombre,
    s.telefono,
    s.acepta_whatsapp
HAVING MAX(m.fecha_fin) < CURRENT_DATE
ORDER BY fecha_vencimiento;

-- R2. Membresias vendidas y dinero recaudado por plan
SELECT
    p.nombre AS plan,
    COUNT(m.id_membresia) AS membresias_vendidas,
    COALESCE(SUM(m.valor_pagado), 0) AS dinero_recaudado
FROM planes p
LEFT JOIN membresias m
    ON p.id_plan = m.id_plan
GROUP BY p.id_plan, p.nombre
ORDER BY membresias_vendidas DESC;

-- R3. Ocupacion de las clases activas
SELECT
    c.nombre AS clase,
    c.dia_semana,
    c.hora,
    c.cupo,
    COUNT(i.documento_socio) AS inscritos
FROM clases c
LEFT JOIN inscripciones i
    ON c.id_clase = i.id_clase
WHERE c.estado = 'activa'
GROUP BY c.id_clase, c.nombre, c.dia_semana, c.hora, c.cupo
ORDER BY c.dia_semana, c.hora;

-- R4. Clases que ya llenaron su cupo
SELECT
    c.nombre AS clase,
    c.cupo,
    COUNT(i.documento_socio) AS inscritos
FROM clases c
LEFT JOIN inscripciones i
    ON c.id_clase = i.id_clase
WHERE c.estado = 'activa'
GROUP BY c.id_clase, c.nombre, c.cupo
HAVING COUNT(i.documento_socio) >= c.cupo;