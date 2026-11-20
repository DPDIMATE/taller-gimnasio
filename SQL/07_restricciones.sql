SELECT id_membresia, valor_pagado, fecha_inicio, fecha_fin
FROM membresias
ORDER BY id_membresia;
-- 1. El valor pagado es obligatorio
ALTER TABLE membresias
ALTER COLUMN valor_pagado SET NOT NULL;

-- 2. El valor pagado debe ser mayor que cero
ALTER TABLE membresias
ADD CONSTRAINT membresias_valor_pagado_check
CHECK (valor_pagado > 0);

-- 3. La fecha de finalizacion debe ser posterior a la fecha de inicio
ALTER TABLE membresias
ADD CONSTRAINT membresias_fecha_inicio_fecha_fin_check
CHECK (fecha_fin > fecha_inicio);

-- 4. Un entrenador no puede dictar dos clases el mismo dia y a la misma hora
ALTER TABLE clases
ADD CONSTRAINT clases_id_entrenador_dia_semana_hora_key
UNIQUE (id_entrenador, dia_semana, hora);