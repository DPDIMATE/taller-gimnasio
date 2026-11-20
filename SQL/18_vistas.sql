
-- T1. Vista de socios con la ultima membresia vencida
CREATE VIEW socios_vencidos AS
SELECT
    s.documento,
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
HAVING MAX(m.fecha_fin) < CURRENT_DATE;

-- T2. Vista de ocupacion de clases activas
CREATE VIEW ocupacion_clases AS
SELECT
    c.id_clase,
    c.nombre AS clase,
    c.dia_semana,
    c.hora,
    c.cupo,
    COUNT(i.documento_socio) AS inscritos
FROM clases c
LEFT JOIN inscripciones i
    ON c.id_clase = i.id_clase
WHERE c.estado = 'activa'
GROUP BY
    c.id_clase,
    c.nombre,
    c.dia_semana,
    c.hora,
    c.cupo;

-- T3. Socios vencidos que aceptan WhatsApp
SELECT *
FROM socios_vencidos
WHERE acepta_whatsapp = 'si';

-- T3. Cupos disponibles por clase
SELECT
    clase,
    dia_semana,
    hora,
    cupo - inscritos AS cupos_disponibles
FROM ocupacion_clases
ORDER BY cupos_disponibles ASC;
