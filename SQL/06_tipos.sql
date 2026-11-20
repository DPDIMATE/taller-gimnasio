-- valor realmente pagado por cada membresia
ALTER TABLE membresias
ADD COLUMN valor_pagado NUMERIC(10,2);
-- valor pagado por cada membresia
UPDATE membresias SET valor_pagado = 80000 WHERE id_membresia = 1;

UPDATE membresias SET valor_pagado = 200000 WHERE id_membresia = 2;

UPDATE membresias SET valor_pagado = 390000 WHERE id_membresia = 3;

UPDATE membresias SET valor_pagado = 80000 WHERE id_membresia = 4;

UPDATE membresias SET valor_pagado = 210000 WHERE id_membresia = 5;

UPDATE membresias SET valor_pagado = 75000 WHERE id_membresia = 6;

UPDATE membresias SET valor_pagado = 390000 WHERE id_membresia = 7;

UPDATE membresias SET valor_pagado = 80000 WHERE id_membresia = 8;
-- columna para indicar si el socio acepta WhatsApp
ALTER TABLE socios
ADD COLUMN acepta_whatsapp VARCHAR(2) NOT NULL DEFAULT 'no';
-- socios que aceptan mensajes por WhatsApp
UPDATE socios
SET acepta_whatsapp = 'si'
WHERE documento IN ('1001', '1003', '1005');
-- tipos de datos de la tabla membresias
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'membresias'
ORDER BY ordinal_position;