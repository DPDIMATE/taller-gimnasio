-- O1. Membresias con nombre del socio y nombre del plan
SELECT
    m.id_membresia,
    s.nombre AS socio,
    p.nombre AS plan,
    m.fecha_inicio,
    m.fecha_fin,
    m.valor_pagado
FROM membresias m
INNER JOIN socios s
    ON m.documento_socio = s.documento
INNER JOIN planes p
    ON m.id_plan = p.id_plan
ORDER BY m.fecha_inicio ASC;

-- O2. Clases activas con el nombre del entrenador
SELECT
    c.nombre AS clase,
    e.nombre AS entrenador,
    c.dia_semana,
    c.hora
FROM clases c
INNER JOIN entrenadores e
    ON c.id_entrenador = e.id_entrenador
WHERE c.estado = 'activa'
ORDER BY c.dia_semana, c.hora;