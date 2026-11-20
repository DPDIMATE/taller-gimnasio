-- L1. Total de socios y socios con correo
SELECT COUNT(*) AS total_socios,
       COUNT(correo) AS socios_con_correo
FROM socios;

-- L2. Total recaudado por membresias iniciadas en noviembre
SELECT SUM(valor_pagado) AS total_recaudado
FROM membresias
WHERE fecha_inicio >= '2026-11-01'
  AND fecha_inicio < '2026-12-01';

-- L3. Valor minimo, maximo y promedio pagado
SELECT MIN(valor_pagado) AS valor_minimo,
       MAX(valor_pagado) AS valor_maximo,
       ROUND(AVG(valor_pagado)) AS valor_promedio
FROM membresias;

-- L4. Total de membresias y socios diferentes
SELECT COUNT(*) AS total_membresias,
       COUNT(DISTINCT documento_socio) AS socios_distintos
FROM membresias;