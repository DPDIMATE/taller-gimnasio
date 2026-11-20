-- Q1. Horario del socio 1001 con sus clases activas
SELECT
    s.nombre AS socio,
    c.nombre AS clase,
    c.dia_semana,
    c.hora,
    e.nombre AS entrenador
FROM socios s
INNER JOIN inscripciones i
    ON s.documento = i.documento_socio
INNER JOIN clases c
    ON i.id_clase = c.id_clase
INNER JOIN entrenadores e
    ON c.id_entrenador = e.id_entrenador
WHERE s.documento = '1001'
  AND c.estado = 'activa'
ORDER BY c.dia_semana, c.hora;

-- Q2. Socios inscritos en clases suspendidas
SELECT
    c.nombre AS clase,
    s.nombre AS socio,
    s.telefono,
    s.acepta_whatsapp
FROM clases c
INNER JOIN inscripciones i
    ON c.id_clase = i.id_clase
INNER JOIN socios s
    ON i.documento_socio = s.documento
WHERE c.estado = 'suspendida';