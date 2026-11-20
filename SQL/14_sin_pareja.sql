-- P1. Entrenadores que no tienen clases asignadas
SELECT
    e.id_entrenador,
    e.nombre AS entrenador,
    e.especialidad
FROM entrenadores e
LEFT JOIN clases c
    ON e.id_entrenador = c.id_entrenador
WHERE c.id_clase IS NULL;

-- P2. Socios que nunca se han inscrito a una clase
SELECT
    s.documento,
    s.nombre AS socio,
    s.telefono
FROM socios s
LEFT JOIN inscripciones i
    ON s.documento = i.documento_socio
WHERE i.documento_socio IS NULL;

-- P3. Todos los socios con su ficha medica
SELECT
    s.documento,
    s.nombre AS socio,
    f.peso,
    f.estatura
FROM socios s
LEFT JOIN fichas_medicas f
    ON s.documento = f.documento_socio
ORDER BY s.nombre;