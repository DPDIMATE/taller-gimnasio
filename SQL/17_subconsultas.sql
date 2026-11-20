
-- S1. Membresias que pagaron mas que el promedio
SELECT
    m.id_membresia,
    s.nombre AS socio,
    m.valor_pagado
FROM membresias m
INNER JOIN socios s
    ON m.documento_socio = s.documento
WHERE m.valor_pagado > (
    SELECT AVG(valor_pagado)
    FROM membresias
)
ORDER BY m.valor_pagado DESC;

-- S2. Socios inscritos en clases del entrenador 2
SELECT
    s.documento,
    s.nombre AS socio,
    s.telefono
FROM socios s
WHERE s.documento IN (
    SELECT i.documento_socio
    FROM inscripciones i
    INNER JOIN clases c
        ON i.id_clase = c.id_clase
    WHERE c.id_entrenador = 2
);

-- S3. Socios que nunca se han inscrito a una clase
SELECT
    s.documento,
    s.nombre AS socio,
    s.telefono
FROM socios s
WHERE s.documento NOT IN (
    SELECT documento_socio
    FROM inscripciones
);

-- S4. Revisar si documento_socio permite valores NULL
SELECT
    column_name,
    is_nullable
FROM information_schema.columns
WHERE table_name = 'inscripciones'
  AND column_name = 'documento_socio';
